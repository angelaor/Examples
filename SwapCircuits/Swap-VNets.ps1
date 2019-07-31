# Swap VNet Connections
# 1. Initialize and Validate
# 2. Create new auths on new circuit
# 3. Loop through each VNet
#    3.1 Switch context to target subcription
#    3.2 Add new connection to Gateway
# 4. Loop through each VNet
#    4.1 Switch context to target subcription
#    4.2 Check that new connection is successful
#    4.3 Remove connection from old circuit
# 5. Do a happy dance
#

[CmdletBinding()]
param (
    [switch]$Help=$false,
    [switch]$ValidateOnly=$false)

If ($Help) {
$Message = @"

.\Swap-VNets.ps1 [-Help | -ValidateOnly]

This script will move connected ExpressRoute gateways from one ExpressRoute
circuit "old" to another "new". It will bring up connections on the new
circuit first and ensure success before deleting the old connections. If
the new connections are in other subscritpions, new ExpressRoute Authorizations
will be created on the new circuit. The objective of this maintenance is
minimal downtime (TCP sessions may restart or lose a single ping).

For this script to work certain things need to be in place:

1. The new circuit must be provisioned and private peering enabled
2. All gateways must exist and be created
3. The original ("old") connections should be connected to the gateways
4. In this script is a user defined values section, all variables should
   be updated to reflect the actual details of the components involved.

"@
Write-Host $Message
Return
}

# 1. Initialize and Validate
$StartTime = Get-Date

########################
#### User Defined Values
########################

$ShortRegion = "westus2"
$newCircuitSub = "yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy"
$newCircuitRG = "SEA-Cust46"
$newCircuitName = "SEA-Cust46-ER02"

$VNetSub = @('yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy',`  # 1st VNet (local)
             'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx',`  # 2nd VNet (cross-sub)
             'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx',`  # 3rd VNet (cross-sub)
             'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx',`  # 4th VNet (cross-sub)
             'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx')   # 5th VNet (cross-sub)

$VNetRG = @('SEA-Cust46',`                             # 1st VNet (local)
            'SEA-Cust46',`                             # 2nd VNet (cross-sub)
            'SEA-Cust46',`                             # 3rd VNet (cross-sub)
            'SEA-Cust46',`                             # 4th VNet (cross-sub)
            'SEA-Cust46')                              # 5th VNet (cross-sub)

$VNetName = @('SEA-Cust46-VNet01',`                    # 1st VNet (local)
              'C46-VNet01',`                           # 2nd VNet (cross-sub)
              'C46-VNet02',`                           # 3rd VNet (cross-sub)
              'C46-VNet03',`                           # 4th VNet (cross-sub)
              'C46-VNet04')                            # 5th VNet (cross-sub)

$VNetGWName  = @('SEA-Cust46-VNet01-gw-er',`           # 1st VNet (local)
                 'C46-VNet01-gw-er',`                  # 2nd VNet (cross-sub)
                 'C46-VNet02-gw-er',`                  # 3rd VNet (cross-sub)
                 'C46-VNet03-gw-er',`                  # 4th VNet (cross-sub)
                 'C46-VNet04-gw-er')                   # 5th VNet (cross-sub)

$VNetOldConnName  = @('SEA-Cust46-VNet01-gw-er-conn',` # 1st VNet (local)
                      'C46-VNet01-gw-er-conn',`        # 2nd VNet (cross-sub)
                      'C46-VNet02-gw-er-conn',`        # 3rd VNet (cross-sub)
                      'C46-VNet03-gw-er-conn',`        # 4th VNet (cross-sub)
                      'C46-VNet04-gw-er-conn')         # 5th VNet (cross-sub)

