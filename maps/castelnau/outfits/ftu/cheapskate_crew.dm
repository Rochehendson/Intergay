/decl/hierarchy/outfit/job/cheapskate
	name = OUTFIT_JOB_NAME("FTU generic Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/cheapskate
	uniform = /obj/item/clothing/under/ftu
	suit = /obj/item/clothing/suit/storage/ftu
	head = /obj/item/clothing/head/ftu
	shoes = /obj/item/clothing/shoes/dress
	l_ear = /obj/item/device/radio/headset/heads/cheapskate_supply

/decl/hierarchy/outfit/job/cheapskate/cargo
	name = OUTFIT_JOB_NAME("FTU Cargo Outfit")
	uniform = /obj/item/clothing/under/ftu
	suit = /obj/item/clothing/suit/storage/ftu
	head = /obj/item/clothing/head/ftu
	id_types = list(/obj/item/card/id/castelnau/crew/supply)

/decl/hierarchy/outfit/job/cheapskate/security
	name = OUTFIT_JOB_NAME("FTU Security Outfit")
	uniform = /obj/item/clothing/under/ftu/security
	suit = null
	head = /obj/item/clothing/head/ftu
	id_types = list(/obj/item/card/id/castelnau/crew/cheapskate/sec)
	l_ear = /obj/item/device/radio/headset/heads/cheapskate_sec

/decl/hierarchy/outfit/job/cheapskate/merchant
	name = OUTFIT_JOB_NAME("FTU Merchant Outfit")
	uniform = /obj/item/clothing/under/ftu/trd
	head = /obj/item/clothing/head/ftu/beret
	id_types = list(/obj/item/card/id/castelnau/crew/cheapskate)

/decl/hierarchy/outfit/job/cheapskate/chief
	name = OUTFIT_JOB_NAME("FTU Chief Merchant Outfit")
	uniform = /obj/item/clothing/under/ftu/trd
	suit = /obj/item/clothing/suit/storage/ftu/chief
	head = /obj/item/clothing/head/ftu/chief
	id_types = list(/obj/item/card/id/castelnau/crew/cheapskate/chief)
	l_ear = /obj/item/device/radio/headset/heads/cheapskate_chief