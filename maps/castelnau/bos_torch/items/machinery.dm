//Shouldn't be a lot in here, only torch versions of existing machines that need a different access req or something along those lines.

/obj/machinery/vending/medical/torch
	req_access = list(access_medical)

/obj/machinery/drone_fabricator/torch
	fabricator_tag = "LRS Antares Maintenance"

/obj/machinery/drone_fabricator/torch/adv
	name = "advanced drone fabricator"
	fabricator_tag = "SFV Arrow Maintenance"
	drone_type = /mob/living/silicon/robot/drone/construction

///ai cons
/obj/machinery/drone_fabricator/dagon //not needed, but just as a base
	fabricator_tag = "LRS Antares Maintenance"

/obj/machinery/drone_fabricator/dagon/adv
	name = "advanced drone fabricator"
	fabricator_tag = "AI Data Room"
	drone_type = /mob/living/silicon/robot/drone/construction

//telecommunications gubbins for torch-specific networks

/obj/machinery/telecomms/hub/preset
	id = "Hub"
	network = "tcommsat"
	autolinkers = list("hub", "relay", "c_relay", "s_relay", "m_relay", "r_relay", "b_relay", "1_relay", "2_relay", "3_relay", "4_relay", "5_relay", "s_relay", "science", "medical",
	"supply", "service", "common", "command", "engineering", "security", "exploration", "unused", "infantry",
 	"receiverA", "broadcasterA")

/obj/machinery/telecomms/receiver/preset_right
	freq_listening = list(AI_FREQ, SCI_FREQ, MED_FREQ, SUP_FREQ, SRV_FREQ, COMM_FREQ, ENG_FREQ, SEC_FREQ, INF_FREQ, ENT_FREQ, EXP_FREQ, TERR_FREQ) //I HATE BOS, I HATE BOS ~evie

/obj/machinery/telecomms/bus/preset_two
	freq_listening = list(SUP_FREQ, SRV_FREQ, EXP_FREQ)
	autolinkers = list("processor2", "supply", "service", "exploration", "unused")

/obj/machinery/telecomms/server/presets/service
	id = "Service and Exploration Server"
	freq_listening = list(SRV_FREQ, EXP_FREQ)
	channel_tags = list(
		list(SRV_FREQ, "Service", COMMS_COLOR_SERVICE),
		list(EXP_FREQ, "Exploration", COMMS_COLOR_EXPLORER)
	)
	autolinkers = list("service", "exploration")

/obj/machinery/telecomms/server/presets/exploration
	id = "Utility Server"
	freq_listening = list(EXP_FREQ)
	channel_tags = list(list(EXP_FREQ, "Exploration", COMMS_COLOR_EXPLORER))
	autolinkers = list("Exploration")

// Suit cyclers and storage
/obj/machinery/suit_cycler/exploration
	name = "Exploration suit cycler"
	model_text = "Exploration"
	req_access = list(access_explorer)
	available_modifications = list(/decl/item_modifier/space_suit/explorer)
	species = list(SPECIES_HUMAN,SPECIES_SKRELL,SPECIES_UNATHI)

/obj/machinery/suit_storage_unit/explorer
	name = "Exploration Voidsuit Storage Unit"
	suit = /obj/item/clothing/suit/space/void/exploration
	helmet = /obj/item/clothing/head/helmet/space/void/exploration
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen
	mask = /obj/item/clothing/mask/breath
	req_access = list(access_explorer)
	islocked = 1

/obj/machinery/suit_storage_unit/pilot
	name = "Pilot Voidsuit Storage Unit"
	suit = /obj/item/clothing/suit/space/void/pilot
	helmet = /obj/item/clothing/head/helmet/space/void/pilot
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen
	mask = /obj/item/clothing/mask/breath
	req_access = list(access_pilot)
	islocked = 1

/obj/machinery/suit_storage_unit/command
	name = "Command Voidsuit Storage Unit"
	suit = /obj/item/clothing/suit/space/void/command
	helmet = /obj/item/clothing/head/helmet/space/void/command
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen
	mask = /obj/item/clothing/mask/breath
	req_access = list(access_bridge, access_keycard_auth)
	islocked = 1

// Vending machines & dispensers
/obj/machinery/vending/security
	products = list(
		/obj/item/handcuffs = 14,
		/obj/item/handcuffs/ziptie = 8,
		/obj/item/grenade/flashbang = 4,
		/obj/item/grenade/chem_grenade/teargas = 4,
		/obj/item/device/flash = 7,
		/obj/item/reagent_containers/spray/pepper = 4,
		/obj/item/device/holowarrant = 4,
		/obj/item/reagent_containers/food/snacks/donut/normal = 12,
		/obj/item/storage/box/evidence = 8,
		/obj/item/clothing/suit/armor/pcarrier/navy = 6,
		/obj/item/clothing/suit/armor/pcarrier/blue = 6,
		/obj/item/clothing/suit/armor/pcarrier/green = 6,
		/obj/item/clothing/suit/armor/pcarrier/tan = 6,
		/obj/item/clothing/suit/armor/pcarrier/grey = 6,
		/obj/item/clothing/accessory/storage/pouches = 6,
		/obj/item/clothing/accessory/storage/pouches/large = 6,
		/obj/item/clothing/accessory/storage/pouches/navy = 6,
		/obj/item/clothing/accessory/storage/pouches/large/navy = 6,
		/obj/item/clothing/accessory/storage/pouches/blue = 6,
		/obj/item/clothing/accessory/storage/pouches/large/blue = 6,
		/obj/item/clothing/accessory/storage/pouches/green = 6,
		/obj/item/clothing/accessory/storage/pouches/large/green = 6,
		/obj/item/clothing/accessory/storage/pouches/tan = 6,
		/obj/item/clothing/accessory/storage/pouches/large/tan = 6,
		/obj/item/clothing/accessory/storage/pouches/grey = 6,
		/obj/item/clothing/accessory/storage/pouches/large/grey = 6,
		/obj/item/clothing/accessory/helmet_cover/navy = 6,
		/obj/item/clothing/accessory/helmet_cover/blue = 6,
		/obj/item/clothing/accessory/helmet_cover/green = 6,
		/obj/item/clothing/accessory/helmet_cover/tan = 6,
//		/obj/item/clothing/accessory/helmet_cover/grey = 6,
		/obj/item/clothing/accessory/badge/solgov/security = 6)