$VNetNewConnName  = @('SEA-Cust46-VNet01-gw-er-conn2', # 1st VNet (local)
                      'C46-VNet01-gw-er-conn2',`       # 2nd VNet (cross-sub)
                      'C46-VNet02-gw-er-conn2',`       # 3rd VNet (cross-sub)
                      'C46-VNet03-gw-er-conn2',`       # 4th VNet (cross-sub)
                      'C46-VNet04-gw-er-conn2')        # 5th VNet (cross-sub)

#########################
# End User Defined Values
#########################

Write-Host
Write-Host (Get-Date)'- ' -NoNewline
Write-Host "Begining resource validation" -ForegroundColor Cyan

# Login Validation
Write-Host "Validating:"
Write-Host "  Subscription 01 access......" -NoNewline
Write-Host "Checking" -NoNewline -ForegroundColor Yellow
Try {$Context = Set-AzContext -SubscriptionId $NewCircuitSub -ErrorAction Stop}
Catch {Write-Host "Failed  " -ForegroundColor Red
       Write-Warning "You are either not logged in, or don't have access to this subscription ($NewCircuitSub)"
       Return}
Write-Host "`b`b`b`b`b`b`b`bGood    " -ForegroundColor Green

For ($i=0;$i -lt $VNetName.Count;$i++) {
    Write-Host "  Subscription $(($i+2).ToString("00")) access......" -NoNewline
    Write-Host "Checking" -NoNewline -ForegroundColor Yellow
    Try {$Context = Set-AzContext -SubscriptionId $VNetSub[$i] -ErrorAction Stop}
    Catch {Write-Host "Failed  " -ForegroundColor Red
           Write-Warning "You are either not logged in, or don't have access to this subscription ($VNetSub[$i])"
           Return}
    Write-Host "`b`b`b`b`b`b`b`bGood    " -ForegroundColor Green
}

# New circuit Provision validation
Write-Host "  New circuit provisioned....." -NoNewline
Write-Host "Checking" -NoNewline -ForegroundColor Yellow
$Context = Set-AzContext -SubscriptionId $NewCircuitSub
$circuit = Get-AzExpressRouteCircuit -ResourceGroupName $newCircuitRG -Name $newCircuitName
If ($circuit.ServiceProviderProvisioningState -ne 'Provisioned') { 
    Write-Host "Failed  " -ForegroundColor Red
    Write-Warning 'The New ER Circuit has not been provisioned by the Service Provider, provision the circuit before running this script!'
    Return}
Write-Host "`b`b`b`b`b`b`b`bGood    " -ForegroundColor Green

# New Circuit Peering validation
Write-Host "  Private Peering enabled....." -NoNewline
Write-Host "Checking" -NoNewline -ForegroundColor Yellow
Try {Get-AzExpressRouteCircuitPeeringConfig -Name AzurePrivatePeering -ExpressRouteCircuit $circuit -ErrorAction Stop | Out-Null}
Catch {Write-Host "Failed  " -ForegroundColor Red
       Write-Warning 'The New ER Circuit does not have private peering enabled yet, Private Peering must be enabled before running this script!'
       Return}
Write-Host "`b`b`b`b`b`b`b`bGood    " -ForegroundColor Green

# Gateway validation
For ($i=0;$i -lt $VNetSub.Count;$i++){
    Write-Host "  Gateway $(($i+1).ToString("00")) ................." -NoNewline
    Write-Host "Checking" -NoNewline -ForegroundColor Yellow
    Set-AzContext -SubscriptionId $VNetSub[$i] -ErrorAction Stop | Out-Null
    $gw = Get-AzVirtualNetworkGateway -Name $VNetGWName[$i] -ResourceGroupName $VNetRG[$i]
    If ($gw.ProvisioningState -ne 'Succeeded') {
        Write-Host "Failed  " -ForegroundColor Red
        Write-Warning "The gateway on VNet Gateway $($VNetGWName[$i]) isn't provisioned, please wait for all gateways to complete."
        Return
    }
    Write-Host "`b`b`b`b`b`b`b`bGood    " -ForegroundColor Green
}

Write-Host (Get-Date)'- ' -NoNewline
Write-Host "Resource validation complete" -ForegroundColor Cyan
Write-Host

If ($ValidateOnly) {Return}

# Login to ER Sub
$Context = Set-AzContext -SubscriptionId $NewCircuitSub
Write-Host 'Using Subscription: ' -NoNewline
Write-Host $Context.Subscription.Name -ForegroundColor Green

# 2. Create new auths on new circuit
Write-Host (Get-Date)'- ' -NoNewline
Write-Host "Creating Auths on new ExpressRoute circuit" -ForegroundColor Cyan
$AuthsNeeded = ($VNetSub -ne $NewCircuitSub).Count
For ($i=0;$i -lt $VNetSub.Count;$i++){
    $Context = Set-AzContext -SubscriptionId $VNetSub[$i]
    Try {$Connection = Get-AzVirtualNetworkGatewayConnection -Name $VNetNewConnName[$i] -ResourceGroupName $VNetRG[$i] -ErrorAction Stop
         If ($VNetSub[$i] -ne $newCircuitSub -and $Connection.ProvisioningState -eq "Succeeded") {$AuthsNeeded--}}
    Catch {}
    $Context = Set-AzContext -SubscriptionId $NewCircuitSub
}

$ERSaveNeeded = $false
If ($circuit.Authorizations.AuthorizationUseStatus.Count -gt 0) {
    $AuthsAvailable = ($circuit.Authorizations.AuthorizationUseStatus -match "Available").Count
    $AuthMaxName = [int]($circuit.Authorizations.Name | Select-Object -Last 1).Substring(4,2)
}
Else {
    $AuthsAvailable = 0
    $AuthMaxName = 0
}

For ($i=1;$i -le ($AuthsNeeded-$AuthsAvailable);$i++) {
    Add-AzExpressRouteCircuitAuthorization -Name ("Auth" + ($i+$AuthMaxName).ToString("00")) -ExpressRouteCircuit $circuit | Out-Null
    $ERSaveNeeded = $true
}

If ($ERSaveNeeded) {
    Write-Host "  Authorizations created, saving circuit"
    Set-AzExpressRouteCircuit -ExpressRouteCircuit $circuit | Out-Null
}

$VNetAuth = @()
ForEach ($Auth in (Get-AzExpressRouteCircuit -ResourceGroupName $newCircuitRG -Name $newCircuitName).Authorizations) {
    If ($Auth.AuthorizationUseStatus -eq "Available") {$VNetAuth += $Auth.AuthorizationKey}
}
Write-Host "  $($VNetAuth.Count) auths available for use"

# 3. Loop through each VNet
$AuthCount = 0
For ($i=0;$i -lt $VNetSub.Count;$i++){
    Write-Host
    Write-Host "----------------------------------------------------" -ForegroundColor Yellow
    Write-Host
    Write-Host (Get-Date)'- ' -NoNewline
    Write-Host " Adding connections to VNet $($VNetName[$i])"

    # 3.1 Switch context to target subcription
    $Context = Set-AzContext -SubscriptionId $VNetSub[$i]
    Write-Host '  Using Subscription: ' -NoNewline
    Write-Host $Context.Subscription.Name -ForegroundColor Green

    # 3.2 Add new connection to Gateway
    Write-Host "  Connecting Gateway to ExpressRoute"
    Try {Get-AzVirtualNetworkGatewayConnection -Name $VNetNewConnName[$i] -ResourceGroupName $VNetRG[$i] -ErrorAction Stop | Out-Null
        Write-Host '    resource exists, skipping'}
    Catch {
        $gw = Get-AzVirtualNetworkGateway -Name $VNetGWName[$i] -ResourceGroupName $VNetRG[$i]
        If ($gw.ProvisioningState -eq 'Succeeded') {
            If ($VNetSub[$i] -eq $newCircuitSub){
                New-AzVirtualNetworkGatewayConnection -Name $VNetNewConnName[$i] -ResourceGroupName $VNetRG[$i] `
                                                    -Location $ShortRegion -VirtualNetworkGateway1 $gw -ConnectionType ExpressRoute `
                                                    -PeerId $circuit.Id | Out-Null
            }
            Else {
                New-AzVirtualNetworkGatewayConnection -Name $VNetNewConnName[$i] -ResourceGroupName $VNetRG[$i] `
                                                    -Location $ShortRegion -VirtualNetworkGateway1 $gw -ConnectionType ExpressRoute `
                                                    -PeerId $circuit.Id -AuthorizationKey $VNetAuth[$AuthCount] | Out-Null
                $AuthCount++    
            }
        }
        Else {Write-Warning 'An issue occured with ER gateway provisioning.'
            Write-Host 'Current Gateway Provisioning State' -NoNewLine
            Write-Host $gw.ProvisioningState}
    }
    Write-Host
}

# 4. Loop through each VNet
For ($i=0;$i -lt $VNetName.Count;$i++){
    Write-Host
    Write-Host "----------------------------------------------------" -ForegroundColor Yellow
    Write-Host
    Write-Host (Get-Date)'- ' -NoNewline
    Write-Host " Removing old connections to VNet $($VNetName[$i])"

    # 4.1 Switch context to target subcription
    $Context = Set-AzContext -SubscriptionId $VNetSub[$i]
    Write-Host '  Using Subscription: ' -NoNewline
    Write-Host $Context.Subscription.Name -ForegroundColor Green

    # 4.2 Check that new connection is successful
    Try {Get-AzVirtualNetworkGatewayConnection -Name $VNetOldConnName[$i] -ResourceGroupName $VNetRG[$i] -ErrorAction Stop | Out-Null
        Try {$Connection = Get-AzVirtualNetworkGatewayConnection -Name $VNetNewConnName[$i] -ResourceGroupName $VNetRG[$i] -ErrorAction Stop
            If ($Connection.ProvisioningState -eq "Succeeded") {
                #  4.3 Remove connection from old circuit
                Try {Remove-AzVirtualNetworkGatewayConnection -Name $VNetOldConnName[$i] -ResourceGroupName $VNetRG[$i] -Force -ErrorAction Stop
                     Write-Host "  Removal of old connection succeeded"
                }
                Catch {Write-Warning "  Removal of old connection failed"
                }
            }
            Else {Write-Host "  New Connection was not successfull, removal of old connection skipped"
            }
        }
        Catch {Write-Host "  New Connection was not found, removal of old connection skipped"}
    }
    Catch {
        Write-Host "  Old connection not found, skipping"
    }
}

# End nicely
$EndTime = Get-Date
$TimeDiff = New-TimeSpan $StartTime $EndTime
$Mins = $TimeDiff.Minutes
$Secs = $TimeDiff.Seconds
$RunTime = '{0:00}:{1:00} (M:S)' -f $Mins,$Secs
Write-Host
Write-Host "----------------------------------------------------" -ForegroundColor Yellow
Write-Host
Write-Host (Get-Date)'- ' -NoNewline
Write-Host "Script completed" -ForegroundColor Green
Write-Host "  Time to complete: $RunTime"
Write-Host

