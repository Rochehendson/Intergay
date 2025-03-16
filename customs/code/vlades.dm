/obj/item/clothing/suit/storage/hooded/duster
	name = "duster"
	desc = "A sturdy duster."
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	item_icons = list(slot_wear_suit_str = 'customs/icons/mob/custom_items_mob.dmi')
	icon_state = "duster"
	item_state = "duster"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	armor = list(
		bio = ARMOR_BIO_MINOR
		)
	action_button_name = "Toggle Hood"
	hoodtype = /obj/item/clothing/head/dusthood
	siemens_coefficient = 0.6

/obj/item/clothing/head/dusthood
	name = "duster hood"
	icon_state = "dusterhood"
	item_state = "dusterhood"
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	item_icons = list(slot_head_str = 'customs/icons/mob/custom_items_mob.dmi')
	desc = "I hate sand."
	armor = list(
		bio = ARMOR_BIO_MINOR,
		)
	flags_inv = HIDEEARS|BLOCKHAIR
	item_flags = ITEM_FLAG_THICKMATERIAL
	body_parts_covered = HEAD
	siemens_coefficient = 0.9

/obj/item/clothing/mask/gas/budget/dustmask
	name = "respirator with googles"
	desc = "A face-covering cheepy mask that can be connected to an air supply. This one is combined with safety glasses."
	icon_state = "dustermask"
	item_state = "dustermask"
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	item_icons = list(slot_wear_mask_str = 'customs/icons/mob/custom_items_mob.dmi')
	body_parts_covered = FACE|EYES
	armor = list(
		melee = ARMOR_MELEE_MINOR,
		bio = ARMOR_BIO_SMALL
		)
