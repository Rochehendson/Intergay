/decl/hierarchy/outfit/job/castelnau/crew/medical
	hierarchy_type = /decl/hierarchy/outfit/job/castelnau/crew/medical
	l_ear = /obj/item/device/radio/headset/headset_med
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/modular_computer/pda/medical
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/castelnau/crew/medical/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/castelnau/crew/medical/senior
	name = OUTFIT_JOB_NAME("Surgeon - Castelnau")
	uniform = /obj/item/clothing/under/rank/medical/scrubs
	id_types = list(/obj/item/card/id/castelnau/crew/medical/senior)

/decl/hierarchy/outfit/job/castelnau/crew/medical/senior/traumasurgeon
	name = OUTFIT_JOB_NAME("Trauma Surgeon - Castelnau")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/blue

/decl/hierarchy/outfit/job/castelnau/crew/medical/doctor
	name = OUTFIT_JOB_NAME("Doctor - Castelnau")
	uniform = /obj/item/clothing/under/rank/medical
	id_types = list(/obj/item/card/id/castelnau/crew/medical)

/decl/hierarchy/outfit/job/castelnau/crew/medical/doctor/paramedic
	name = OUTFIT_JOB_NAME("Paramedic - Castelnau")
	uniform = /obj/item/clothing/under/rank/medical/paramedic
	suit = /obj/item/clothing/suit/storage/toggle/fr_jacket
	shoes = /obj/item/clothing/shoes/jackboots
	l_hand = /obj/item/storage/firstaid/adv
	belt = /obj/item/storage/belt/medical/emt
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/castelnau/crew/medical/doctor/chemist
	name = OUTFIT_JOB_NAME("Chemist - Castelnau")
	uniform = /obj/item/clothing/under/rank/chemist
	pda_type = /obj/item/modular_computer/pda/chemistry
	id_types = list(/obj/item/card/id/castelnau/crew/medical/chemist)

/decl/hierarchy/outfit/job/castelnau/crew/medical/doctor/chemist/New()
	..()
	BACKPACK_OVERRIDE_CHEMISTRY
