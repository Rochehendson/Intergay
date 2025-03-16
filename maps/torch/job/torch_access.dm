/************
* SEV Torch *
************/
/var/const/access_hangar = "ACCESS_TORCH_HANGAR" //73
/datum/access/hangar
	id = access_hangar
	desc = "Hangar Deck"
	region = ACCESS_REGION_GENERAL

/var/const/access_guppy_helm = "ACCESS_TORCH_GUP_HELM" //76
/datum/access/guppy_helm
	id = access_guppy_helm
	desc = "SGRP General Utility Pod Helm"
	region = ACCESS_REGION_GENERAL

/var/const/access_expedition_shuttle_helm = "ACCESS_EXPLO_HELM" //77
/datum/access/exploration_shuttle_helm
	id = access_expedition_shuttle_helm
	desc = "SGEV Charon Helm"
	region = ACCESS_REGION_GENERAL

/var/const/access_aquila = "ACCESS_TORCH_AQUILA" //78
/datum/access/aquila
	id = access_aquila
	desc = "SGGS Aquila"
	region = ACCESS_REGION_GENERAL

/var/const/access_aquila_helm = "ACCESS_TORCH_AQUILA_HELM" //79
/datum/access/aquila_helm
	id = access_aquila_helm
	desc = "SGGS Aquila Helm"
	region = ACCESS_REGION_GENERAL

/var/const/access_solgov_crew = "ACCESS_TORCH_CREW" //80
/datum/access/solgov_crew
	id = access_solgov_crew
	desc = "Antares Crew"
	region = ACCESS_REGION_GENERAL

/var/const/access_nanotrasen = "ACCESS_TORCH_CORP" //81
/datum/access/nanotrasen
	id = access_nanotrasen
	desc = "Research Personnel"
	region = ACCESS_REGION_RESEARCH

/var/const/access_robotics_engineering = "ACCESS_TORCH_BIOMECH"  //82
/datum/access/robotics_engineering
	id = access_robotics_engineering
	desc = "Biomechanical Engineering"
	region = ACCESS_REGION_MEDBAY	// Minimal access to Medbay's Surgery

/var/const/access_emergency_armory = "ACCESS_TORCH_ARMORY" //83
/datum/access/emergency_armory
	id = access_emergency_armory
	desc = "Emergency Armory"
	region = ACCESS_REGION_COMMAND

/var/const/access_liaison = "ACCESS_TORCH_CORPORATE_LIAISON" //84
/datum/access/liaison
	id = access_liaison
	desc = "Corporate Liaison"
	region = ACCESS_REGION_COMMAND
	access_type = ACCESS_TYPE_NONE //Ruler of their own domain, CO cannot enter

/var/const/access_adjudicator = "ACCESS_ADJUDICATOR" //85
/datum/access/adjudicator
	id = access_adjudicator
	desc = "Adjudicator"
	region = ACCESS_REGION_COMMAND
	access_type = ACCESS_TYPE_NONE //Ruler of their own domain, CO cannot enter

/var/const/access_gun = "ACCESS_TORCH_CANNON" //87
/datum/access/gun
	id = access_gun
	desc = "Gunnery"
	region = ACCESS_REGION_COMMAND

/var/const/access_expedition_shuttle = "ACCESS_TORCH_EXPLO" //88
/datum/access/exploration_shuttle
	id = access_expedition_shuttle
	desc = "SGEV Charon"
	region = ACCESS_REGION_GENERAL

/var/const/access_guppy = "ACCESS_TORCH_GUP" //89
/datum/access/guppy
	id = access_guppy
	desc = "SGRP Guppy"
	region = ACCESS_REGION_GENERAL

/var/const/access_seneng = "ACCESS_TORCH_SENIOR_ENG" //90
/datum/access/seneng
	id = access_seneng
	desc = "Senior Engineer"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_senmed = "ACCESS_TORCH_SENIOR_MED" //91
/datum/access/senmed
	id = access_senmed
	desc = "Physician"
	region = ACCESS_REGION_MEDBAY

/var/const/access_senadv = "ACCESS_TORCH_SENIOR_ADVISOR" //92
/datum/access/senadv
	id = access_senadv
	desc = "Senior Enlisted Advisor"
	region = ACCESS_REGION_COMMAND

/var/const/access_explorer = "ACCESS_TORCH_EXPLORER" //93
/datum/access/explorer
	id = access_explorer
	desc = "Explorer"
	region = ACCESS_REGION_GENERAL

