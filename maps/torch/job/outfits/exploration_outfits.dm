/decl/hierarchy/outfit/job/torch/crew/exploration/New()
	..()
	backpack_overrides[/decl/backpack_outfit/backpack]      = /obj/item/storage/backpack/explorer
	backpack_overrides[/decl/backpack_outfit/satchel]       = /obj/item/storage/backpack/satchel/explorer
	backpack_overrides[/decl/backpack_outfit/messenger_bag] = /obj/item/storage/backpack/messenger/explorer

/decl/hierarchy/outfit/job/torch/crew/exploration/pathfinder
	name = OUTFIT_JOB_NAME("Pathfinder")
	uniform = /obj/item/clothing/under/syndicate/tacticool
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types= list(/obj/item/card/id/torch/crew/pathfinder)
	pda_type = /obj/item/modular_computer/pda/explorer
	l_ear = /obj/item/device/radio/headset/pathfinder

/decl/hierarchy/outfit/job/torch/crew/exploration/explorer
	name = OUTFIT_JOB_NAME("Explorer")
	uniform = /obj/item/clothing/under/syndicate
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types= list(/obj/item/card/id/torch/crew/explorer)
	pda_type = /obj/item/modular_computer/pda/explorer
	l_ear = /obj/item/device/radio/headset/exploration

/decl/hierarchy/outfit/job/torch/passenger/pilot
	name = OUTFIT_JOB_NAME("Shuttle Pilot")
	uniform = /obj/item/clothing/under/color/black
	shoes = /obj/item/clothing/shoes/dutyboots
	l_ear = /obj/item/device/radio/headset/headset_pilot
	id_types= list(/obj/item/card/id/torch/passenger/research/nt_pilot)
	head = /obj/item/clothing/head/helmet/solgov/pilot
	pda_type = /obj/item/modular_computer/pda/explorer

/decl/hierarchy/outfit/job/torch/crew/exploration/pilot_fleet
	name = OUTFIT_JOB_NAME("Shuttle Pilot - Fleet")
	uniform = /obj/item/clothing/under/lordan/utility/fleet/command/pilot
	shoes = /obj/item/clothing/shoes/lordan
	head = /obj/item/clothing/head/beret/lordan/fleet
	id_types= list(/obj/item/card/id/torch/passenger/research/nt_pilot)
	l_ear = /obj/item/device/radio/headset/headset_pilot
