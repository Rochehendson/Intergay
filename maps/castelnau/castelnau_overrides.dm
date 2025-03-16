///
//MISC THINGS
///

/obj/item/paper
	language = LANGUAGE_SPACER

/obj/item/storage/secure/briefcase/nukedisk
	startswith = list(
		/obj/item/disk/nuclear,
		/obj/item/pinpointer,
		/obj/item/folder/envelope/nuke_instructions,
		/obj/item/modular_computer/laptop/preset/custom_loadout/cheap,
//		/obj/item/folder/envelope/rep
	)

/obj/item/clothing/suit/armor/pcarrier/light/security
	accessories = list(
		/obj/item/clothing/accessory/armor_plate,
		/obj/item/clothing/accessory/storage/pouches,
	)

/obj/structure/closet/emcloset/WillContain()
	return list(/obj/item/tank/oxygen_emergency = 2,
				/obj/item/clothing/mask/breath = 2,
				/obj/item/storage/toolbox/emergency,
				/obj/item/inflatable/wall = 2,
				/obj/item/device/oxycandle,
				/obj/item/storage/med_pouch/oxyloss = 2,
				/obj/item/clothing/suit/space/emergency/skafandr,
				/obj/item/clothing/head/helmet/space/emergency/skafandr
	)

/turf/simulated/wall/r_wall/hull
	color = COLOR_DARK_GUNMETAL

/obj/machinery/sleeper
	icon = 'modular_mithra/icons/obj/Cryogenic2_1.dmi'

/obj/machinery/bodyscanner
	icon = 'modular_mithra/icons/obj/Cryogenic2_1.dmi'
	icon_state = "scanner_open"

/obj/machinery/bodyscanner/on_update_icon()
	if(!occupant)
		src.icon_state = "scanner_open"
	else
		src.icon_state = "scanner_green"

///decl/cultural_info/culture/nabber/b
//	valid_jobs = list(/datum/job/canworker)

/datum/language/spacer
	warning = "Automatically given if spawning on the Castelnau or with no languages"
	key = "0"
	colour = " "

/datum/language/human/lord
	warning = "Automatically given if spawning on the Cadaab."
	key = "6"
	colour = "spacer"

/datum/language/human/euro
	warning = "Automatically given if spawning on the Big Iron."
	key = "1"
	colour = "solcom"

/datum/language/machine
	key = "8"


/datum/nano_module/supply
	admin_access = list(access_castelnau_cheapskate_cargo)

///
//SUIT STORAGE
///

/obj/machinery/suit_storage_unit/standard_unit/castelnau
	suit= /obj/item/clothing/suit/space
	helmet = /obj/item/clothing/head/helmet/space/fishbowl
	tank = /obj/item/tank/oxygen
	mask = /obj/item/clothing/mask/breath
	req_access = list(access_castelnau_eva)

/obj/machinery/suit_storage_unit/atmos/castelnau
	name = "Atmospherics Voidsuit Storage Unit"
	suit= /obj/item/clothing/suit/space/void/atmos
	helmet = /obj/item/clothing/head/helmet/space/void/atmos
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen
	mask = /obj/item/clothing/mask/breath
	req_access = list(access_castelnau_atmospherics)
	islocked = 1

/obj/machinery/suit_storage_unit/atmos/castelnau/alt
	suit= /obj/item/clothing/suit/space/void/atmos/alt
	helmet = /obj/item/clothing/head/helmet/space/void/atmos/alt
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen
	mask = /obj/item/clothing/mask/breath
	req_access = list(access_castelnau_security)

/obj/machinery/suit_storage_unit/engineering/castelnau
	name = "Engineering Voidsuit Storage Unit"
	suit= /obj/item/clothing/suit/space/void/engineering
	helmet = /obj/item/clothing/head/helmet/space/void/engineering
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen
	mask = /obj/item/clothing/mask/breath
	req_access = list(access_castelnau_engineering)
	islocked = 1

/obj/machinery/suit_storage_unit/engineering/castelnau/alt
	suit= /obj/item/clothing/suit/space/void/engineering/alt
	helmet = /obj/item/clothing/head/helmet/space/void/engineering/alt
	mask = /obj/item/clothing/mask/breath

/obj/machinery/suit_storage_unit/engineering/castelnau/salvage
	suit= /obj/item/clothing/suit/space/void/engineering/salvage
	helmet = /obj/item/clothing/head/helmet/space/void/engineering/salvage
	mask = /obj/item/clothing/mask/breath

