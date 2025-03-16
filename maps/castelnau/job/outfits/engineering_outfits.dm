/decl/hierarchy/outfit/job/castelnau/crew/engineering
	hierarchy_type = /decl/hierarchy/outfit/job/castelnau/crew/engineering
	l_ear = /obj/item/device/radio/headset/headset_eng
	pda_type = /obj/item/modular_computer/pda/engineering
	pda_slot = slot_l_store
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/castelnau/crew/engineering/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/castelnau/crew/engineering/senior_engineer
	name = OUTFIT_JOB_NAME("Senior Engineer - Castelnau")
	uniform = /obj/item/clothing/under/regulator
	shoes = /obj/item/clothing/shoes/workboots
	id_types = list(/obj/item/card/id/castelnau/crew/engineering/senior)
	pda_type = /obj/item/modular_computer/pda/heads/ce