
[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, ValueFromPipeline = $true, HelpMessage = 'Enter Program Work Item ID')]
    [int]$ProgramID,
    [switch]$ValidateOnly=$false)


Function TaskMap() {
    # $TaskMap.Add("Task Name", "Phase Name")
    $TaskMap = @{}
    $TaskMap.Add("Complete and submit EG New SKU Request One Pager", "EG Request Phase")
    $TaskMap.Add("Complete Cloud Optimal review and SKU convergence analysis", "Concept Phase")
    $TaskMap.Add("Document prelim Business Case and Financial Success Metric", "Concept Phase")
    $TaskMap.Add("Complete prelim SKU configuration and verification", "Concept Phase")
    $TaskMap.Add("Complete Technology component availability check", "Concept Phase")
    $TaskMap.Add("Create high level schedule", "Concept Phase")
    $TaskMap.Add("Establish overall priority", "Concept Phase")
    $TaskMap.Add("Identify all DCSpec variations required for the Pilot", "Concept Phase")
    $TaskMap.Add("Create Planning SKU", "Concept Phase")
    $TaskMap.Add("Determine prelim HW qualification requirements", "Design Phase")
    $TaskMap.Add("Document Diagnostics & Telemetry Plan", "Design Phase")
    $TaskMap.Add("Determine SW/BIOS Requirements", "Design Phase")
    $TaskMap.Add("Complete Networking questionnaire", "Design Phase")
    $TaskMap.Add("Determine prelim Software requirements", "Design Phase")
    $TaskMap.Add("Complete node level power & CFM analysis for rack elevation", "Design Phase")
    $TaskMap.Add("Define rack elevation (# of nodes per rack)", "Design Phase")
    $TaskMap.Add("Create the Pilot P1 SKU Doc (BOM)", "Design Phase")
    $TaskMap.Add("Complete QCL commodities assessment", "Design Phase")
    $TaskMap.Add("Approve DC Ops engagement and serviceability/support model", "Design Phase")
    $TaskMap.Add("Complete geo distribution analysis (Ring 1, Ring 2, Ring 3 etc.)", "Design Phase")
    $TaskMap.Add("Confirm Security requirements are met", "Design Phase")
    $TaskMap.Add("Complete P1 BOM Scrub", "Design Phase")
    $TaskMap.Add("Confirm Power Capping Capabilities", "Design Phase")
    $TaskMap.Add("Complete P1 BOM Component Multi-Sourcing & EOL Review", "Design Phase")
    $TaskMap.Add("Perform a Safety and Serviceability Review", "Design Phase")
    $TaskMap.Add("Complete the DC Compliance Matrix", "PPA Preparation Phase")
    $TaskMap.Add("Gain CapEx approval", "PPA Preparation Phase")
    $TaskMap.Add("Complete New, Unique, Different, Difficult (NUDD) analysis", "PPA Preparation Phase")
    $TaskMap.Add("DCIS-Platform L6-L10 Operations Serviceability Review", "PPA Preparation Phase")
    $TaskMap.Add("Draft pre-dock requirements", "PPA Preparation Phase")
    $TaskMap.Add("Determine prelim New Technology Deployment Requirements", "PPA Preparation Phase")
    $TaskMap.Add("Determine production ramp plan and estimated production volumes for 6-12 months", "PPA Preparation Phase")
    $TaskMap.Add("Determine P2G Transition Start Date", "PPA Preparation Phase")
    $TaskMap.Add("Risk Buy analysis complete", "PPA Preparation Phase")
    $TaskMap.Add("Procure engineering samples for all teams", "PPA Preparation Phase")
    $TaskMap.Add("Lock System Integrator", "PPA Preparation Phase")
    $TaskMap.Add("Complete Network port mapping (MOR and TOR design)", "PPA Preparation Phase")
    $TaskMap.Add("Provide Air Flow and Power/Thermal tested values.  If tested values aren’t available estimates are acceptable.", "PPA Preparation Phase")
    $TaskMap.Add("DCIS-Platform PRD and Cluster Air Flow (CFM) and Power (KW) Review", "PPA Preparation Phase")
    $TaskMap.Add("DCIS-Platform Networking (TOR and MOR) Design Review", "PPA Preparation Phase")
    $TaskMap.Add("Review final Power Stranding Analysis", "PPA Preparation Phase")
    $TaskMap.Add("Conduct factory NUDD/Risk assessment", "PPA Preparation Phase")
    $TaskMap.Add("Complete Decommissioning review", "PPA Preparation Phase")
    $TaskMap.Add("Complete Resource Commitment", "PPA Preparation Phase")
    $TaskMap.Add("Complete project Risk Assessment", "PPA Preparation Phase")
    $TaskMap.Add("Complete end to end schedule based on Resource Commitments", "PPA Preparation Phase")
    $TaskMap.Add("Rolled-up MFG POR Plan from CHME team", "PPA Preparation Phase")
    $TaskMap.Add("Update POR document", "PPA Preparation Phase")
    $TaskMap.Add("Identify and Schedule BSL Core Changes", "PPA Preparation Phase")
    $TaskMap.Add("Confirm Automation & Tooling Requirements needed for Growth", "PPA Preparation Phase")
    $TaskMap.Add("Complete TAM Award", "Award/P2 Phase")
    $TaskMap.Add("Complete Cluster Template", "Award/P2 Phase")
    $TaskMap.Add("Lock HW Recipe", "Award/P2 Phase")
    $TaskMap.Add("Complete final COGS and Gross Margin analysis", "Award/P2 Phase")
    $TaskMap.Add("Lock CRD (SW/FW recipe)", "Award/P2 Phase")
    $TaskMap.Add("Draft CHME Quality plan", "Award/P2 Phase")
    $TaskMap.Add("Update to release MFG schedule on all clusters", "Award/P2 Phase")
    $TaskMap.Add("Quality and Qualification sign off", "Award/P2 Phase")
    $TaskMap.Add("Preliminary Super BOM ready", "Award/P2 Phase")
    $TaskMap.Add("Create the Pilot P2 SKU Doc (BOM)", "Award/P2 Phase")
    $TaskMap.Add("Conduct and approve Build Workshop of Rack and Blade", "Award/P2 Phase")
    $TaskMap.Add("Release CRD", "Award/P2 Phase")
    $TaskMap.Add("Finalize SOW if needed", "Build Prep Phase")
    $TaskMap.Add("Material Analysis on Delta and Allocation", "Build Prep Phase")
    $TaskMap.Add("Complete process readiness assessment", "Build Prep Phase")
    $TaskMap.Add("Approve & Release Pilot Racks PO to SI", "Build Prep Phase")
    $TaskMap.Add("Complete Final Schedule and MFG POR Program Plan", "Build Prep Phase")
    $TaskMap.Add("Develop manufacturing test tool", "Build Prep Phase")
    $TaskMap.Add("Review, approve, and publish CHME Test plan", "Build Prep Phase")
    $TaskMap.Add("Document firmware update processes and procedures", "Build Prep Phase")
    $TaskMap.Add("Review and approve SI extended test plan strategy", "Build Prep Phase")
    $TaskMap.Add("Conduct and approve FAI of Rack and Blade on Golden Rack", "Cluster Build and Test Phase")
    $TaskMap.Add("Give Clear To Build to SI (Golden Rack)", "Cluster Build and Test Phase")
    $TaskMap.Add("Complete Golden Rack build", "Cluster Build and Test Phase")
    $TaskMap.Add("Confirm all parts in at SI", "Cluster Build and Test Phase")
    $TaskMap.Add("Conduct L10 Power on testing at System Integrator", "Cluster Build and Test Phase")
    $TaskMap.Add("Complete, validate, and approve L10 and L11 Mfg Test on Golden Rack", "Cluster Build and Test Phase")
    $TaskMap.Add("Complete, validate, and approve extended Manufacturing Testing", "Cluster Build and Test Phase")
    $TaskMap.Add("Complete BSL development & release pkg to SI on Golden Rack", "Cluster Build and Test Phase")
    $TaskMap.Add("Review and resolve all Sev-1 / Sev-2 bugs", "Cluster Build and Test Phase")
    $TaskMap.Add("Review and disposition all Sev-3/ Sev-4 bugs", "Cluster Build and Test Phase")
    $TaskMap.Add("Document approval of all waivers and DC exceptions including manufacturing deviations if needed", "Cluster Build and Test Phase")
    $TaskMap.Add("Confirm all racks passed factory BSL validation", "Cluster Build and Test Phase")
    $TaskMap.Add("Approve and complete Volume Build", "Cluster Build and Test Phase")
    $TaskMap.Add("SI completes their Clear to Ship approval & ships racks", "Cluster Build and Test Phase")
    $TaskMap.Add("Create Seed file", "Clear to Dock Phase")
    $TaskMap.Add("Create NDT", "Clear to Dock Phase")
    $TaskMap.Add("Dock MOR", "Clear to Dock Phase")
    $TaskMap.Add("Dock NW Hardware", "Clear to Dock Phase")
    $TaskMap.Add("Confirm DC Readiness", "Clear to Dock Phase")
    $TaskMap.Add("Generate the cluster specific CSI work flow", "Clear to Dock Phase")
    $TaskMap.Add("Retrospective Checkpoint 1", "Clear to Dock Phase")
    $TaskMap.Add("Retrospective Checkpoint 2", "Engineering Pilot")
    $TaskMap.Add("Start P2G Transition Phase", "Pilot to Growth Wave 1")
    $TaskMap.Add("Ensure CapEx approval for Growth is granted", "Pilot to Growth Wave 1")
    $TaskMap.Add("Growth Risk Buy - Pre-position BOM materials for NUDD or long lead time", "Pilot to Growth Wave 1")
    $TaskMap.Add("Re-visit ramp strategy to validate it's defined and incorporated into CSP", "Pilot to Growth Wave 1")
    $TaskMap.Add("Ensure PRR (Part Replacement Rate) 0-100 days post-Live is within acceptable limits", "Pilot to Growth Wave 1")
    $TaskMap.Add("Manufacturing Test Engineering (MTE) Test plan has been modified and approved to incorporate any feedback from pilot cluster quality issues/escapes", "Pilot to Growth Wave 1")
    $TaskMap.Add("FAI findings are documented and closed", "Pilot to Growth Wave 1")
    $TaskMap.Add("No known Sev-1 / Sev-2 bugs without mitigation plans", "Pilot to Growth Wave 1")
    $TaskMap.Add("RMA Failure Analysis (FA) has been conducted on high PRR components, results are well understood and issues are mitigated", "Pilot to Growth Wave 1")
    $TaskMap.Add("Quality issues identified post-pilot dock are closed", "Pilot to Growth Wave 1")
    $TaskMap.Add("Environmental certification complete for the L11", "Pilot to Growth Wave 1")
    $TaskMap.Add("Any related RRP incidents are at ALARP or Low", "Pilot to Growth Wave 1")
    $TaskMap.Add("Country certification completed for all building blocks and FRUs", "Pilot to Growth Wave 1")
    $TaskMap.Add("Assembly/Disassembly/Service manual with safety warnings available", "Pilot to Growth Wave 1")
    $TaskMap.Add("Incorporate SKU into binding and non-binding forecasts to SI and sub-tier vendors", "Pilot to Growth Wave 1")
    $TaskMap.Add("All ECOs are integrated and released to SIs including BIOS/BMC/Commodity Firmware", "Pilot to Growth Wave 1")
    $TaskMap.Add("SKU Qualification Complete - SW recipe locked and qualified; HW qualified", "Pilot to Growth Wave 1")
    $TaskMap.Add("Sourcing BOM Ready", "Pilot to Growth Wave 1")
    $TaskMap.Add("Power/CFM tested values available in OnePDM", "Pilot to Growth Wave 1")
    $TaskMap.Add("Qualified hardware/SW entered into the QCL", "Pilot to Growth Wave 1")
    $TaskMap.Add("Sourcing Strategy – defined if different from standard", "Pilot to Growth Wave 1")
    $TaskMap.Add("All non-standard supply chain requirements have been addressed/mitigated", "Pilot to Growth Wave 1")
    $TaskMap.Add("Re-validate all new contracts are in place (e.g. ITPAC)", "Pilot to Growth Wave 1")
    $TaskMap.Add("All parts in BOM at PV or higher maturity in OnePDM", "Pilot to Growth Wave 1")
    $TaskMap.Add("Create production MSF's for all purchase level components and FRU items", "Pilot to Growth Wave 2")
    $TaskMap.Add("EG engineering sign-off on readiness before Production ramps", "Pilot to Growth Wave 2")
    $TaskMap.Add("All waivers have been completed or addressed before shipping from SI", "Pilot to Growth Wave 2")
    $TaskMap.Add("Review and confirm Ops Model readiness (spares and maintenance)", "Pilot to Growth Wave 2")
    $TaskMap.Add("DC Ops review including PVA (ensure GDCO tickets closed)", "Pilot to Growth Wave 2")
    $TaskMap.Add("All serviceability waivers for Pilot have been resolved or waived prior to growth", "Pilot to Growth Wave 2")
    $TaskMap.Add("Validate actual power consumption to specs and adjust rack elevation if necessary", "Pilot to Growth Wave 2")
    $TaskMap.Add("Safety risk assessment, reports, audits are completed", "Pilot to Growth Wave 2")
    $TaskMap.Add("If a new SI is being used, ensure the MPS enabled forecast ingestion and response is onboarded", "Pilot to Growth Wave 2")
    $TaskMap.Add("MRA enabled / capability onboarded at the SI", "Pilot to Growth Wave 2")
    $TaskMap.Add("Provide BOM change report (compare prior gen BOM compared with current gen BOM)", "Pilot to Growth Wave 2")
    $TaskMap.Add("Unique logistical requirements to support the product", "Pilot to Growth Wave 2")
    $TaskMap.Add("Completion of the operating procedures for this platform", "Pilot to Growth Wave 2")
    $TaskMap.Add("Ensure Platform level maturity and spec handoff to PDM engineering", "Pilot to Growth Wave 2")
    $TaskMap.Add("Growth SKUs Released", "Pilot to Growth Wave 2")
    $TaskMap.Add("BOM Risk Assessment - EOL, single source, and part risk", "Pilot to Growth Wave 2")
    $TaskMap.Add("Lead Times and ownership clearly identified, ready for ingestion in tools", "Pilot to Growth Wave 2")
    $TaskMap.Add("If an additional SI is being used, new SI part numbers need to be added", "Pilot to Growth Wave 2")
    $TaskMap.Add("If an additional SI is being used, the plan to qualify that SI needs to be in place for that L11 platform", "Pilot to Growth Wave 2")
    $TaskMap.Add("TAM Award for new Growth SKU", "Pilot to Growth Wave 2")
    $TaskMap.Add("Material positioned to hit current Growth PDD (to replace COS status for Growth Volume)", "Pilot to Growth Wave 2")
    $TaskMap.Add("Any SSCA findings are Closed / Deviations signed-off by Business", "Pilot to Growth Wave 3")
    $TaskMap.Add("Mission Control confirms RAPID Sign Off and P2G Transition Complete", "Pilot to Growth Wave 3")
    $TaskMap.Add("Ship Room waivers reviewed with long-term action plans agreed-to and approved", "Pilot to Growth Wave 3")
    $TaskMap.Add("Ensure all required telemetry is being collected", "Pilot to Growth Wave 3")
    $TaskMap.Add("Ensure No Open P0/P1 New Tech Bugs or Issues or incidents Exist", "Pilot to Growth Wave 3")
    $TaskMap.Add("Complete Tool Onboarding", "Pilot to Growth Wave 3")
    $TaskMap.Add("Validate Cycle Time", "Pilot to Growth Wave 3")
    $TaskMap.Add("Complete Transition Meeting between NTI and CSCP Deployment Teams", "Pilot to Growth Wave 3")
    $TaskMap.Add("Signal to dock PFAM LT", "Pilot to Growth Wave 3")
    $TaskMap.Add("Remove the program for the Hardware Stack Rank when Ramp starts", "Pilot to Growth Wave 3")
    $TaskMap.Add("Final Retrospective", "Pilot to Growth Wave 3")
    $TaskMap.Add("1", "Stabilization")
    $TaskMap.Add("2", "Production Pilot")

    Write-Output $TaskMap
}