/obj/machinery/suit_storage_unit/medical/castelnau
	name = "Medical Voidsuit Storage Unit"
	suit= /obj/item/clothing/suit/space/void/medical
	helmet = /obj/item/clothing/head/helmet/space/void/medical
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen
	mask = /obj/item/clothing/mask/breath
	req_access = list(access_castelnau_medical)
	islocked = 1

/obj/machinery/suit_storage_unit/medical/castelnau/alt
	suit= /obj/item/clothing/suit/space/void/medical/alt
	helmet = /obj/item/clothing/head/helmet/space/void/medical/alt
	mask = /obj/item/clothing/mask/breath

/obj/machinery/suit_storage_unit/mining/castelnau
	name = "Mining Voidsuit Storage Unit"
	suit= /obj/item/clothing/suit/space/void/mining
	helmet = /obj/item/clothing/head/helmet/space/void/mining
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen
	mask = /obj/item/clothing/mask/breath
	req_access = list(access_castelnau_hangar)
	islocked = 1

/obj/machinery/suit_storage_unit/mining/castelnau/alt
	suit= /obj/item/clothing/suit/space/void/mining/alt
	helmet = /obj/item/clothing/head/helmet/space/void/mining/alt
	mask = /obj/item/clothing/mask/breath

/obj/machinery/suit_storage_unit/castelnau/security
	name = "Security Voidsuit Storage Unit"
	suit= /obj/item/clothing/suit/space/void/security
	helmet = /obj/item/clothing/head/helmet/space/void/security
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen
	mask = /obj/item/clothing/mask/breath
	req_access = list(access_castelnau_brig)
	islocked = 1

/obj/machinery/suit_storage_unit/security/castelnau/alt
	suit= /obj/item/clothing/suit/space/void/security/alt
	helmet = /obj/item/clothing/head/helmet/space/void/security/alt
	mask = /obj/item/clothing/mask/breath

///
//SUIT CYCLERS
///

/obj/machinery/suit_cycler/engineering/castelnau
	name = "Engineering suit cycler"
	model_text = "Engineering"
	req_access = list(access_castelnau_engineering)
	available_modifications = list(/decl/item_modifier/space_suit/engineering, /decl/item_modifier/space_suit/atmos)
	species = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_UNATHI) //Add Unathi when sprites exist for their suits.

/obj/machinery/suit_cycler/engineering/castelnau/alt
	available_modifications = list(
		/decl/item_modifier/space_suit/engineering/alt,
		/decl/item_modifier/space_suit/atmos/alt,
		/decl/item_modifier/space_suit/hazard
	)

/obj/machinery/suit_cycler/mining/castelnau
	name = "Mining suit cycler"
	model_text = "Mining"
	req_access = list(access_castelnau_hangar)
	available_modifications = list(/decl/item_modifier/space_suit/mining)
	species = list(SPECIES_HUMAN,SPECIES_SKRELL,SPECIES_UNATHI)


/obj/machinery/suit_cycler/salvage/castelnau
	name = "Salvage suit cycler"
	model_text = "Salvage"
	req_access = list()
	available_modifications = list(/decl/item_modifier/space_suit/salvage)
	species = list(SPECIES_HUMAN,SPECIES_SKRELL,SPECIES_UNATHI)

/obj/machinery/suit_cycler/security/castelnau
	name = "Security suit cycler"
	model_text = "Security"
	req_access = list(access_castelnau_brig)
	available_modifications = list(/decl/item_modifier/space_suit/security, /decl/item_modifier/space_suit/security/alt)
	species = list(SPECIES_HUMAN,SPECIES_SKRELL,SPECIES_UNATHI)

/obj/machinery/suit_cycler/security/castelnau/alt
	available_modifications = list(/decl/item_modifier/space_suit/security/alt)

/obj/machinery/suit_cycler/medical/castelnau
	name = "Medical suit cycler"
	model_text = "Medical"
	req_access = list(access_castelnau_medical)
	available_modifications = list(/decl/item_modifier/space_suit/medical)
	species = list(SPECIES_HUMAN,SPECIES_SKRELL,SPECIES_UNATHI)

/obj/machinery/suit_cycler/medical/castelnau/alt
	available_modifications = list(/decl/item_modifier/space_suit/medical/alt)

/obj/machinery/suit_cycler/pilot/castelnau
	name = "Pilot suit cycler"
	model_text = "Pilot"
	req_access = list()
	available_modifications = list(/decl/item_modifier/space_suit/pilot)
	species = list(SPECIES_HUMAN,SPECIES_SKRELL,SPECIES_UNATHI)

