/obj/effect/landmark/corpse/bos_cent
	name = "RegCom"
	corpse_outfits = list(/decl/hierarchy/outfit/bos_cent)
	spawn_flags = ~CORPSE_SPAWNER_RANDOM_NAME

/obj/effect/landmark/corpse/bos_cent/terra
	name = "TerrDip"
	corpse_outfits = list(/decl/hierarchy/outfit/bos_cent/terra)

/obj/effect/landmark/corpse/bos_cent/alliance
	name = "Alliance"
	corpse_outfits = list(/decl/hierarchy/outfit/bos_cent/alliance)

/obj/effect/landmark/corpse/bos_cent/kgb
	name = "KGB"
	corpse_outfits = list(/decl/hierarchy/outfit/bos_cent/kgb)

/decl/hierarchy/outfit/bos_cent
	name = "Regulators Command officer"
	glasses = /obj/item/clothing/glasses/sunglasses
	l_ear = /obj/item/device/radio/headset/heads/castelnau_coordinator
	id_types = list(/obj/item/card/id/castelnau/silver)
	pda_type = /obj/item/modular_computer/pda/heads/hop

/decl/hierarchy/outfit/bos_cent/terra
	name = "ICCG Diplomacy officer"
	uniform = /obj/item/clothing/under/terran/navy/service/command
	suit = /obj/item/clothing/suit/storage/terran/service/navy/command
	shoes = /obj/item/clothing/shoes/terran
	head = /obj/item/clothing/head/terran/navy/service/command
	pda_type = /obj/item/modular_computer/pda/heads

/decl/hierarchy/outfit/bos_cent/alliance
	name = "Alliance Observing officer"
	uniform = /obj/item/clothing/under/solgov/utility
	shoes = /obj/item/clothing/shoes/dutyboots
	glasses = /obj/item/clothing/glasses/sunglasses/big
	suit = /obj/item/clothing/suit/leathercoat
	id_types = list(/obj/item/card/id/castelnau/crew/emissary)
	pda_type = /obj/item/modular_computer/pda/heads
	l_ear = /obj/item/device/radio/headset/heads/castelnau_command

/decl/hierarchy/outfit/bos_cent/kgb
	name = "GSC Lieutenant"
	uniform = /obj/item/clothing/under/sl_suit
	suit = /obj/item/clothing/suit/storage/toggle/lordan/service/fleet/po/gsc
	head = /obj/item/clothing/head/helmet/kgb
	shoes = /obj/item/clothing/shoes/lordan/service
	id_types = list(/obj/item/card/id/castelnau/crew/commissary)
	pda_type = /obj/item/modular_computer/pda/heads
	l_ear = /obj/item/device/radio/headset/heads/castelnau_command