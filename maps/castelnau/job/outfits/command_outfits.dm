/decl/hierarchy/outfit/job/castelnau/crew/command
	name = OUTFIT_JOB_NAME("Castelnau Command Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/castelnau/crew/command
	l_ear = /obj/item/device/radio/headset/headset_com
	pda_type = /obj/item/modular_computer/pda/heads

/decl/hierarchy/outfit/job/castelnau/crew/command/captain
	name = OUTFIT_JOB_NAME("Captain - Castelnau")
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/color/blue
	l_ear = /obj/item/device/radio/headset/heads/castelnau_captain
	shoes = /obj/item/clothing/shoes/brown
	head = /obj/item/clothing/head/caphat
	id_types = list(/obj/item/card/id/castelnau/gold)
	pda_type = /obj/item/modular_computer/pda/captain

/decl/hierarchy/outfit/job/castelnau/crew/command/captain/New()
	..()
	backpack_overrides[/decl/backpack_outfit/backpack] = /obj/item/storage/backpack
	backpack_overrides[/decl/backpack_outfit/satchel] = /obj/item/storage/backpack/satchel
	backpack_overrides[/decl/backpack_outfit/messenger_bag] = /obj/item/storage/backpack/messenger/com

/decl/hierarchy/outfit/job/castelnau/crew/command/hop
	name = OUTFIT_JOB_NAME("First Officer - Castelnau")
	uniform = /obj/item/clothing/under/color/blue
	l_ear = /obj/item/device/radio/headset/heads/hop
	shoes = /obj/item/clothing/shoes/laceup
	id_types = list(/obj/item/card/id/castelnau/silver)
	pda_type = /obj/item/modular_computer/pda/heads/hop

/decl/hierarchy/outfit/job/castelnau/crew/command/adjutant
	name = OUTFIT_JOB_NAME("Second Officer - Castelnau")
	uniform = /obj/item/clothing/under/color/blue
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/device/radio/headset/adjutant
	id_types = list(/obj/item/card/id/castelnau/crew/adjutant)