/obj/machinery/suit_cycler/command/castelnau
	name = "Command suit cycler"
	model_text = "Command"
	req_access = list(access_castelnau_bridge)
	available_modifications = list(/decl/item_modifier/space_suit/command)
	species = list(SPECIES_HUMAN,SPECIES_SKRELL)

///
//ACCESS OVERRIDES
///

/obj/machinery/vending/boozeomat
	req_access = list(access_castelnau_bar)

/obj/machinery/vending/dinnerware
	req_access = list(access_castelnau_kitchen)

/obj/machinery/vending/engivend
	req_access = list(access_castelnau_engineering)

/obj/machinery/vending/engineering
	req_access = list(access_castelnau_engineering)

/obj/machinery/vending/robotics
	req_access = list(access_castelnau_englab)

/obj/machinery/vending/security
	req_access = list(access_castelnau_security)

/obj/machinery/vending/medical
	req_access = list(access_castelnau_medical)

/datum/nano_module/program/comm
	admin_access = list(access_castelnau_bridge)

/datum/computer_file/program/atmos_control
	required_access = access_castelnau_atmospherics

/datum/computer_file/program/power_monitor
	required_access = access_castelnau_engineering

/datum/computer_file/program/rcon_console
	required_access = access_castelnau_engineering

/datum/computer_file/program/shields_monitor
	required_access = access_castelnau_engineering

/datum/computer_file/program/supermatter_monitor
	required_access = access_castelnau_engineering

/datum/nano_module/deck_management
	default_access = access_castelnau_bridge

/datum/computer_file/program/docking
	required_access = access_castelnau_bridge

/datum/nano_module/supply
	admin_access = access_castelnau_cheapskate_cargo

/datum/nano_module/records
	bridge = access_castelnau_bridge
	medical = access_castelnau_medical
	security = access_castelnau_security
	detective = access_castelnau_detective

/datum/computer_file/program/suit_sensors
	required_access = access_castelnau_medical

/datum/computer_file/program/digitalwarrant
	required_access = access_castelnau_security

/datum/computer_file/program/forceauthorization
	required_access = access_castelnau_armory

/datum/computer_file/program/merchant
	required_access = access_castelnau_cheapskate_shop

/datum/nano_module/records
	bridge = access_castelnau_bridge
	medical = access_castelnau_medical
	security = access_castelnau_security
	detective = access_castelnau_detective

/obj/machinery/barrier
	req_access = list(access_castelnau_security)

/obj/machinery/computer/account_database
	needed_access = list(list(access_castelnau_captain, access_castelnau_comoffice))

/obj/item/airlock_electronics
	req_access = list(access_castelnau_engine)

////
// ASPECTS OVERRIDE
///

/datum/round_aspect/contraband
	spawn_area = /area/cadaab

/datum/round_aspect/traps
	spawn_area = /area/cadaab

////
// EVAC OVERRIDE(for sandstorm)
////

/datum/evacuation_controller/call_evacuation(var/mob/user, var/_emergency_evac, var/forced, var/skip_announce, var/autotransfer)
	. = ..()
	var/datum/sandstorm/storm = new /datum/sandstorm
	storm.is_coming()

////
// EVENTS OVERRDIE
////

/datum/event_container/mundane
	available_events = list(
		// Severity level, event name, event type, base weight, role weights, one shot, min weight, max weight. Last two only used if set and non-zero
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Nothing",						/datum/event/nothing,				100),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "APC Damage",					/datum/event/apc_damage,			20, 	list(ASSIGNMENT_ENGINEER = 10)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Computer Damage",				/datum/event/computer_damage,		20, 	list(ASSIGNMENT_ENGINEER = 10)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Computer Update",				/datum/event/computer_update,		20),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Brand Intelligence",			/datum/event/brand_intelligence,	10, 	list(ASSIGNMENT_JANITOR = 10),	1),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Camera Damage",					/datum/event/camera_damage,			20, 	list(ASSIGNMENT_ENGINEER = 10)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Economic News",					/datum/event/economic_event,		300),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Money Hacker",					/datum/event/money_hacker, 			0, 		list(ASSIGNMENT_ANY = 4), 1, 10, 25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Money Lotto",					/datum/event/money_lotto, 			0, 		list(ASSIGNMENT_ANY = 1), 1, 5, 15),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mundane News", 					/datum/event/mundane_news, 			300),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Shipping Error",				/datum/event/shipping_error	, 		30, 	list(ASSIGNMENT_ANY = 2), 0),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Sensor Suit Jamming",			/datum/event/sensor_suit_jamming,	50,		list(ASSIGNMENT_MEDICAL = 20, ASSIGNMENT_AI = 20), 1),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Trivial News",					/datum/event/trivial_news, 			400),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Vermin Infestation",			/datum/event/infestation, 			100,	list(ASSIGNMENT_JANITOR = 100)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Wallrot",						/datum/event/wallrot, 				0,		list(ASSIGNMENT_ENGINEER = 30, ASSIGNMENT_GARDENER = 50)),
		new /datum/event_meta/no_overmap(EVENT_LEVEL_MUNDANE, "Electrical Storm",	/datum/event/electrical_storm, 		20,		list(ASSIGNMENT_ENGINEER = 20, ASSIGNMENT_JANITOR = 100)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Toilet Clog",					/datum/event/toilet_clog,			50, 	list(ASSIGNMENT_JANITOR = 20)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Drone Malfunction",				/datum/event/rogue_maint_drones,	10,		list(ASSIGNMENT_ENGINEER = 30)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Disposals Explosion",			/datum/event/disposals_explosion,	50,		list(ASSIGNMENT_ENGINEER = 40)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Brain Expansion",				/datum/event/brain_expansion,		20,		list(ASSIGNMENT_SCIENTIST = 20)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mail Delivery",					/datum/event/mail,					5,		list(ASSIGNMENT_ANY = 1), 1),
	)