Function DefinePhaseBody($PhaseName) {
    switch ($PhaseName) {
            "EG Request Phase" {
             $StackRank = "20"
             $PilotType = "Request"
             $Description = ""
             BuildPhaseBody($PhaseName)
             }
        "Concept Phase" {
             $StackRank = "40"
             $PilotType = "Concept"
             $Description = ""
             BuildPhaseBody($PhaseName)
             }
        "Design Phase" {
             $StackRank = "130"
             $PilotType = "Design"
             $Description = ""
             BuildPhaseBody($PhaseName)
             }
        "PPA Preparation Phase" {
             $StackRank = "280"
             $PilotType = "PPA Preparation"
             $Description = ""
             BuildPhaseBody($PhaseName)
             }
        "Award/P2 Phase" {
             $StackRank = "530"
             $PilotType = "Award/P2"
             $Description = ""
             BuildPhaseBody($PhaseName)
             }
        "Build Prep Phase" {
             $StackRank = "640"
             $PilotType = "Build Prep"
             $Description = ""
             BuildPhaseBody($PhaseName)
             }
        "Cluster Build and Test Phase" {
             $StackRank = "780"
             $PilotType = "Cluster Build and Test"
             $Description = ""
             BuildPhaseBody($PhaseName)
             }
        "Clear to Dock Phase" {
             $StackRank = "930"
             $PilotType = "Clear to Ship"
             $Description = ""
             BuildPhaseBody($PhaseName)
             }
        "Engineering Pilot" {
             $StackRank = "1000"
             $PilotType = "Engineering Pilot"
             $Description = ""
             BuildPhaseBody($PhaseName)
             }
        "Production Pilot" {
             $StackRank = "1010"
             $PilotType = "Production Pilot"
             $Description = ""
             BuildPhaseBody($PhaseName)
             }
        "Stabilization" {
             $StackRank = "1020"
             $PilotType = "Stabilization"
             $Description = ""
             BuildPhaseBody($PhaseName)
             }
        "Pilot to Growth Wave 1" {
             $StackRank = "1030"
             $PilotType = "Pilot to Growth Wave 1"
             $Description = ""
             BuildPhaseBody($PhaseName)
             }
        "Pilot to Growth Wave 2" {
             $StackRank = "1310"
             $PilotType = "Pilot to Growth Wave 2"
             $Description = "Assign to: CHIE D3+Services Team</br>Description: Ensure 'required telemetry' has been provided to MC PM Team by CHIE CHEE NPI team, updated for each 'type' of platform (resource group); while we want to ensure this is being collected, we have to signal the CHIE CHEE team to go collect it.</br>"
             BuildPhaseBody($PhaseName)
             }
        "Pilot to Growth Wave 3" {
             $StackRank = "1510"
             $PilotType = "Pilot to Growth Wave 3"
             $Description = ""
             BuildPhaseBody($PhaseName)
             }
    }
}

