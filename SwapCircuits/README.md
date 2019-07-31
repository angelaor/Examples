# SwapCircuits - ```Swap-VNets.ps1```

## Overview
This script provides an example of how to migrate VNet connections from one ExpressRoute Circuit to another one.

At its highest level the script Validates all resources, adds new connections, and deletes the old connections.

## Script Video
<a href="http://www.youtube.com/watch?feature=player_embedded&v=xydl0FUcYog
" target="_blank"><img src="http://img.youtube.com/vi/xydl0FUcYog/0.jpg" 
alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" /></a>

## High Level Flow
1. User must update array values described below
2. Both ER circuit must be provisioned, with Private Peering enabled
3. All gateways should be connected to the old circuit
4. Run script (```Swap-VNets.ps1```), which do the following:

    4.1. Validate required resources are in an appropriate state

    4.2. Calculate the number of Authorizations are needed if VNets are in different subscriptions from the ExpressRoute Circuit

    4.3. Create any needed Authorizations on the new ExpressRoute circuit

    4.4. Create new connections between each VNet Gateway and the new ExpressRoute circuit, using an Authorization if in another subscription from the new ExpressRoute circuit

    4.5. Evaluate if the new connection was successfull, if so remove the VNet Gateway connection to the old ExpressRoute circuit

5. Post-script run, manually review all connections to ensure all is as expected
6. Delete any auths from the old circuit
7. Old circuit may be de-provisioned and deleted if no longer in use

## Script Variables

Definitions below code block

### Code Block
``` PowerShell
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

```

### Scalar Variables
```$ShortRegion``` = the short Azure region name, e.g. westus2

```$newCircuitSub``` = the subscription GUID for the subscription containing the new ExpressRoute circuit

```$newCircuitRG``` = the resource group name containing the new ExpressRoute circuit

```$newCircuitName``` = the name of the new ExpressRoute circuit

### Array Variables
All array variable must contain the same number of elements and be in the same order. I.E. element 3 in all arrays should represent the values for a single VNet subscription, gateway, connection, etc

```$VNetSub``` = an array of the subscription GUID of the subscription containing each VNet

```$VNetRG``` = an array of the Resource Group name containing each VNet

```$VNetName``` = an array of the Name of each VNet

```$VNetGWName```  = an arrary of the ExpressRoute Gateway in each VNet

```$VNetOldConnName```  = an arrary of the old (existing) connection name to the old ExpressRoute circuit for each VNet

```$VNetNewConnName```  = an arrary of the new (to be created) connection name to the new ExpressRoute circuit for each VNet