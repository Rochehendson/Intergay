/obj/item/clothing/head/helmet/tachanka
	name = "combat helmet"
	desc = "A heavily reinforced helmet. Feels like it could take a lot of punishment."
	icon = 'icons/bos/obj/clothing/obj_head.dmi'
	icon_state = "tachanka"
	item_icons = list(slot_head_str = 'icons/bos/mob/onmob/onmob_head.dmi')
	item_state = "tachanka"
	valid_accessory_slots = null
	body_parts_covered = HEAD|FACE
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED
		)
	siemens_coefficient = 0.7

/obj/item/clothing/suit/armor/tachanka
	name = "combat vest"
	desc = "An armored vest with heavy plates to protect against ballistic projectiles."
	icon = 'icons/bos/obj/clothing/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/bos/mob/onmob/onmob_suit.dmi')
	icon_state = "tachanka"
	item_state = "tachanka"
	valid_accessory_slots = null
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_AP,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_PADDED
		)
	flags_inv = CLOTHING_BULKY
	slowdown_general = 1
	siemens_coefficient = 0.7
	accessories = list(/obj/item/clothing/accessory/arm_guards/riot, /obj/item/clothing/accessory/leg_guards/riot)