/datum/event_container/moderate
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Nothing",								/datum/event/nothing,					1230),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Appendicitis", 						/datum/event/spontaneous_appendicitis, 	0,		list(ASSIGNMENT_MEDICAL = 10), 1),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Communication Blackout",				/datum/event/communications_blackout,	100,	list(ASSIGNMENT_AI = 100, ASSIGNMENT_ENGINEER = 20)),
		new /datum/event_meta/no_overmap(EVENT_LEVEL_MODERATE, "Electrical Storm",			/datum/event/electrical_storm, 			10,		list(ASSIGNMENT_ENGINEER = 15, ASSIGNMENT_JANITOR = 10)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Grid Check",							/datum/event/grid_check, 				200,	list(ASSIGNMENT_ENGINEER = 10)),
		new /datum/event_meta/no_overmap(EVENT_LEVEL_MODERATE, "Ion Storm",					/datum/event/ionstorm, 					0,		list(ASSIGNMENT_AI = 50, ASSIGNMENT_CYBORG = 50, ASSIGNMENT_ENGINEER = 15, ASSIGNMENT_SCIENTIST = 5)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Prison Break",							/datum/event/prison_break,				0,		list(ASSIGNMENT_SECURITY = 100)),
		new /datum/event_meta/extended_penalty(EVENT_LEVEL_MODERATE, "Random Antagonist",	/datum/event/random_antag,				2.5,	list(ASSIGNMENT_SECURITY = 1), 1, 0, 5),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Rogue Drones",							/datum/event/rogue_drone, 				20,		list(ASSIGNMENT_SECURITY = 20)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Sensor Suit Jamming",					/datum/event/sensor_suit_jamming,		10,		list(ASSIGNMENT_MEDICAL = 20, ASSIGNMENT_AI = 20)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Spider Infestation",					/datum/event/spider_infestation, 		0,		list(ASSIGNMENT_SECURITY = 10), 1),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Toilet Flooding",						/datum/event/toilet_clog/flood,			50, 	list(ASSIGNMENT_JANITOR = 20)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Drone Uprising",						/datum/event/rogue_maint_drones,		25,		list(ASSIGNMENT_ENGINEER = 30)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Supply Pod",							/datum/event/supply_pod,				10,		list(ASSIGNMENT_ENGINEER = 20, ASSIGNMENT_SECURITY = 10)), //BoS
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Psi Wave",								/datum/event/psi_wave,					10,		list(ASSIGNMENT_SECURITY = 20, ASSIGNMENT_MEDICAL = 10)), //BoS
	)

/datum/event_container/major
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Nothing",							/datum/event/nothing,				1320),
		new /datum/event_meta/no_overmap(EVENT_LEVEL_MAJOR, "Electrical Storm",		/datum/event/electrical_storm, 		0,	list(ASSIGNMENT_ENGINEER = 10, ASSIGNMENT_JANITOR = 5)),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Drone Revolution",				/datum/event/rogue_maint_drones,	0,	list(ASSIGNMENT_ENGINEER = 10,ASSIGNMENT_MEDICAL = 10,ASSIGNMENT_SECURITY = 10)),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Spider Infestation",				/datum/event/spider_infestation, 	0,	list(ASSIGNMENT_SECURITY = 10), 1),
	)
