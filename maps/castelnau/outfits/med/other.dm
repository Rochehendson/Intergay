/decl/hierarchy/outfit/job/castelnau/med
	l_ear = /obj/item/device/radio/headset/headset_med
	shoes = /obj/item/clothing/shoes/white
	uniform = /obj/item/clothing/under/rank/medical/scrubs
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	pda_type = /obj/item/modular_computer/pda/medical
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/castelnau/med/doctor
	name = OUTFIT_JOB_NAME("FreeDoctor - Castelnau")
	id_types = list(/obj/item/card/id/castelnau/crew/medical)
	l_ear = /obj/item/device/radio/headset/heads/castelnau_med

/decl/hierarchy/outfit/job/castelnau/med/doctor/paramedic
	name = OUTFIT_JOB_NAME("FreeParamedic - Castelnau")
	uniform = /obj/item/clothing/under/rank/medical/paramedic
	suit = /obj/item/clothing/suit/storage/toggle/fr_jacket
	shoes = /obj/item/clothing/shoes/jackboots
	l_hand = /obj/item/storage/firstaid/adv
	belt = /obj/item/storage/belt/medical/emt
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL
	l_ear = /obj/item/device/radio/headset/heads/castelnau_med

/decl/hierarchy/outfit/job/castelnau/med/doctor/chemist
	name = OUTFIT_JOB_NAME("FreeChemist - Castelnau")
	uniform = /obj/item/clothing/under/rank/chemist
	pda_type = /obj/item/modular_computer/pda/chemistry
	l_ear = /obj/item/device/radio/headset/heads/castelnau_med