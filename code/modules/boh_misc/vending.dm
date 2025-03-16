/////////
// Sec
/////////

/obj/machinery/vending/accessory
	name = "SecTech - Accessory"
	desc = "A security accessory vendor."
//	product_ads = "Crack capitalist skulls!;Beat some heads in!;Don't forget - harm is good!;Your weapons are right here.;Handcuffs!;Freeze, scumbag!;Don't tase me bro!;Tase them, bro.;Why not have a donut?"
	icon_state = "sec"
	icon_deny = "sec-deny"
	icon_vend = "sec-vend"
	vend_delay = 14
	req_access = list(access_security)
	products = list(
		/obj/item/clothing/accessory/arm_guards = 12,
		/obj/item/clothing/accessory/arm_guards/navy = 8,
		/obj/item/clothing/accessory/arm_guards/green = 8,
		/obj/item/clothing/accessory/arm_guards/tan = 8,
		/obj/item/clothing/accessory/arm_guards/blue = 8,
		/obj/item/clothing/accessory/arm_guards/riot = 4,
		/obj/item/clothing/accessory/arm_guards/ballistic = 2,
		/obj/item/clothing/accessory/arm_guards/ablative = 2,
		/obj/item/clothing/accessory/leg_guards = 12,
		/obj/item/clothing/accessory/leg_guards/navy = 8,
		/obj/item/clothing/accessory/leg_guards/green = 8,
		/obj/item/clothing/accessory/leg_guards/tan = 8,
		/obj/item/clothing/accessory/leg_guards/blue = 8,
		/obj/item/clothing/accessory/leg_guards/riot = 4,
		/obj/item/clothing/accessory/leg_guards/ballistic = 2,
		/obj/item/clothing/accessory/leg_guards/ablative = 2,
		/obj/item/clothing/accessory/storage/holster = 8,
		/obj/item/clothing/accessory/storage/holster/armpit = 8,
		/obj/item/clothing/accessory/storage/holster/hip = 8,
		/obj/item/clothing/accessory/storage/holster/thigh = 8,
		/obj/item/clothing/accessory/storage/holster/waist = 8,
		/obj/item/clothing/accessory/storage/pouches = 12,
		/obj/item/clothing/accessory/storage/pouches/large = 4,
		/obj/item/clothing/accessory/ubac = 24,
		/obj/item/clothing/accessory/armor_plate = 8,
		/obj/item/clothing/accessory/armor_plate/medium = 6,
		/obj/item/clothing/accessory/armor_plate/tactical = 2,
		/obj/item/clothing/accessory/armor_plate/shock = 4)
	contraband = list(/obj/item/clothing/accessory/storage/bandolier = 2,/obj/item/clothing/accessory/storage/black_drop = 2)
