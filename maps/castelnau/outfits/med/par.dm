/decl/hierarchy/outfit/job/castelnau/par/med
	l_ear = /obj/item/device/radio/headset/heads/castelnau_med
	shoes = /obj/item/clothing/shoes/white
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	pda_type = /obj/item/modular_computer/pda/medical
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/castelnau/par/med/doctor
	name = OUTFIT_JOB_NAME("ParDoctor - Castelnau")
	id_types = list(/obj/item/card/id/castelnau/crew/medical)

/decl/hierarchy/outfit/job/castelnau/par/med/doctor/paramedic
	name = OUTFIT_JOB_NAME("ParParamedic - Castelnau")
	suit = /obj/item/clothing/suit/storage/toggle/fr_jacket
	shoes = /obj/item/clothing/shoes/jackboots
	l_hand = /obj/item/storage/firstaid/adv
	belt = /obj/item/storage/belt/medical/emt
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/castelnau/par/med/doctor/chemist
	name = OUTFIT_JOB_NAME("Chemist - Castelnau")
	pda_type = /obj/item/modular_computer/pda/chemistry
//	id_types = list(/obj/item/card/id/castelnau/crew/medical/chemist)