Function DefineTaskBody($TaskName) {
    switch ($TaskName) {
            "Complete and submit EG New SKU Request One Pager" {
             $StackRank = "30"
             $ResourceTeam = "EG Team"
             $Description = "Assign to: EG Team</br>Description: EG completes the Concept Proposal. The proposal is presented to the Mission Control V-Team for concurrence to move into the Concept Phase.  A concept Proposal template is located here:  https://microsoft.sharepoint.com/:w:/t/HSP/Ef6h_NoH19dHtlQ5AJNtjBsB1w-s9o5weLN402XrtLiUbA?e=4wBFSy</br>"
             BuildTaskBody($TaskName)
             }
        "Complete Cloud Optimal review and SKU convergence analysis" {
             $StackRank = "50"
             $ResourceTeam = "MC PM Team"
             $Description = "Assign to: MC PM Team</br>Description: Tail properties are required to complete a Cloud Optimal review to ensure that the SKU they want to develop and deploy cannot be run on Azure.  Cloud Optimal is a meeting/forum run by the Azure CTO (Mark Russ) that all 1P programs need to go through for their SKU level reviews.</br></br>"
             BuildTaskBody($TaskName)
             }
        "Document prelim Business Case and Financial Success Metric" {
             $StackRank = "60"
             $ResourceTeam = "Finance Team"
             $Description = "Assign to: Finance Team</br>Description: Ensure that the Business case is clearly enumerated and sufficient financial analysis is complete to make sure the program meets the financial success metric.</br>"
             BuildTaskBody($TaskName)
             }
        "Complete prelim SKU configuration and verification" {
             $StackRank = "70"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement PM Team (Team Lead is Dean O'Neill)Description: Enumerate the building blocks.  Identify disconnects on availability and/or functionality when the building blocks are combined into a solution </br>"
             BuildTaskBody($TaskName)
             }
        "Complete Technology component availability check" {
             $StackRank = "80"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement PM Team (Team lead is Dean O'Neill)Description: Identify any new components and when they will be available.  Ensure they meet the schedule or adjust the schedule.  Even if we can/cannot get the components, we need to close the Task.  It is conceptual approval with date range and not exact commitment dates yet.Who should close Task: Storage: Evan Chen, Yufei, Trish, Niket"
             BuildTaskBody($TaskName)
             }
        "Create high level schedule" {
             $StackRank = "90"
             $ResourceTeam = "MC PM Team"
             $Description = "Assign to: MC PM Team</br>Description: Create an initial schedule  (Sourcing complete, Pilot Live, Preview, and GA).  Should include standard SLA's & timelines and identify where the schedule does not meet EG expectations and/or requirements.</br>"
             BuildTaskBody($TaskName)
             }
        "Establish overall priority" {
             $StackRank = "100"
             $ResourceTeam = "EG Team"
             $Description = "Assign to: EG Team</br>Description: As we exit the Concept Phase we need to establish the priority of the program to allow us to fit it into the work schedule for various teams.</br>"
             BuildTaskBody($TaskName)
             }
        "Identify all DCSpec variations required for the Pilot" {
             $StackRank = "110"
             $ResourceTeam = "EG Team"
             $Description = "Assign to: EG Team</br>Description: To ensure that SKU Docs are created for all required DCSPec for the Pilot phase, enumerate them here.</br>"
             BuildTaskBody($TaskName)
             }
        "Create Planning SKU" {
             $StackRank = "120"
             $ResourceTeam = "PDM Team"
             $Description = "Assign to: PDM Team</br>Description: Work with the SKU Docs team to create the Planning SKU for all required DCSpec rack elevations.  Complete the checklist found here:</br></br> https://azurecsi.visualstudio.com/Product%20Data%20Management%20Team/_workitems/create/SKU%20Request</br></br></br>"
             BuildTaskBody($TaskName)
             }
        "Determine prelim HW qualification requirements" {
             $StackRank = "140"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement (Team lead is Dean O'Neill)</br>(Jim Shields' team for Microsoft Quals; Devender's team for SI Quals)</br>Description: Identify what components in the system require initial or additional Hardware Qualification before the SKU can exit Pilot.  We need to have an itemized list of testing needed for the Platform (e.g., Shock and vibe, Platform validation, System Validation, Qualification, etc).</br>Who Should Close this Task: Storage: Evan Chen, Yufie, Trish, Niket</br></br>"
             BuildTaskBody($TaskName)
             }
        "Document Diagnostics & Telemetry Plan" {
             $StackRank = "141"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement Team (Dean O'Neill)</br>Description: For Dev0 or Dev1 SKUs (buy model), document the plan for how diagnostics/telemetry will be handled.  For Dev2 or Dev3 SKUs (Microsoft designed SKUs), ensure the diagnostics/telemetry plan was documented at BOP (Team Lead Jeffrey Lai).</br>Goals: The goal of this task is to understand what the diagnostics plan is up-front; we need to know how the tickets will get cut, how it will get serviced; once in the fleet, how break-fix will work.</br>"
             BuildTaskBody($TaskName)
             }
        "Determine SW/BIOS Requirements" {
             $StackRank = "142"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement (Team lead is Dean O'Neill)</br>Description: Identify the applicable SW/BIOS/Operationalization requirements and update them in the SW/BIOS/Operationalization POR slide.</br>Who should close Task: Storage : Evan Chen, Yufei, Trish, Niket</br>"
             BuildTaskBody($TaskName)
             }
        "Complete Networking questionnaire" {
             $StackRank = "150"
             $ResourceTeam = "MC PM Team"
             $Description = "Assign to: EG Team (EG Team Lead: varies)</br>Description:</br></br> *  Submit a request to Azure Networking's PPA Approval Status Dashboard. </br> *  Click on the link labeled 'New'. *  Enter information into the fields on the table that appears on the right side of the screen.</br> *  NOTE: Includes the Switch selection. This Task will only be closed after the Networking Questionnaire is approved (conditionally or without conditions).</br> *  Link: https://microsoft.sharepoint.com/teams/NetworkHardwarePMO/hardwarequalification/Lists/PPA%20Approval%20Status%20Dashboard/AllItems.aspx?viewpath=/teams/NetworkHardwarePMO/hardwarequalification/Lists/PPA%20Approval%20Status%20Dashboard/AllItems.aspx</br></br>"
             BuildTaskBody($TaskName)
             }
        "Determine prelim Software requirements" {
             $StackRank = "160"
             $ResourceTeam = "EG Team"
             $Description = "Assign to: EG PM (EG PM Team: varies)</br>Description: Enumerate all software and software version requirements  (OS, Fabric, MOS, BSL).</br>Assign to EG PM</br>Who should close Task: Storage : Evan Chen, Yufie, Trish, Niket</br>"
             BuildTaskBody($TaskName)
             }
        "Complete node level power & CFM analysis for rack elevation" {
             $StackRank = "180"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement  (Team Lead is Dean O'Neill)</br>Description: Complete calculated or actual node-level power analysis based on EG requirements. Identify in ADO if this is calculated or actual.</br>"
             BuildTaskBody($TaskName)
             }
        "Define rack elevation (# of nodes per rack)" {
             $StackRank = "190"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement  (Team Lead is Dean O'Neill)</br>Description: Define total Memory, Storage, CPU type, PDUs, etc.  Define how many nodes can fit on a rack based on node-level power estimate (Planning SKU stage - need to know deployment model for mass production (EG's deployment model with capacity planning have a plan for DC 103 for example).</br></br></br>"
             BuildTaskBody($TaskName)
             }
        "Create the Pilot P1 SKU Doc (BOM)" {
             $StackRank = "200"
             $ResourceTeam = "PDM Team"
             $Description = "Assign to: PDM Team </br>Description: Identify and complete Pilot P1 BOM including all required DCSpec variations.    Complete the checklist found here:</br> </br>P1 BOM Request (SKU Request ticket):</br>https://azurecsi.visualstudio.com/Product%20Data%20Management%20Team/_workitems/create/SKU%20Request</br></br> </br>"
             BuildTaskBody($TaskName)
             }
        "Complete QCL commodities assessment" {
             $StackRank = "210"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement (Team Lead is Dean O'Neill)</br>Description: Ensure all Commodities are in QCL or part of the qualification plan for the Platform. While QCL lives in OnePDM now and PDM Team is responsible for entering it, CHIE Enablement is still responsible for signaling PDM team to do it.</br>Who should close Task: Storage : Evan Chen, Yufie, Trish, Niket</br>"
             BuildTaskBody($TaskName)
             }
        "Approve DC Ops engagement and serviceability/support model" {
             $StackRank = "220"
             $ResourceTeam = "CO and I"
             $Description = "Assign to: CO and I Team</br>Description: Ensure DC Ops reviews and signs off on serviceability/ support model (i.e. Ops model, costs, spares, and warranty).  MUST BE APPROVED BY DCIS-Platform team.</br>"
             BuildTaskBody($TaskName)
             }
        "Complete geo distribution analysis (Ring 1, Ring 2, Ring 3 etc.)" {
             $StackRank = "230"
             $ResourceTeam = "Capacity Planning"
             $Description = "Assign to: Capacity Planning Team</br>Description: Identify the SKU distribution from a global perspective and identify any outstanding issues that need to be addressed before the SKU can be deployed in that Region.</br>"
             BuildTaskBody($TaskName)
             }
        "Confirm Security requirements are met" {
             $StackRank = "240"
             $ResourceTeam = "EG Team"
             $Description = "Assign to: EG Team</br>Description: Ensure the Security Requirements are captured on the SW/BIOS/Ops Requirements slide in the PPA deck.  Ensure Security V-team member has reviewed the POR. </br>"
             BuildTaskBody($TaskName)
             }
        "Complete P1 BOM Scrub" {
             $StackRank = "250"
             $ResourceTeam = "CHME Material Team"
             $Description = "Assign to: CHME Materials Team (team lead Tim Martin)</br>Description: Material Readiness team leads P1 BOM Scrub after P1 BOM is released.</br>Task Pre-requisites:</br>     - Please make sure P1 BOM released before assigning the task</br>     - Please provide MSPN in the task Description.</br></br>"
             BuildTaskBody($TaskName)
             }
        "Confirm Power Capping Capabilities" {
             $StackRank = "260"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement  (Team Lead is Dean O'Neill)</br>Description: Complete the Power Capping Questionnaire.  CHIE Enablement to ensure that the Brandon Rubenstein's Extended Staff alias has reviewed and completed this document.  Power Capping PPA Questionnaire.</br></br>Link: https://microsoft.sharepoint.com/:x:/t/HSP/EXoOX_9uLwNKqI25v2AkUYkBp2V1qFaC-l_0L1S4g2v3Bg?e=FNYUvx</br>"
             BuildTaskBody($TaskName)
             }
        "Complete P1 BOM Component Multi-Sourcing & EOL Review" {
             $StackRank = "270"
             $ResourceTeam = "CSCP Sourcing-ISP"
             $Description = "Assign to: CSCP ISP Team (Team Lead Aruna Sharma)</br>Description: This task is to verify there are no EOL components in the P1 BOM and to conduct a Multi-Sourcing Analysis as well.  For Compute, Specialty Compute, Cosmos, and Storage programs assign to Julie Church.  For all others, ask Julie who.</br></br>"
             BuildTaskBody($TaskName)
             }
        "Perform a Safety and Serviceability Review" {
             $StackRank = "271"
             $ResourceTeam = "Safety and Serviceability Team"
             $Description = "Assign to: CHIE SSC Team (Team Lead - Michele Falcon)</br>Description: Cloud Hardware shall be integrated only with equipment and components compliant with the safety, serviceability, and certification requirements of the destination country/region. This task will review the relevant SSC requirements for PPA Preparation.</br></br>Required for this task: NUDD analysis, and list of countries to which the Pilot HW will be shipping.</br>Desired for this task: P1 BOM; the list of countries to which the Pilot & Growth HW will be shipping.</br></br>Task should be assigned to Paul Schindler (PASCHIND) or the SSC Team. </br></br>Move to Design Phase</br></br>Who should close the Task: Paul Schindler</br>"
             BuildTaskBody($TaskName)
             }
        "Complete the DC Compliance Matrix" {
             $StackRank = "300"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement PM (Dean O'Neill)</br>Description: Please use the DC Compliance Matrix template to engage the CSI Safety, Security, & Compliance team.  Copy the template to your Mission Control folder and complete it.  Notify the email the DCIS HW Platforms team when done so they can acknowledge same.</br></br>Link: https://microsoft.sharepoint.com/:x:/t/HSP/EeI23mnG-9BDnTn8A0wpaVAB0rUmnHRlDSA1L4LN7Xf01Q?e=8y21Gl</br>"
             BuildTaskBody($TaskName)
             }
        "Gain CapEx approval" {
             $StackRank = "310"
             $ResourceTeam = "Capacity Planning"
             $Description = "Assign to: Capacity Planning</br>Description: CP takes the SKU to Cap Council for approval</br>"
             BuildTaskBody($TaskName)
             }
        "Complete New, Unique, Different, Difficult (NUDD) analysis" {
             $StackRank = "320"
             $ResourceTeam = "MC PM Team"
             $Description = "Assign to: MC PM Team</br>Description: Ensure all new component requirements are understood to anticipate the potential impact.  CHME Quality team performs NUDD assessment for quality, test, manufacturing engineering. Attach assessment to the task.  This is the initial NUDD analysis that identifies the elements that differentiate this from previous designs and make this NPI.  Aaron Roughton will delegate this task to someone on his team based on the SI.  Note: This includes the build-out method (e.g., Add Rack, AZAP, PF).</br></br>Who should close the Task: Abby Frenkel, Amita Talati, Anne Lin, Asjad Husain, Bernice Oosterling, Connie Zhang,</br>Imran Siddiqui, Matt Feldman, Ryan Hardie, Simon Khozam, Dinesh Kannappan, Dixon Miller, Jaisinhji Jadeja, Mark Kieffer, Rick Wang, Sreekanth Yandapalli, Valerie Cutts</br></br>"
             BuildTaskBody($TaskName)
             }
        "DCIS-Platform L6-L10 Operations Serviceability Review" {
             $StackRank = "330"
             $ResourceTeam = "CO and I"
             $Description = "Assign to: CO and I Team</br>Description: DCIS Platform team needs to complete the L6-L10 Serviceability Review (document M1039012 in OnePDM).  Collateral evidence of completion will be a Review work item type remotely linked to this task from the DCIS Platform ADO Project.</br>"
             BuildTaskBody($TaskName)
             }
        "Draft pre-dock requirements" {
             $StackRank = "340"
             $ResourceTeam = "NTI Team"
             $Description = "Assign to: NTI Team (Team Lead: Mayur Jagtap, Chris Jones)</br>Description: NTI team ensures any pre-dock requirements are drafted and scheduled. It can also include additional tooling for deployments.  The NTI team documents the plan for how the reservation process will be handled, and build the schedule.</br>"
             BuildTaskBody($TaskName)
             }
        "Determine prelim New Technology Deployment Requirements" {
             $StackRank = "350"
             $ResourceTeam = "NTI Team"
             $Description = "Assign to: NTI Team</br>Description: Identify new or different deployment requirements for this SKU (i.e., strict environment controls for things like tape libraries, additional infrastructure support for things like Cray, liquid-cooled, etc.)</br>"
             BuildTaskBody($TaskName)
             }
        "Determine production ramp plan and estimated production volumes for 6-12 months" {
             $StackRank = "360"
             $ResourceTeam = "NTI Team"
             $Description = "Assign to: NTI Team</br>Description: Deployment Size, build into E2E schedule for Ramp Estimate using NTI one slide template.  There will be a Ramp Plan Review checkpoint meeting scheduled by NTI so that there is alignment going into the PPA Peer Review.  This checkpoint will lock on:</br>o # of Engineering Pilot clusters</br>o # of Production Pilot Clusters</br>o ownership of materials mgmt. for Production Pilot clusters</br>o P2G transition Start</br>o Growth ramp date (aka Stabilization Start, P2G growth transition date)</br>"
             BuildTaskBody($TaskName)
             }
        "Determine P2G Transition Start Date" {
             $StackRank = "361"
             $ResourceTeam = "MC PM Team"
             $Description = "Assign to: MC PM Team</br>Description: The Transition Start date is when we kick off the Wave#1 Tasks for Transition. It could be anywhere 6+ months in advance of the PDD for 1st growth cluster at this point.</br>"
             BuildTaskBody($TaskName)
             }
        "Risk Buy analysis complete" {
             $StackRank = "370"
             $ResourceTeam = "CHME Material Team"
             $Description = "Assign to: CHME Materials Team</br>Description: Long lead time commodities identified and the Materials Readiness team drives the Risk Buy approval.Note: If we decide not to do a Risk Buy, and we are moving forward without one, then we need to proactively communicate with Supply Planning that fact as well as when BOMs are expected to be released.  This is because if we are not involving Gohar's team (with a Risk Buy through CHME Materials), then there is no HW recipe being communicated to Supply Planning to forecast off.  A minimum of P1 BOM is needed to forecast with.Risk Buy Requirements checklistLink: https://microsoft.sharepoint.com/:x:/t/HSP/EVopwJ0c5KRFmv0ArQoAxPoBWAbeWxrohNhZbrbXLitY9g?e=ulRgMD</br>"
             BuildTaskBody($TaskName)
             }
        "Procure engineering samples for all teams" {
             $StackRank = "380"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement  (Team Lead is Dean O'Neill)</br>Description: Node level samples made available to CHIE Qual, EG engineering, Networking, CHIE engineering, and CHEE PMSE where appropriate.  The MC PM should ensure teams get the number of samples they need and document in the POR if any shortfall (due to budget or materials) poses any risk for that team.</br>"
             BuildTaskBody($TaskName)
             }
        "Lock System Integrator" {
             $StackRank = "390"
             $ResourceTeam = "CSCP Sourcing-ISP"
             $Description = "Assign to: CSCP Sourcing-ISP</br>Description: CSCP SI Sourcing determines which SI will supply pilot clusters.</br>"
             BuildTaskBody($TaskName)
             }
        "Complete Network port mapping (MOR and TOR design)" {
             $StackRank = "400"
             $ResourceTeam = "Networking Team"
             $Description = "Assign to: Networking Team (with input from CHIE)</br>Description: Networking team generates the cabling schema for the rack to provide the SI with a template by which they will hook up all of the network cables.</br>"
             BuildTaskBody($TaskName)
             }
        "Provide Air Flow and Power/Thermal tested values.  If tested values aren’t available estimates are acceptable." {
             $StackRank = "410"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement (Team Lead is Dean O'Neill)</br>Description: Enablement PM is gathering the data from CHIE Power and Airflow team.  Using measured values wherever possible, calculate the rack and cluster power usage and document the CFM and Thermal analysis in the SKU doc.</br>"
             BuildTaskBody($TaskName)
             }
        "DCIS-Platform PRD and Cluster Air Flow (CFM) and Power (KW) Review" {
             $StackRank = "420"
             $ResourceTeam = "CO and I"
             $Description = "Assign to: CO and I Team</br>Description: Referencing the measured values for Air (CFM) and Power (KW) at the Rack (PRD) and Row (Cluster) level; review for Datacenter Compliance and Approve, Approve w/exceptions, or Reject the SKU.   Collateral evidence of completion will be a Review work item type remotely linked to this task from the DCIS Platform ADO Project. </br>"
             BuildTaskBody($TaskName)
             }
        "DCIS-Platform Networking (TOR and MOR) Design Review" {
             $StackRank = "430"
             $ResourceTeam = "Networking Team"
             $Description = "Assign to: Networking Team</br>Description: Referencing the MOR and TOR Design completed earlier in this same phase; review for Datacenter Compliance and Approve, Approve w/exceptions, or Reject the early design.  Collateral evidence of completion will be a Review work item type remotely linked to this task from the DCIS Platform ADO Project.</br>Note: If we are diverging from Standard ONE MOR/Rack Config, the design needs to be reviewed by the CO, and I team (and then this task should, in that case, be re-assigned to the CO and I Team.</br>"
             BuildTaskBody($TaskName)
             }
        "Review final Power Stranding Analysis" {
             $StackRank = "440"
             $ResourceTeam = "CO and I"
             $Description = "Assign to: CO&I Team</br>Description: Is this SKU going to strand power in the DC?  If yes, get DC Ops sign-off.  Copy-Paste the email sign-off into the Task.  Power can be stranded if rack elevation is low or there are less than 20 racks.</br>"
             BuildTaskBody($TaskName)
             }
        "Conduct factory NUDD/Risk assessment" {
             $StackRank = "450"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME FactoryManufacturing  (Team Lead is Jennifer Lu)</br>Description: CHME Quality team performs NUDD assessment for quality, test, manufacturing engineering. Attach assessment to the task.  NUDD analysis is a joint effort of the MC PM, CHME team, and CHIE.  Aaron Roughton will delegate this task to someone on his team based on the SI. *  Need link to collateral (PPA deck) *  Need SI identified *  Commodities selected / blade and rack config *  SLA: 5-7 days-</br>"
             BuildTaskBody($TaskName)
             }
        "Complete Decommissioning review" {
             $StackRank = "470"
             $ResourceTeam = "CO and I"
             $Description = "Assign to:  CO&I Team (Decom Engineering Team / Field Ops)</br>Description: Work with EG Decomm team to complete their decommissioning review and document plan in ADO task.</br>"
             BuildTaskBody($TaskName)
             }
        "Complete Resource Commitment" {
             $StackRank = "480"
             $ResourceTeam = "MC PM Team"
             $Description = "Assign to:  MC PM Team</br>Description: Ensure resources are committed were appropriate for all of the resources identified in this tool.  Start the process at https://global.azure.com/signoffs/cscp</br>"
             BuildTaskBody($TaskName)
             }
        "Complete project Risk Assessment" {
             $StackRank = "490"
             $ResourceTeam = "MC PM Team"
             $Description = "Assign to: MC PM Team</br>Description: Complete a risk assessment and identify a mitigation plan in the PPA Peer Review deck.</br>"
             BuildTaskBody($TaskName)
             }
        "Complete end to end schedule based on Resource Commitments" {
             $StackRank = "500"
             $ResourceTeam = "MC PM Team"
             $Description = "Assign to: MC PM Team</br>Description: After gathering resource commitment make schedule adjustments as necessary to account for the feedback from the relevant teams.</br>"
             BuildTaskBody($TaskName)
             }
        "Rolled-up MFG POR Plan from CHME team" {
             $StackRank = "501"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Factory/Manufacturing (Team Lead is Heinz Uy)</br>Description: Draft program schedule including scale test, planned ECOs, supplier supportability - capacity and resources, with documented Committed Dock Date.</br>"
             BuildTaskBody($TaskName)
             }
        "Update POR document" {
             $StackRank = "510"
             $ResourceTeam = "MC PM Team"
             $Description = "Assign to: MC PM Team</br>Description: Ensure the POR contains the latest information.  This document is consumed by Networking and the SKU Docs team.  It must be accurate.</br>"
             BuildTaskBody($TaskName)
             }
        "Identify and Schedule BSL Core Changes" {
             $StackRank = "520"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement</br>Description: Enablement PM work with the BSL tools development team.</br>"
             BuildTaskBody($TaskName)
             }
        "Confirm Automation & Tooling Requirements needed for Growth" {
             $StackRank = "521"
             $ResourceTeam = "CSCP Engineering"
             $Description = "Assign to: CSCP Engineering (Sean Sutton)</br>Description: If your program will be ramping with Growth volumes, we need to give CSCP-E (Sean Sutton) the opportunity to scan the POR docs and determine what, if any, automation and tooling will be needed down the road to support the Growth volumes once they arrive.</br>"
             BuildTaskBody($TaskName)
             }
        "Complete TAM Award" {
             $StackRank = "540"
             $ResourceTeam = "Clean TAM-TAM Team"
             $Description = "Assign to: Clean TAM-TAM Team (Team Lead is Joe Coulombe)</br>Description: Sourcing Identifies the SI and issues the award to build the racks/clusters.  Joe Coulombe is the focal who oversees the 'Clean TAM' review process, which is a weekly forum to identify issues holding-up the TAM award, but he is not in charge of the TAM award.</br>"
             BuildTaskBody($TaskName)
             }
        "Complete Cluster Template" {
             $StackRank = "560"
             $ResourceTeam = "NTI Team"
             $Description = "Assign to: NTI Team (Team Lead Mayur Jagtap)</br>Description: The Cluster template is driven by the HW SKU on-call team in Marwan's org. The Seed File and NDT serve as inputs to this. EGs do not need to fill in anything but may be needed to provide feedback as required.</br>"
             BuildTaskBody($TaskName)
             }
        "Lock HW Recipe" {
             $StackRank = "570"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement  (Team Lead is Dean O'Neill)</br>Description: All HW components must be specified and locked before the node/rack build can begin.</br>"
             BuildTaskBody($TaskName)
             }
        "Complete final COGS and Gross Margin analysis" {
             $StackRank = "580"
             $ResourceTeam = "Finance Team"
             $Description = "Assign to: Finance Team</br>Description: Finance must complete final COGS and Gross Margin analysis</br>"
             BuildTaskBody($TaskName)
             }
        "Lock CRD (SW/FW recipe)" {
             $StackRank = "590"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement  (Team Lead is Dean O'Neill)</br>Description: Before the Customer Requirement Document (CRD) can be released we must lock all of the SW/Firmware revisions.</br>"
             BuildTaskBody($TaskName)
             }
        "Draft CHME Quality plan" {
             $StackRank = "591"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Factory-Manufacturing (Team Lead is Jennifer Lu)</br>Description: Quality team review components and building blocks, assess risk and creates a quality plan. Plan to be added as an attachment to the ADO task. NUDD and PFMEA mitigation implemented prior build</br>"
             BuildTaskBody($TaskName)
             }
        "Update to release MFG schedule on all clusters" {
             $StackRank = "592"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Factory/Manufacturing (Team Lead is Jennifer Lu)</br>Description: Firm-up Committed Dock Dates for all MDMs, 2 weeks after TAM award received.</br>"
             BuildTaskBody($TaskName)
             }
        "Quality and Qualification sign off" {
             $StackRank = "600"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIEEnablement  (Team Lead is Dean O'Neill)</br>Description: The CHME Quality and CHIE Qualidation teams must sign off that the SKU pass the qualification tests and meet the requirement around quality.</br>"
             BuildTaskBody($TaskName)
             }
        "Preliminary Super BOM ready" {
             $StackRank = "601"
             $ResourceTeam = "PDM Team"
             $Description = "Assign to: PDM Team</br>Description: The Preliminary Super BOM needs to contain all the component pieces to enable the creation of the P2 SKU Doc and the Final Super BOM will be used to create all of the Growth SKU docs.</br>"
             BuildTaskBody($TaskName)
             }
        "Create the Pilot P2 SKU Doc (BOM)" {
             $StackRank = "610"
             $ResourceTeam = "PDM Team"
             $Description = "Assign to: PDM Team </br>Description: Identify and complete Pilot P2 BOM including all required DCSpec variations.  Complete the checklist found here:</br></br> </br>https://azurecsi.visualstudio.com/Product%20Data%20Management%20Team/_workitems/create/ONEPDM%20Request </br> </br></br> </br>"
             BuildTaskBody($TaskName)
             }
        "Conduct and approve Build Workshop of Rack and Blade" {
             $StackRank = "620"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Factory-Manufacturing (Team Lead is Jennifer Lu). </br>Description: If SKU is High Nudd score (degree of difficulty) - Conduct and Approve Build workshop of SKU in advance of FAI.</br>"
             BuildTaskBody($TaskName)
             }
        "Release CRD" {
             $StackRank = "630"
             $ResourceTeam = "PDM Team"
             $Description = "Assign to: PDM Team</br>Description: Release Customer Requirements Document (CRD)</br>"
             BuildTaskBody($TaskName)
             }
        "Finalize SOW if needed" {
             $StackRank = "650"
             $ResourceTeam = "SI Sourcing"
             $Description = "Assign to: SISourcing Team</br>Description: A Statement of Work (SOW) between MSFT and a Vendor/SI is needed when a specific set of tasks need to be completed and we need an agreement between the two parties about who is doing what and when.</br>"
             BuildTaskBody($TaskName)
             }
        "Material Analysis on Delta and Allocation" {
             $StackRank = "651"
             $ResourceTeam = "CHME Material Team"
             $Description = "Assign to: CHME Material Team</br>Description: Risk buy on the delta from the P2 BOM analysis (in comparison to P1).</br>"
             BuildTaskBody($TaskName)
             }
        "Complete process readiness assessment" {
             $StackRank = "660"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Factory-Manufacturing (Team Lead is Jennifer Lu)</br>Description: Approval of process readiness - Process Flow, SOP, PFMEA, Control Plan, Specs, Packaging (FRU, rack). Part of NPI Readiness during pre-build.  The joint between the Quality team and Manufacturing Engineering team (under Dan Shier).</br>"
             BuildTaskBody($TaskName)
             }
        "Approve & Release Pilot Racks PO to SI" {
             $StackRank = "670"
             $ResourceTeam = "CSCP Sourcing-ISP"
             $Description = "Assign to: CSCP ISP Team</br>Description: SI Sourcing Team to review and negotiate $ amounts and trigger the PO process.  All up L11 PO to go to SI at T-4 weeks for volume build.</br>"
             BuildTaskBody($TaskName)
             }
        "Complete Final Schedule and MFG POR Program Plan" {
             $StackRank = "690"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Factory/Manufacturing  (Team Lead is Jennifer Lu) </br>Description: Engineering Pilot PM complete the L11 CHME checklist and attach it to the ADO task.  Final Schedule and MFG POR Program Plan, Committed Dock Date change along plan change</br>"
             BuildTaskBody($TaskName)
             }
        "Develop manufacturing test tool" {
             $StackRank = "710"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Test (Team Lead is Orly Ortega) </br>Description: Coordinate development of manufacturing test tool at SI and review test plan.</br>"
             BuildTaskBody($TaskName)
             }
        "Review, approve, and publish CHME Test plan" {
             $StackRank = "720"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Factory-Manufacturing  (Team Lead is Jennifer Lu)</br>Description: CHME PM team create, review, and publish test plan.</br>"
             BuildTaskBody($TaskName)
             }
        "Document firmware update processes and procedures" {
             $StackRank = "740"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement PM Team</br>Description: Document firmware update processes and procedures, and enter the location of documentation in ADO task.  The pilot update process from the Sustaining team will be leveraged.</br>"
             BuildTaskBody($TaskName)
             }
        "Review and approve SI extended test plan strategy" {
             $StackRank = "770"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Factory/Manufacturing  (Team Lead is Jennifer Lu)  </br>Description: Examples include ZT - Scale test, WiWynn - ORT, etc.</br>•	ZT:  all NPI SKUs.  ZT owned most of the IP, and they add any special Microsoft request</br>•	Lenovo:   Scale test being enabled but dependent on EG request for certain NPI SKUs</br>•	Wiwynn:  also depended on certain NPI SKUs.  No standard scale test flow and their depended with Microsoft.</br></br>"
             BuildTaskBody($TaskName)
             }
        "Conduct and approve FAI of Rack and Blade on Golden Rack" {
             $StackRank = "800"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Factory/Manufacturing (Team Lead is Jennifer Lu) </br>Description: Physical inspection and documentation done by the manufacturing engineer at the SI.</br></br>1) Publish results</br>2) Submit ECR for BOM/SKU doc changes if needed</br>3) Submit build deviations if needed</br>"
             BuildTaskBody($TaskName)
             }
        "Give Clear To Build to SI (Golden Rack)" {
             $StackRank = "801"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Factory/Manufacturing (Team Lead is Jennifer Lu)</br>Description: Flip ATB on Stratus. Management of schedule: Set ETA, JCAB Tickets, cluster PO release. T-4 to T-8 weeks from the Committed Dock Date.</br>"
             BuildTaskBody($TaskName)
             }
        "Complete Golden Rack build" {
             $StackRank = "810"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Factory/Manufacturing (Team Lead is Jennifer Lu) </br>Description: SI to provide test results (yield report) for CHME PM team to review and action. </br>"
             BuildTaskBody($TaskName)
             }
        "Confirm all parts in at SI" {
             $StackRank = "820"
             $ResourceTeam = "CHME Material Team"
             $Description = "Assign to: CHME Materials Team</br>Description: Ensure all materials arrived at SI to meet API date.</br>"
             BuildTaskBody($TaskName)
             }
        "Conduct L10 Power on testing at System Integrator" {
             $StackRank = "830"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Factory/Manufacturing  (Team Lead is Jennifer Lu)</br>Description: Ensure that the SIhas checkout their full L10 test flow and report any issues found.  Ideally, this should be performed after it passed FAI to ensure all cablings aregood and it is safe to power-on.   </br>"
             BuildTaskBody($TaskName)
             }
        "Complete, validate, and approve L10 and L11 Mfg Test on Golden Rack" {
             $StackRank = "840"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Factory/Manufacturing  (Team Lead is Jennifer Lu)</br>Description: Review, validate, and approve test results from SI</br>"
             BuildTaskBody($TaskName)
             }
        "Complete, validate, and approve extended Manufacturing Testing" {
             $StackRank = "850"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME TE  (Team Lead is Orly Ortega)  </br>Description: Complete, validate, and approve extended Manufacturing Testing.  If applicable, need to document scale test plan from SI.   Requirements should be consolidated from validation, test, reliability, and also from SI.   Need to have this comprehended as part of the overall schedule for the program.   This should be bought-off by the program team before execution by the SI.</br>"
             BuildTaskBody($TaskName)
             }
        "Complete BSL development & release pkg to SI on Golden Rack" {
             $StackRank = "860"
             $ResourceTeam = "BSL Core Engineering Team (Compute)"
             $Description = "Assign to: BSL Team (Development and Validation, Vijay Dusi) / BSL Team (Release Packaging, Mouli Santhanam)</br>Description: Complete BSL development & release package to SI on Golden Rack</br>"
             BuildTaskBody($TaskName)
             }
        "Review and resolve all Sev-1 / Sev-2 bugs" {
             $StackRank = "870"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement PM Team</br>Description: All Sev-1/ Sev-2 bugs need to resolved as fixed or no issue.</br>"
             BuildTaskBody($TaskName)
             }
        "Review and disposition all Sev-3/ Sev-4 bugs" {
             $StackRank = "880"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement PM Team</br>Description: All Sev-3/ Sev-4 bugs need to resolved as fixed or won't fix.</br>"
             BuildTaskBody($TaskName)
             }
        "Document approval of all waivers and DC exceptions including manufacturing deviations if needed" {
             $StackRank = "890"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement (Team Lead is Dean O'Neill)</br>Description: Manufacturing deviations (CHME Manufacturing Engineering); Quality waiver (CHME Quality); DC Ops waivers; etc.</br>"
             BuildTaskBody($TaskName)
             }
        "Confirm all racks passed factory BSL validation" {
             $StackRank = "900"
             $ResourceTeam = "BSL Core Engineering Team (Compute)"
             $Description = "Assign to: BSL Team (Mouli Santhanam)</br>Description: Review BSL package, and enter BSL package release date in ADO.</br>"
             BuildTaskBody($TaskName)
             }
        "Approve and complete Volume Build" {
             $StackRank = "910"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Manufacturing Engineering (Team lead is Jennifer Lu)</br>Description: CHME Manufacturing Engineering gives green light to SI for volume build. Enter completion date of volume build in ADO.  Check FWT (P&A) completion.  Check all ECOs, Dev, and Waivers are accounted for and implemented.</br>"
             BuildTaskBody($TaskName)
             }
        "SI completes their Clear to Ship approval & ships racks" {
             $StackRank = "920"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Factory/Manufacturing (Team Lead is Jennifer Lu) </br>Description: SI completes system check at the end of build, and Clear to Ship process confirms to CHME Quality their readiness to ship.  Go/No-Go planned and executed. based on cluster. Lead technical risks mitigation (including rework). Including VLRR.</br>"
             BuildTaskBody($TaskName)
             }
        "Create Seed file" {
             $StackRank = "940"
             $ResourceTeam = "NTI Team"
             $Description = "Assign to: NTI Team (Team Lead is Mayur Jagtap)</br>Description: The Seed File contains all of the information required to generate all of the more complex documentation.  It takes information from the Cluster Template.  Work with SKU Profile Engineering team.</br>"
             BuildTaskBody($TaskName)
             }
        "Create NDT" {
             $StackRank = "950"
             $ResourceTeam = "NTI Team"
             $Description = "Assign to: NTI Team</br>Description: </br>NDT is a check (not a Task) as it is done automatically and not manually.   NTI Team responsible for doing the check that it's there.  Network Design Template (NDT) is a document that describes how the Rack to MOR cabling is completed.</br>"
             BuildTaskBody($TaskName)
             }
        "Dock MOR" {
             $StackRank = "960"
             $ResourceTeam = "NTI Team"
             $Description = "Assign to: NTI Team</br>Description: Ensure the MOR is in the DC and ready to be cabled before the cluster arrives.  Supply Chain to deliver it.  IAM to receive it.  DCT to build it. </br></br>"
             BuildTaskBody($TaskName)
             }
        "Dock NW Hardware" {
             $StackRank = "970"
             $ResourceTeam = "NTI Team"
             $Description = "Assign to: NTI Team. </br>Description: If any additional network HW is required (e.g., Infiniband) make sure it docks before the cluster docks.  Supply Chain to deliver it.  IAM to receive it.  DCT to build it.</br>"
             BuildTaskBody($TaskName)
             }
        "Confirm DC Readiness" {
             $StackRank = "980"
             $ResourceTeam = "NTI Team"
             $Description = "Assign to: NTI Team</br>Description: Work with the DC to ensure they are ready to dock the cluster and proceed through GDCO to RTEG.  Tracked by CTD Flag for buildout (systematically), but is monitored by Pre-Dock Team in CPDE.</br></br></br>"
             BuildTaskBody($TaskName)
             }
        "Generate the cluster specific CSI work flow" {
             $StackRank = "990"
             $ResourceTeam = "NTI Team"
             $Description = "Assign to: NTI Team</br>Description: Make sure that the CSI work flow (which is the post-dock workflow) exists for this cluster by generating the work flow with the cluster name</br>"
             BuildTaskBody($TaskName)
             }
        "Retrospective Checkpoint 1" {
             $StackRank = "991"
             $ResourceTeam = "MC PM Team"
             $Description = "ADO Task Title: 'Retrospective Checkpoint 1'</br>Phase: Clear to Dock Phase</br>Assign To: Mission Control PM</br>Description: A checkpoint to start documenting data for the final retrospective rather than completing a full retrospective at the end of the program.</br></br>What to include and take note about:</br></br></br> *  Collect links/notes on all the issues/delays to date (i.e., ICM tickets for RCA and ADO issues on delays)</br> *  What went well?</br> *  What could have been done better?</br></br></br></br>What to consider for retrospective during the Clear to Dock phase: Think about areas of improvements and process gaps during the SKU design (rack configuration, rack elevation, PDM), POR creation and commitment, materials procurement, rack build schedule, SI management.</br></br></br>"
             BuildTaskBody($TaskName)
             }
        "Retrospective Checkpoint 2" {
             $StackRank = "992"
             $ResourceTeam = "MC PM Team"
             $Description = "ADO Task Title: 'Retrospective Checkpoint 2'</br>Phase: Engineering Pilot Phase</br>Assign To: Mission Control PM</br>Description:</br>A checkpoint to start documenting data for the final retrospective rather than completing a full retrospective at the end of the program.</br></br>What to include and take note about:</br></br></br> *  Collect links/notes on all the issues/delays to date (i.e., ICM tickets for RCA and ADO issues on delays)</br> *  What went well?</br> *  What could have been done better?</br></br></br></br>What to consider for retrospective during Engineering Live phase: Think about areas of improvements and process gaps during post dock activities (i.e., buildout, EG testing).</br></br>"
             BuildTaskBody($TaskName)
             }
        "Start P2G Transition Phase" {
             $StackRank = "1040"
             $ResourceTeam = "NTI Team"
             $Description = "Assign to: NTI Team</br>Description: Marking this Task complete signals that P2G has started.  Check to ensure the Program Schedule and Volume for Ramp still holding.  This Task is an email communication to stakeholders that we've started the Transition work for the Platform (Note: closure of this Task also causes a 'Yes' to be displayed on the NPI Dashboard for the 'P2G Transition Started' column).</br>"
             BuildTaskBody($TaskName)
             }
        "Ensure CapEx approval for Growth is granted" {
             $StackRank = "1050"
             $ResourceTeam = "Finance Team"
             $Description = "Assign to: Finance Team</br>Description: Ensure CapEx approval is completed for the Ramp clusters.</br>"
             BuildTaskBody($TaskName)
             }
        "Growth Risk Buy - Pre-position BOM materials for NUDD or long lead time" {
             $StackRank = "1060"
             $ResourceTeam = "CSCP Sourcing-ISP"
             $Description = "Assign to: CSCP ISP Team</br>Description: Tracked by SCOM but executed by ISP</br>"
             BuildTaskBody($TaskName)
             }
        "Re-visit ramp strategy to validate it's defined and incorporated into CSP" {
             $StackRank = "1070"
             $ResourceTeam = "Capacity Planning"
             $Description = "Assign to: Capacity Planning Team</br>Description: Ramp plan incorporated into CSP and loaded into MDM,  including region coverage, supply volume, hot buffer, and dependencies); Incorporate SKU into long range forecast with demand visible in Stratus (Resource design created and Plan_SKU incorporated as part of CSP signal to Supply Chain. Ongoing monthly CSP cycle and for ad-hoc changes. Requires re-visit for any PFAM changes. Transition from old-generation to new-generation planned for.</br></br>Note: AzD: Not Applicable</br>"
             BuildTaskBody($TaskName)
             }
        "Ensure PRR (Part Replacement Rate) 0-100 days post-Live is within acceptable limits" {
             $StackRank = "1080"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Factory/Manufacturing (Team Lead is Jennifer Lu)</br>Description: Ensure that PRR (Part Replacement Rate), for up to 100 days after Live, is within acceptable limits.</br></br>Note: AzD: Not Applicable</br>"
             BuildTaskBody($TaskName)
             }
        "Manufacturing Test Engineering (MTE) Test plan has been modified and approved to incorporate any feedback from pilot cluster quality issues/escapes" {
             $StackRank = "1090"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Factory/Manufacturing (Team Lead is Jennifer Lu)</br>Description: Part of the P2G process.</br></br>Note: AzD: Not Applicable</br>"
             BuildTaskBody($TaskName)
             }
        "FAI findings are documented and closed" {
             $StackRank = "1110"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Manufacturing Engineering (Team Lead is Jennifer Lu)</br>Description: Findings are either as ECOs, updated SOPs, or WI. SOPs and WI are approved by Manufacturing Engineering.</br></br>Note: AzD: Mechanical Evaluation Only: Labeling, U-location check is still good to do. We just need a common understanding that this is NOT an FAI</br>"
             BuildTaskBody($TaskName)
             }
        "No known Sev-1 / Sev-2 bugs without mitigation plans" {
             $StackRank = "1120"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Factory/Manufacturing (Team Lead is Jennifer Lu)</br>Description: Ensures that all Sev-1 / Sev-2 bugs (P2 or lower) that exist in the hardware, firmware, or drivers are dispositioned against for customer impact.</br></br>Note: AzD: Not Applicable</br>"
             BuildTaskBody($TaskName)
             }
        "RMA Failure Analysis (FA) has been conducted on high PRR components, results are well understood and issues are mitigated" {
             $StackRank = "1130"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Factory/Manufacturing (Team Lead is Jennifer Lu)</br>Description: Ensure high PRR components are well understood and risks mitigated vis-a-vis RMA FA.</br></br>Note: AzD: Not Applicable</br>"
             BuildTaskBody($TaskName)
             }
        "Quality issues identified post-pilot dock are closed" {
             $StackRank = "1140"
             $ResourceTeam = "CHME Factory-Manufacturing"
             $Description = "Assign to: CHME Factory/Manufacturing (Team Lead is Jennifer Lu)</br>Description: Quality issues identified post-pilot dock are closed (includes all CHIE/CHME quality checklists).</br></br>Note: AzD: Not Applicable</br>"
             BuildTaskBody($TaskName)
             }
        "Environmental certification complete for the L11" {
             $StackRank = "1150"
             $ResourceTeam = "Safety and Serviceability Team"
             $Description = "Assign to: CHIE SSC Team</br>Description: Do we have Environmental certification at the L11 level? (e.g. TOR, Load Balancer, Chassis, etc.)</br>Paul Schindler: A lot of this comes from the CoCs we get from suppliers as part of the overall Certification process. The rest comes automatically from OnePDM at P2 BOM release.</br></br>Note: AzD: OEM will provide</br>"
             BuildTaskBody($TaskName)
             }
        "Any related RRP incidents are at ALARP or Low" {
             $StackRank = "1160"
             $ResourceTeam = "Safety and Serviceability Team"
             $Description = "Assign to: CHIE SSC Team</br>Description: (As Low As Reasonably Practical).  This would block rack production or delivery if there is an open incident that is not ALARP or LOW.</br></br>"
             BuildTaskBody($TaskName)
             }
        "Country certification completed for all building blocks and FRUs" {
             $StackRank = "1170"
             $ResourceTeam = "Safety and Serviceability Team"
             $Description = "Assign to: CHIE SSC Team</br>Description: (Field Replaceable Unit).  Import-ability of the L11 and individual parts; this item depends on which regions are outlined in the ramp plan.</br></br>Note: AzD: OEM will provide</br>"
             BuildTaskBody($TaskName)
             }
        "Assembly/Disassembly/Service manual with safety warnings available" {
             $StackRank = "1180"
             $ResourceTeam = "Safety and Serviceability Team"
             $Description = "Assign to: CHIE SSC Team</br>Description: This requirement is a WIP for almost all PFAMs, and is not currently a blocker to NPI.</br>Paul Schindler: I believe SSC has this as a deliverable in the next semester.</br>"
             BuildTaskBody($TaskName)
             }
        "Incorporate SKU into binding and non-binding forecasts to SI and sub-tier vendors" {
             $StackRank = "1190"
             $ResourceTeam = "CSCP Sourcing-ISP"
             $Description = "Assign to: CSCP ISP Team</br>Description: Incorporate SKU into binding and non-binding forecasts to SI and sub-tier vendors.</br></br>Note: AzD: Not Applicable</br>"
             BuildTaskBody($TaskName)
             }
        "All ECOs are integrated and released to SIs including BIOS/BMC/Commodity Firmware" {
             $StackRank = "1200"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement (CSCP Shiproom)</br>Description: Ensure that SI's have the latest software recipe before going to Growth.  Any issues that are resolved during Pilot should be included.</br></br>Note: AzD: Applies except for the FW/SW</br>"
             BuildTaskBody($TaskName)
             }
        "SKU Qualification Complete - SW recipe locked and qualified; HW qualified" {
             $StackRank = "1220"
             $ResourceTeam = "CHIE Qualidation Team"
             $Description = "Assign to: CHIE Qualidation (Jim Shields for Microsoft Quals / Devender Goud for SI Quals)</br>Description: Ensure there are no changes to the SW recipe queued-up.</br></br>Note: AzD: Not Applicable</br>"
             BuildTaskBody($TaskName)
             }
        "Sourcing BOM Ready" {
             $StackRank = "1230"
             $ResourceTeam = "PDM Team"
             $Description = "Assign to: PDM Team</br>Description: Ensure that the Sourcing BOM is released.</br></br>Note: AzD: Not Applicable</br>"
             BuildTaskBody($TaskName)
             }
        "Power/CFM tested values available in OnePDM" {
             $StackRank = "1250"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement (Team Lead is Dean O'Neill)</br>Description: Ensure that tested power/CFM values are available in OnePDM for review.</br></br>Note: AzD: Need to ensure the OEM tests this PRIOR to the pilot</br>"
             BuildTaskBody($TaskName)
             }
        "Qualified hardware/SW entered into the QCL" {
             $StackRank = "1260"
             $ResourceTeam = "PDM Team"
             $Description = "Assign to: PDM Team (Assign to Raghu Bhat's Configuration Management team within PDM)</br>Description: Ensure qualified HW/SW are entered into the QCL (Qualified Component List).  QCL lives in OnePDM and PDM now is responsible for entering the QCL data ito OnePDM.  However, CHIE Qualidation is still responsible for signaling to PDM Team to do it, and also responsible for sending PDM Team the QCL data.</br></br>Note: AzD: Not Applicable</br>"
             BuildTaskBody($TaskName)
             }
        "Sourcing Strategy – defined if different from standard" {
             $StackRank = "1270"
             $ResourceTeam = "CSCP Sourcing-ISP"
             $Description = "Assign to: CSCP SI Sourcing Team</br>Description: Ensure the Sourcing Strategy is defined (e.g. ITPAC, Cray, Databox, BareMetal) if different from, say, GP Compute or Storage.</br>"
             BuildTaskBody($TaskName)
             }
        "All non-standard supply chain requirements have been addressed/mitigated" {
             $StackRank = "1290"
             $ResourceTeam = "CSCP Sourcing-ISP"
             $Description = "Assign to: CSCP ISP Team</br>Description: Ensure that all non-standard supply chain requirements (e.g., non-Microsoft owned assets, ITPAC, liquid cooling, multiple SIs for single deliver) have been fully addressed and mitigated.</br>"
             BuildTaskBody($TaskName)
             }
        "Re-validate all new contracts are in place (e.g. ITPAC)" {
             $StackRank = "1300"
             $ResourceTeam = "CSCP Sourcing-ISP"
             $Description = "Assign to: CSCP SI Sourcing Team</br>Description: Re-validate that all new contracts are in-place (e.g., ITPAC).</br>"
             BuildTaskBody($TaskName)
             }
        "All parts in BOM at PV or higher maturity in OnePDM" {
             $StackRank = "1305"
             $ResourceTeam = "PDM Team"
             $Description = "Assign to: PDM Team (Assign to Raghu Bhat's Configuration Management team within PDM)</br>Description: Ensure that all parts in the BOM are at PV level or higher maturity in OnePDM (inclusive of Spec sheets, environmental compliance, PV status, etc).</br></br>"
             BuildTaskBody($TaskName)
             }
        "Create production MSF's for all purchase level components and FRU items" {
             $StackRank = "1320"
             $ResourceTeam = "PDM Team"
             $Description = "Assign to: PDM Team</br>Description: Ensure production-level MSFs are created for all purchase-level components and FRU items (e.g., Spares).</br></br>Note: AzD: Completed as part of Pilot. Not Applicable</br>"
             BuildTaskBody($TaskName)
             }
        "EG engineering sign-off on readiness before Production ramps" {
             $StackRank = "1330"
             $ResourceTeam = "EG Team"
             $Description = "Assign to: EG Team</br>Description: Sync w/ EG Engineering to ensure no open issues that occurred during Pilot and suitability to transition to growth</br>"
             BuildTaskBody($TaskName)
             }
        "All waivers have been completed or addressed before shipping from SI" {
             $StackRank = "1340"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement (Team Lead is Dean O'Neill)</br>Description: Ensure all waivers have been completed as required or addressed as required shipping from SI to dock.</br>"
             BuildTaskBody($TaskName)
             }
        "Review and confirm Ops Model readiness (spares and maintenance)" {
             $StackRank = "1350"
             $ResourceTeam = "Spares Team"
             $Description = "Assign to: Spares Team (Todd Nicholson)</br>Description: Standard is Ops Model 2, Growth should be Ops 3 (Microsoft serviced); this is decided in conjunction with Sourcing, dependent on if the platform is Microsoft owned v. third party hardware (e.g. Cray, IBM, etc.)</br>"
             BuildTaskBody($TaskName)
             }
        "DC Ops review including PVA (ensure GDCO tickets closed)" {
             $StackRank = "1360"
             $ResourceTeam = "CO and I"
             $Description = "Assign to: CO&I Team</br>Description: DOSIP = onsite inspection when racks are deployed; process specific. The purpose of this is to give feedback to the Design team.</br></br>Note: AzD: PVA = FAI, No DOSIP/PVA agreement for AzD</br>"
             BuildTaskBody($TaskName)
             }
        "All serviceability waivers for Pilot have been resolved or waived prior to growth" {
             $StackRank = "1370"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement (Team Lead is Dean O'Neill)</br>Description: Ensure all serviceability exceptions for Pilot have been resolved or waived prior to Transition to Growth.</br>"
             BuildTaskBody($TaskName)
             }
        "Validate actual power consumption to specs and adjust rack elevation if necessary" {
             $StackRank = "1380"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement Team (Team Lead is Dean O'Neill)</br>Description: Node level power monitoring; where the monitoring is being done, how to get notified when it exceeds threshold</br></br>Note: AzD: Not Applicable</br>"
             BuildTaskBody($TaskName)
             }
        "Safety risk assessment, reports, audits are completed" {
             $StackRank = "1400"
             $ResourceTeam = "Safety and Serviceability Team"
             $Description = "Assign to: CHIE SSC Team</br>Description: Ongoing as changes in BOM and construction of L11 occur (must re-verify this item if there were any BOM or construction changes since the initial Pilot).</br>Paul Schindler: Also relevant when some programs are fast-tracked for business purposes (e.g. Jedi).</br>"
             BuildTaskBody($TaskName)
             }
        "If a new SI is being used, ensure the MPS enabled forecast ingestion and response is onboarded" {
             $StackRank = "1410"
             $ResourceTeam = "Capacity Planning"
             $Description = "Assign to: Capacity Planning Team</br>Description: (Master Production Schedule). This item only applies when a new SI is being used.</br></br>Note: AzD: Not Applicable</br>"
             BuildTaskBody($TaskName)
             }
        "MRA enabled / capability onboarded at the SI" {
             $StackRank = "1420"
             $ResourceTeam = "SCOM"
             $Description = "Assign to: Supply Chain Operations Team</br>Description: (Material Readiness Assessment).  Ensure MRA capability is onboarded at the SI.</br></br>Note: AzD: Not Applicable</br>"
             BuildTaskBody($TaskName)
             }
        "Provide BOM change report (compare prior gen BOM compared with current gen BOM)" {
             $StackRank = "1430"
             $ResourceTeam = "PDM Team"
             $Description = "Assign to: PDM Team</br>Description: Compare Pilot to Growth BOM's.  Ongoing activity that occurs with each BOM/SKU release.</br>"
             BuildTaskBody($TaskName)
             }
        "Unique logistical requirements to support the product" {
             $StackRank = "1440"
             $ResourceTeam = "Cloud Logistics Ops"
             $Description = "Assign to: Cloud Logistics Ops (cloudlogisticsops@, Nagasatya Karuparti's Team)</br>Description: Confirm unique logistical requirements needed to support the product (e.g., shipping lead-times, customs issues, other regional logistical issues).  Ensure these are fully-mapped by Logistics before Transition to Growth.</br>"
             BuildTaskBody($TaskName)
             }
        "Completion of the operating procedures for this platform" {
             $StackRank = "1450"
             $ResourceTeam = "NTI Team"
             $Description = "Assign to: NTI Team</br>Description: Ensure all operating procedures necessary to support growth are in-place (e.g., procurement of certain supplies like Infiniband cables, row managers; installation; method of procedure).</br></br>Note: AzD: High probability for waivers, but differs Case -by-Case</br>"
             BuildTaskBody($TaskName)
             }
        "Ensure Platform level maturity and spec handoff to PDM engineering" {
             $StackRank = "1470"
             $ResourceTeam = "PDM Team"
             $Description = "Assign to: PDM Team</br>Description: Ensure Platform-level maturity and spec handoff to PDM Engineering.</br>Config team's PDM Configuration Requests: https://azurecsi.visualstudio.com/Product%20Data%20Management%20Team/_workitems/create/pdm%20configuration%20request</br>SKU Design Team OnePDM Requests:</br>https://azurecsi.visualstudio.com/Product%20Data%20Management%20Team/_workitems/create/onepdm%20request</br></br></br>Note: AzD: Not Applicable</br>"
             BuildTaskBody($TaskName)
             }
        "Growth SKUs Released" {
             $StackRank = "1475"
             $ResourceTeam = "PDM Team"
             $Description = "Assign to: PDM Team</br>Description: Ensure that the Growth SKUs for the program are released in OnePDM.</br>"
             BuildTaskBody($TaskName)
             }
        "BOM Risk Assessment - EOL, single source, and part risk" {
             $StackRank = "1480"
             $ResourceTeam = "CSCP Sourcing-ISP"
             $Description = "Assign to: CSCP ISP Team</br>Description: Ongoing activity that occurs with each BOM/SKU release.</br>"
             BuildTaskBody($TaskName)
             }
        "Lead Times and ownership clearly identified, ready for ingestion in tools" {
             $StackRank = "1485"
             $ResourceTeam = "CSCP Sourcing-ISP"
             $Description = "Assign to: CSCP ISP Team</br>Description: This includes both Microsoft-owned parts and SI-owned parts.</br>"
             BuildTaskBody($TaskName)
             }
        "If an additional SI is being used, new SI part numbers need to be added" {
             $StackRank = "1490"
             $ResourceTeam = "CSCP Sourcing-ISP"
             $Description = "Assign to: CSCP ISP Team</br>Description: Ensure that new SI part numbers are added if an additional SI is being used.</br>"
             BuildTaskBody($TaskName)
             }
        "If an additional SI is being used, the plan to qualify that SI needs to be in place for that L11 platform" {
             $StackRank = "1495"
             $ResourceTeam = "CHIE Qualidation Team"
             $Description = "Assign to: CHIE Qualidation Team (Jim Shields for Microsoft Quals / Devender Goud for SI Quals)</br>Description: (System Integration Certification).  If an additional SI is being used, the plan to qualify that SI needs to be in place for that L11 platform.</br>"
             BuildTaskBody($TaskName)
             }
        "TAM Award for new Growth SKU" {
             $StackRank = "1500"
             $ResourceTeam = "Clean TAM-TAM Team"
             $Description = "Assign to: Clean TAM/TAM Team</br>Description: As long as the platform is Capex Approved and passes 'Clean TAM' review (which is a weekly forum managed by Joe Coulombe), then the TAM award will automatically occur at the next soonest TAM award date.  If it is needed sooner than that, MC PM needs to escalate to Devang in Sourcing for an Out-Of-Cycle (OOC) TAM Award (which is not guaranteed).</br>"
             BuildTaskBody($TaskName)
             }
        "Material positioned to hit current Growth PDD (to replace COS status for Growth Volume)" {
             $StackRank = "1505"
             $ResourceTeam = "SCOM"
             $Description = "Assign to: Need an owner; 'SCOM' is too broad.</br> Description: Need a description</br></br>"
             BuildTaskBody($TaskName)
             }
        "Any SSCA findings are Closed / Deviations signed-off by Business" {
             $StackRank = "1530"
             $ResourceTeam = "Safety and Serviceability Team"
             $Description = "Assign to: CHIE SSC Team</br>Description: (Safety, Serviceability, Certification Audit) SSCA is performed when an FAI is performed (new SI for 'Growth', new factory, new Ops Model).  Currently, this only applies to L11, but will apply to L6 and L10 by December 2020.</br>Paul Schindler: It might be good to reference the L11 checklist: M1139793.</br></br>Note: AzD: This is not a standard POR. The team is trying to introduce Mechanical Evaluation as a standard. A collective agreement is needed that this is the path forward.</br>"
             BuildTaskBody($TaskName)
             }
        "Mission Control confirms RAPID Sign Off and P2G Transition Complete" {
             $StackRank = "1550"
             $ResourceTeam = "MC PM Team"
             $Description = "Assign to: MC PM Team</br>Description: All three Pilot to Growth Wave Phases are completed and RAPID template call-outs for approved exceptions documented.  Gather together any critical path Tasks that are Open so that the Decider (Chris Jones) can review and ensure there are corresponding Waivers (or a closure plan) with Due Dates assigned for each Open critical path Task.  The RAPID cannot be signed-off by the Decider without this level of detail being done.</br></br>Process:</br></br> *  Get the RAPID Template here: https://microsoft.sharepoint.com/:p:/t/cloudweb/cscp/NPI/EaZ6Iwv34ORFpZF5IUF6OBMBmZM9UtnaYsWIJh0OYCwwRw.</br> *  Gather together any critical path Tasks that are Open so that the Decider (Chris Jones) can review and ensure there are corresponding Waivers (or a closure plan) with Due Dates assigned for each Open critical path Task.  The RAPID cannot be signed-off by the Decider without this level of detail being done.</br> *  Once it is signed-off by the Decider (Chris Jones), attach his email confirmation plus the RAPID slide to this Task.</br> *  Send a broad email announcement out stating that the Program has now transitioned to Growth.</br> *  Be sure and update the Actual Growth Date field at the Program work item level.</br> *  Be sure to close this Task.</br></br>"
             BuildTaskBody($TaskName)
             }
        "Ship Room waivers reviewed with long-term action plans agreed-to and approved" {
             $StackRank = "1560"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Enablement (CSCP Shiproom)</br>Description: All CSCP Shiproom waivers are reviewed with long-term action plans agreed-to and approved.</br></br>Note: AzD: Not Applicable</br>"
             BuildTaskBody($TaskName)
             }
        "Ensure all required telemetry is being collected" {
             $StackRank = "1700"
             $ResourceTeam = "CHIE Enablement"
             $Description = "Assign to: CHIE Services Team</br>Description: Ensure 'required telemetry' has been provided to MC PM Team by the CHIE CHEE NPI team, updated for each 'type' of platform (resource group); while we want to ensure this is being collected, we have to signal the CHIE CHEE team to go collect it.</br>"
             BuildTaskBody($TaskName)
             }
        "Ensure No Open P0/P1 New Tech Bugs or Issues or incidents Exist" {
             $StackRank = "1701"
             $ResourceTeam = "NTI Team"
             $Description = "Assign to: NTI Team</br>Description: Ensure task completion for the following items in the checklist.</br>Checklist:</br>- All P0/P1 issues have been documented in ADO</br>-  No open/active P0/P1 bugs</br>"
             BuildTaskBody($TaskName)
             }
        "Complete Tool Onboarding" {
             $StackRank = "1702"
             $ResourceTeam = "NTI Team"
             $Description = "Assign to: NTI Team</br>Description: Ensure task completion for the following items in the checklist.</br>Checklist:</br>- Network Device Onboarding</br>     1) New devices are onboarded to SKU service, Podset, FORM.</br>     2) Standardized network design is in place</br>- Pre-Dock Check List: Resource Type Onboarding to FORM</br>- Pre-Dock Check List: Program has been onboarded to the Facility Planner.</br>- Pre-Dock Check List: Cluster Template Onboarding</br>- Pre-Dock Check List: SKU is registered in RACKSKU.xml</br>- Pre-Dock Check List: NDT is automated</br>- Post-Dock Check List: Add-rack logic has been defined? (For example, generation pairing)</br>- Post-Dock Check List: The container Policy and resource template is ready</br>- Post-Dock Check List: Resource Type Onboarding to CIS</br>"
             BuildTaskBody($TaskName)
             }
        "Validate Cycle Time" {
             $StackRank = "1703"
             $ResourceTeam = "NTI Team"
             $Description = "Assign to: NTI Team</br>Description: Ensure task completion for the following items in the checklist.</br>Checklist:</br>- At least 1 production pilot cluster meet FPLock to CTD cycle time (49 days)</br>- P90 Dock to RTEG cycle time meets P90 cycle time for a previous generation or similar mainstream program.</br>- P90 RTEG to RTW cycle Time meets P90 cycle time for a previous generation or similar mainstream program.</br>- P90 RTW to Live cycle Time meets P90 cycle time for a previous generation or similar mainstream program.</br></br>"
             BuildTaskBody($TaskName)
             }
        "Complete Transition Meeting between NTI and CSCP Deployment Teams" {
             $StackRank = "1704"
             $ResourceTeam = "NTI Team"
             $Description = ""
             BuildTaskBody($TaskName)
             }
        "Signal to dock PFAM LT" {
             $StackRank = "1705"
             $ResourceTeam = "SCOM"
             $Description = "Assign to: Need an owner; 'SCOM' is too broad.</br>Description: Need a description</br>"
             BuildTaskBody($TaskName)
             }
        "Remove the program for the Hardware Stack Rank when Ramp starts" {
             $StackRank = "1710"
             $ResourceTeam = "MC PM Team"
             $Description = "Assign to: MC PM Team</br>Description: The last step MC PM Team performs in the Pilot to Growth Waves is ensuring that the NPI Steering Committee (Nick Gottuso, Ramjee Tangutur, Brenda Bell) removes the program from the HW Priority List (i.e., NPI Stack Rank).</br></br>"
             BuildTaskBody($TaskName)
             }
        "Final Retrospective" {
             $StackRank = "1711"
             $ResourceTeam = "MC PM Team"
             $Description = "ADO Task Title: 'Final Retrospective'</br>Phase: Pilot to Growth Wave 3</br>Assign To: Mission Control PM</br>Description: Complete the final retrospective near the end of an NPI program, conduct a collaborative working meeting with the v-team, and fill out the following template.</br></br>Areas to Continue</br>Review the Retrospective ADOs and call out the key themes/points that went well. Focus on the process instead of specific teams.</br></br>Areas to Improve</br>Review the Retrospective ADOs and call out the key themes/points that went could've been better. Focus on the process instead of specific teams.</br></br>Lessons Learned</br>Quick to digest lessons learned - tips and best practices for future Mission Control PMs</br></br>Initiatives/Process Improvements</br>*Include a link to ADO task tracking initiative and use the following outline*</br></br></br>Problem Statement</br></br></br></br>Gap Identified</br></br></br></br>Plan of Action</br></br></br></br>In Scope</br></br></br></br>Out of Scope</br></br></br></br>Success Measures</br></br></br></br>Team owners</br></br></br></br>"
             BuildTaskBody($TaskName)
             }

    }
}

Function BuildPhaseBody ($PhaseName) {
  $body = $null
  $body='[
  { "op": "add",
    "path": "/fields/System.Title",
    "value": "' + $PhaseName + '"},
  { "op": "add",
    "path": "/fields/Microsoft.VSTS.Common.StackRank",
    "value": "' + $StackRank + '"},
  { "op": "add",
    "path": "/fields/CloudProvisioning.PilotType",
    "value": "' + $PilotType + '"},
  { "op": "add",
    "path": "/fields/System.Description",
    "value": "' + $Description + '"},
  { "op": "add",
    "path": "/relations/-",
    "value": {
        "rel": "System.LinkTypes.Hierarchy-Reverse",
        "url": "' + $Program.url + '"}}
]'
  Write-Debug $body
  Write-Output $body
}

Function BuildTaskBody ($TaskName) {
  $body = $null
  $body='[
  { "op": "add",
    "path": "/fields/System.Title",
    "value": "' + (ReplaceASCII($TaskName)) + '"},
  { "op": "add",
    "path": "/fields/Microsoft.VSTS.Common.StackRank",
    "value": "' + $StackRank + '"},
  { "op": "add",
    "path": "/fields/Custom.ResourceTeam",
    "value": "' + $ResourceTeam + '"},
  { "op": "add",
    "path": "/fields/CloudProvisioning.EngineeringGroup",
    "value": "' + $ProgramEngineeringGroup + '"},
  { "op": "add",
    "path": "/fields/Custom.AssociatedProgram",
    "value": "' + $ProgramName + '"},
  { "op": "add",
    "path": "/fields/System.Description",
    "value": "' + $Description + '"},
  { "op": "add",
    "path": "/relations/-",
    "value": {
        "rel": "System.LinkTypes.Hierarchy-Reverse",
        "url": "' + $PhaseURL + '"}}
]'
  Write-Debug $body
  Write-Output $body
}

Function ReplaceASCII ($BadString) {
    $GoodString = $null
    Switch ($BadString) {
        'Sourcing Strategy – defined if different from standard' {$GoodString = 'Sourcing Strategy \u2013 defined if different from standard'}
        "Provide Air Flow and Power/Thermal tested values.  If tested values aren’t available estimates are acceptable." {$GoodString = 'Provide Air Flow and Power/Thermal tested values.\u00a0\u0020If tested values aren\u2019t available estimates are acceptable.'}
        default {$GoodString = $BadString}
    }
    Write-Output $GoodString
}

# 1. Initialize and Validate
$StartTime = Get-Date

If ($null -eq $PAT -or $PAT -eq "") {
    $KeyVaultName = "jonorSecrets"
    $SecretName = "Ang-ADO-PAT"
    Try {$kvs = Get-AzKeyVaultSecret -VaultName $KeyVaultName -Name $SecretName -ErrorAction Stop
         $ssPtr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($kvs.SecretValue)
         Try {$PAT = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($ssPtr)
         } 
         Finally {[System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ssPtr)}
    }
    Catch {
        Write-Host
        Write-Host "FATAL ERROR: You must have your ADO Personal Access Token saved as a variable" -ForegroundColor Red
        Write-Host 'Please save your Personal Access token in a variable named "$PAT" this can be done by running:'
        Write-Host
        Write-host '     $PAT = "abcdesomesamplejunkentriesdontuseititwillnotwork"' -ForegroundColor Yellow
        Write-Host
        Write-Host "Once you have created with variable with your Personal Access Token, rerun this script"
        Write-Host
        Return}
    }

$token = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($PAT)"))
$header = @{authorization = "Basic $token"}
#$ADOOrg = "https://dev.azure.com/cloudsupply/CloudNPI/"
$ADOOrgBase = "https://dev.azure.com/cloudsupply/"
$ProgramWIType = "Program"
$PhaseWIType = "Phase"
$TaskWIType = "Task"

$TaskMap = @{}
$TaskMap = TaskMap
$Phases = @{}
$PhaseURLs = @{}
$Tasks = @{}
$TaskMap.Values | Select-Object -Unique | ForEach-Object {$Phases.Add($_, "0")}
$TaskMap.Keys | Where-Object {$_ -ne "1" -and $_ -ne "2"} | ForEach-Object {$Tasks.Add($_, "0")}

# Start nicely
Write-Host (Get-Date)' - ' -NoNewline
Write-Host "Validating and correcting Program ID $ProgramID" -ForegroundColor Cyan
Write-Host "  Using ADO Instance: " -NoNewline
Write-Host $ADOOrgBase -ForegroundColor Yellow 
Write-Host "  Polling a total of " -NoNewline
Write-Host $Phases.Count -ForegroundColor Yellow -NoNewline
Write-Host " phases"
Write-Host "  Polling a total of " -NoNewline
Write-Host $Tasks.Count -ForegroundColor Yellow -NoNewline
Write-Host " tasks"

# 1.2 Validate Program WID
Write-Host (Get-Date)' - ' -NoNewline
Write-Host "Polling ADO for Program ID" -ForegroundColor Cyan
$url = $ADOOrgBase + "_apis/wit/workitems/" + $ProgramID + "?api-version=6.1-preview.3"
Try {$Program = Invoke-RestMethod -Uri $url -Method Get -ContentType "application/json" -Headers $header}
Catch {Write-Host
       Write-Host "  Invalid Program Work Item ID" -ForegroundColor Red
       Write-Host "  The Program ID supplied, $ProgramID, was either not found or inaccessable"
       Write-Host "  Exiting script"
       Write-Host
       Return}
$ProgramName = $Program.Fields.'System.Title'
$ProgramProject = $Program.fields.'System.TeamProject'
$ProgramEngineeringGroup = $Program.Fields.'CloudProvisioning.EngineeringGroup'
$ADOOrg = $ADOOrgBase + $ProgramProject + "/"
Write-Host "  Program ID: $ProgramID found. Program Name is " -NoNewline
Write-Host $ProgramName -ForegroundColor Yellow
Write-Host "  Program project is: " -NoNewline
Write-Host $ProgramProject -ForegroundColor Yellow

# Pull Phase (child) links from Program
Write-Host (Get-Date)' - ' -NoNewline
Write-Host "Pulling Phase (child) links for Program" -ForegroundColor Cyan
$url = $ADOOrg + "_apis/wit/wiql?api-version=6.0"
$body=@"
SELECT [System.Id],[System.WorkItemType],[System.Title]
FROM workitemLinks
WHERE ([Source].[System.Id] = $ProgramID) AND ([System.Links.LinkType] = 'System.LinkTypes.Hierarchy-Forward')
MODE (Recursive)
"@
$body = '{"query":"' + $body + '"}' 

$output = Invoke-RestMethod -Uri $url -Method Post -ContentType "application/json" -Headers $header -Body $body
$ADOProgramKids = $output.workItemRelations

# Loop the links for Phase (child) Ids
ForEach ($Kid in ($ADOProgramKids | Where-Object {$_.rel -eq "System.LinkTypes.Hierarchy-Forward"})) {
    $url = $ADOOrg + "_apis/wit/workitems/" + $Kid.Target.id + "?api-version=6.1-preview.3"
    # Program $url = $ADOOrg + "_apis/wit/workitems/" + 84002 + "?api-version=6.1-preview.3"
    # Phase   $url = $ADOOrg + "_apis/wit/workitems/" + 84003 + "?api-version=6.1-preview.3"
    # Task    $url = $ADOOrg + "_apis/wit/workitems/" + 84006 + "?api-version=6.1-preview.3"
    $output = Invoke-RestMethod -Uri $url -Method Get -ContentType "application/json" -Headers $header
    if ($output.fields.'System.WorkItemType' -eq $PhaseWIType) {
        Foreach ($Phase in @($Phases.Keys)) {
            if ($Phase -eq $output.fields.'System.Title') {
                 $Phases[$Phase] = $output.id
                 $PhaseURLs.Add($output.id, $output.url)
            }
        }
    } ElseIf ($output.fields.'System.WorkItemType' -eq $TaskWIType) {
            Foreach ($Task in @($Tasks.Keys)) {
            if ($Task -eq $output.fields.'System.Title') {
                 $Tasks[$Task] = $Kid.source.id.ToString() + "." + $output.id.ToString()
            }
        }
    }
}

# Check if this is a validate only run, if so, report out and end
If ($ValidateOnly) {
    Write-Host "The following phases and tasks are missing from program " -NoNewline
    Write-Host $Program.Fields.'System.Title'-ForegroundColor Yellow
    Write-Host
    Write-Host "Phases" -ForegroundColor Cyan
    If (($Phases.GetEnumerator() | Where-Object {$_.Value -eq "0"}).Count -gt 0) {
        Write-Host ($Phases.GetEnumerator() | Where-Object {$_.Value -eq "0"} | Select-Object -ExpandProperty Name | ForEach-Object {Write-Host $_})
    } Else {
        Write-Host "All Phases found"
        Write-Host
    }
    
    Write-Host "Tasks" -ForegroundColor Cyan
    If (($Tasks.GetEnumerator() | Where-Object {$_.Value -eq "0"}).Count -gt 0) {
        # Write-Host ($Tasks.GetEnumerator() | Where-Object {$_.Value -eq "0"} | Select-Object -ExpandProperty Name| ForEach-Object {Write-Host $_})
        $Tasks.GetEnumerator() | Where-Object {$_.Value -eq "0"} | Select-Object -Property @{Name = "Phase"; Expression = {$TaskMap[$_.Name]}}, Name | Sort-Object Phase | ForEach-Object {
            Write-Host $_.Phase -ForegroundColor Yellow -NoNewline
            Write-Host ": " -ForegroundColor Gray -NoNewline
            Write-Host $_.Name}
    } Else {
        Write-Host "All Tasks found"
    }
    Return
}


# All Created Resources are recorded, now it's time to fill in the blanks
If (($Phases.GetEnumerator() | Where-Object {$_.Value -eq "0"}).Count -gt 0 -or ($Tasks.GetEnumerator() | Where-Object {$_.Value -eq "0"}).Count -gt 0){
    Do {Write-Host
        Write-Host "Do you wish to continue to create missing Phases and Tasks?"
        $UserInput = Read-Host "(You can select S to show the phases and tasks that need to be created) [Y | S | N]"
        if ($UserInput.ToUpper().Substring(0,1) -eq "S") {
            Write-Host
            Write-Host "Phases" -ForegroundColor Cyan
            If (($Phases.GetEnumerator() | Where-Object {$_.Value -eq "0"}).Count -gt 0) {
                Write-Host ($Phases.GetEnumerator() | Where-Object {$_.Value -eq "0"} | Select-Object -ExpandProperty Name | ForEach-Object {Write-Host $_})
            } Else {
                Write-Host "All Phases found"
                Write-Host
            }
            Write-Host "Tasks" -ForegroundColor Cyan
            $Tasks.GetEnumerator() | Where-Object {$_.Value -eq "0"} | Select-Object -Property @{Name = "Phase"; Expression = {$TaskMap[$_.Name]}}, Name | Sort-Object Phase | ForEach-Object {
                Write-Host $_.Phase -ForegroundColor Yellow -NoNewline
                Write-Host ": " -ForegroundColor Gray -NoNewline
                Write-Host $_.Name}
        }}
      Until ($UserInput.ToUpper().Substring(0,1) -eq "Y" -or $UserInput.ToUpper().Substring(0,1) -eq "N")
    If ($UserInput.ToUpper().Substring(0,1) -eq "N") {Return}

    # Create Missing Phases
    Write-Host (Get-Date)' - ' -NoNewline
    Write-Host "Create Missing Phases" -ForegroundColor Cyan
    ForEach ($PhaseName in @($Phases.GetEnumerator() | Where-Object {$_.Value -eq "0"} | ForEach-Object {$_.Name})) {
        Write-Host "  Creating Phase $PhaseName"
        $url = $ADOOrg + '_apis/wit/workitems/$' + $PhaseWIType + '?api-version=5.1' 
        $body = DefinePhaseBody($PhaseName) 
        Try {$output = Invoke-RestMethod -Uri $url -Method Post -ContentType "application/json-patch+json" -Headers $header -Body $body}
        Catch {Write-Host
               Write-Host "  Error Writing Phase to ADO" -ForegroundColor Red
               Write-Host "  There was an error creating Phase: $PhaseName"
               Write-Host "  The json body submitted was:"
               Write-Host $body -ForegroundColor Yellow
               Write-Host "  Exiting script"
               Write-Host
               Return}
        $Phases[$PhaseName] = $output.id
        $PhaseURLs.Add($output.id, $output.url)
    }

    # Create Missing Tasks
    Write-Host (Get-Date)' - ' -NoNewline
    Write-Host "Create Missing Tasks" -ForegroundColor Cyan
    ForEach ($TaskName in @($Tasks.GetEnumerator() | Where-Object {$_.Value -eq "0"} | ForEach-Object {$_.Name})) {
        Write-Host "  Creating Task $TaskName"
        $url = $ADOOrg + '_apis/wit/workitems/$' + $TaskWIType + '?api-version=5.1'
        $PhaseURL = $PhaseURLs[$Phases[$TaskMap[$TaskName]]]
        $body = DefineTaskBody($TaskName)
        Try {$output = Invoke-RestMethod -Uri $url -Method Post -ContentType "application/json-patch+json" -Headers $header -Body $body}
        Catch {Write-Host
                Write-Host "  Error Writing Task to ADO" -ForegroundColor Red
                Write-Host "  There was an error creating Task: $TaskName"
                Write-Host "  The json body submitted was:"
                Write-Host $body -ForegroundColor Yellow
                Write-Host "  Exiting script"
                Write-Host
                Return}
        $Tasks[$TaskName] = $Phases[$TaskMap[$TaskName]].ToString() + "." + $output.id.ToString() 
    }
} Else {
    Write-Host "  All Phases and Tasks were found, this program appears to be complete." -ForegroundColor Green
}

# End nicely
$EndTime = Get-Date
$TimeDiff = New-TimeSpan $StartTime $EndTime
$Mins = $TimeDiff.Minutes
$Secs = $TimeDiff.Seconds
$RunTime = '{0:00}:{1:00} (M:S)' -f $Mins,$Secs
Write-Host (Get-Date)' - ' -NoNewline
Write-Host "Script completed" -ForegroundColor Green
Write-Host "  Time to complete: $RunTime"
Write-Host