/var/const/access_pathfinder = "ACCESS_TORCH_PATHFINDER" //94
/datum/access/pathfinder
	id = access_pathfinder
	desc = "Pathfinder"
	region = ACCESS_REGION_GENERAL

/var/const/access_marines = "ACCESS_MARINES"
/datum/access/marines
	id = access_marines
	desc = "Marine"
	region = ACCESS_REGION_SERVICE

/var/const/access_marcom = "ACCESS_OFFICER"
/datum/access/marcom
	id = access_marcom
	desc = "Marine Officer"
	region = ACCESS_REGION_SERVICE

/var/const/access_marlead = "ACCESS_MARLEAD"
/datum/access/marlead
	id = access_marlead
	desc = "Marine Leader"
	region = ACCESS_REGION_SERVICE

/var/const/access_martech = "ACCESS_MARTECH"
/datum/access/martech
	id = access_martech
	desc = "Marine Technician"
	region = ACCESS_REGION_SERVICE

/var/const/access_marmed = "ACCESS_MARMED"
/datum/access/marmed
	id = access_marmed
	desc = "Marine Medic"
	region = ACCESS_REGION_SERVICE

/var/const/access_marspec = "ACCESS_MARSPEC"
/datum/access/marspec
	id = access_marspec
	desc = "Marine Specialist"
	region = ACCESS_REGION_SERVICE

/var/const/access_gunnery = "ACCESS_GUNNERY"
/datum/access/gunnery
	id = access_gunnery
	desc = "Gunnery Access"
	region = ACCESS_REGION_SECURITY

/var/const/access_chronicler = "ACCESS_CHRONICLER"
/datum/access/chronicler
	id = access_chronicler
	desc = "Chronicler Access"
	region = ACCESS_REGION_GENERAL

/var/const/access_commissary = "ACCESS_TORCH_SHOP" //96
/datum/access/commissary
	id = access_commissary
	desc = "Commissary"
	region = ACCESS_REGION_GENERAL

/var/const/access_representative = "ACCESS_REPRESENTATIVE" //97
/datum/access/representative
	id = access_representative
	desc = "ICCG Representative"
	region = ACCESS_REGION_COMMAND
	access_type = ACCESS_TYPE_NONE //Ruler of their own domain, CO cannot enter

/datum/access/psychiatrist
	desc = "Mental Health"

/datum/access/hos
	desc = "Chief of Security"

/datum/access/hop
	desc = "Executive Officer"

/datum/access/qm
	desc = "Requisitions Officer"

/************
* SEV Torch *
************/

/datum/access/robotics
	region = ACCESS_REGION_ENGINEERING

/datum/access/network
	region = ACCESS_REGION_COMMAND

/*************
* NRV Petrov *
*************/
/datum/access/research
	desc = "LRL Petrov"

/datum/access/research_storage
	desc = "LRL Petrov Equipment Storage"

/datum/access/tox
	desc = "LRL Petrov Toxins Lab"

/datum/access/tox_storage
	desc = "LRL Petrov Phoron Sublimation Lab"

/datum/access/rd
	desc = "Research Director"

/var/const/access_petrov_helm = "ACCESS_TORCH_PETROV_HELM" //201
/datum/access/petrov_helm
	id = access_petrov_helm
	desc = "LRL Petrov Helm"
	region = ACCESS_REGION_RESEARCH

/var/const/access_petrov_analysis = "ACCESS_TORCH_PETROV_ANALYSIS" //202
/datum/access/petrov_analysis
	id = access_petrov_analysis
	desc = "LRL Petrov Analysis Lab"
	region = ACCESS_REGION_RESEARCH

/var/const/access_petrov_chemistry = "ACCESS_TORCH_PETROV_CHEMISTRY" //205
/datum/access/petrov_chemistry
	id = access_petrov_chemistry
	desc = "LRL Petrov Chemistry Lab"
	region = ACCESS_REGION_RESEARCH

/var/const/access_petrov_security = "ACCESS_TORCH_PETROV_SEC" //207
/datum/access/petrov_security
	id = access_petrov_security
	desc = "LRL Petrov Security Office"
	region = ACCESS_REGION_RESEARCH

/var/const/access_petrov_maint = "ACCESS_TORCH_PETROV_MAINT" //208
/datum/access/petrov_maint
	id = access_petrov_maint
	desc = "LRL Petrov Maintenance"
	region = ACCESS_REGION_RESEARCH
