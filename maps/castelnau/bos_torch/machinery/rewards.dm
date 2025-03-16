/obj/machinery/vending/medals
	name = "Medalware"
	desc = "A vendor for medals."
	product_ads = "You ever wanted to pretend to be cool?;Hey, tough guy...;Get your medal!"
	icon = 'maps/torch/icons/vending.dmi'
	icon_state = "medals"
	icon_vend = "medals-vend"
	icon_deny = "medals-deny"
	base_type = /obj/machinery/vending/medals
	req_access = list(access_bridge)//Intended for ranking crew to access.
	products = list(
	/obj/item/clothing/accessory/medal/lordan/iron/star = 12,
	/obj/item/clothing/accessory/medal/lordan/iron/sol = 12,
	/obj/item/clothing/accessory/medal/lordan/bronze/heart = 12,
	/obj/item/clothing/accessory/medal/lordan/bronze/sol = 12,
	/obj/item/clothing/accessory/medal/lordan/silver/sword = 12,
	/obj/item/clothing/accessory/medal/lordan/silver/sol = 12,
	/obj/item/clothing/accessory/medal/lordan/gold/star = 12,
	/obj/item/clothing/accessory/medal/lordan/gold/sol = 12,
	/obj/item/clothing/accessory/medal/lordan/heart = 12,
	/obj/item/clothing/accessory/medal/silver/nanotrasen = 12,
	/obj/item/clothing/accessory/medal/bronze/nanotrasen = 12,
	/obj/item/clothing/accessory/medal/iron/nanotrasen = 12
	)


	contraband = list(/obj/item/clothing/accessory/medal/lordan/gold/crest = 1,/obj/item/clothing/accessory/medal/lordan/gold/sun = 1,/obj/item/clothing/accessory/medal/gold/nanotrasen = 1)