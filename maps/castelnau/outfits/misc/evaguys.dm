/decl/hierarchy/outfit/job/castelnau/reg/outlead
	name = OUTFIT_JOB_NAME("Outpost Leader - Castelnau")
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/regulator/juncom
	l_ear = /obj/item/device/radio/headset/heads/castelnau_outlead
	id_types = list(/obj/item/card/id/castelnau/crew/outpost)
	pda_type = /obj/item/modular_computer/pda/heads

/decl/hierarchy/outfit/job/castelnau/reg/outsec
	name = OUTFIT_JOB_NAME("Outpost Security - Castelnau")
	id_types = list(/obj/item/card/id/castelnau/crew/outpost/sec)
	uniform = /obj/item/clothing/under/regulator/security
	suit = /obj/item/clothing/suit/armor/pcarrier/medium
	l_ear = /obj/item/device/radio/headset/heads/castelnau_outsec
	pda_type = /obj/item/modular_computer/pda/security
	pda_slot = slot_l_store
	l_pocket = /obj/item/device/flash
	r_pocket = /obj/item/handcuffs

/decl/hierarchy/outfit/job/castelnau/reg/outeng
	name = OUTFIT_JOB_NAME("Outpost Engineer - Castelnau")
	uniform = /obj/item/clothing/under/regulator/engineer
	id_types = list(/obj/item/card/id/castelnau/crew/outpost/eng)
	pda_type = /obj/item/modular_computer/pda/engineering
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL
	l_ear = /obj/item/device/radio/headset/heads/castelnau_outeng

/decl/hierarchy/outfit/job/castelnau/reg/outmed
	name = OUTFIT_JOB_NAME("Outpost Medic - Castelnau")
	l_ear = /obj/item/device/radio/headset/heads/castelnau_outmed
	uniform = /obj/item/clothing/under/regulator/medic
	pda_type = /obj/item/modular_computer/pda/medical
	pda_slot = slot_l_store
	id_types = list(/obj/item/card/id/castelnau/crew/outpost/med)