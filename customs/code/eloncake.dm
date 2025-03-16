/*/obj/item/clothing/suit/storage/toggle/eloncake
	name = "vintage army greatcoat"
	desc = "A greatcoat in a very old style. It was probably stolen from the history museum."
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMBAND,ACCESSORY_SLOT_MEDAL,ACCESSORY_SLOT_INSIGNIA,ACCESSORY_SLOT_RANK,ACCESSORY_SLOT_DEPT)
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	icon_state = "vintagecoat"
	item_icons = list(slot_wear_suit_str = 'customs/icons/mob/custom_items_mob.dmi')
	accessories = list(/obj/item/clothing/accessory/solgov/rank/eloncake)

/obj/item/clothing/accessory/solgov/rank/eloncake
	name = "ranks (Group Captain)"
	desc = "A replica of insignia denoting the rank of Royal Air Force Group Captain, whatever that is."
	on_rolled = list("down" = "none")
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	w_class = ITEM_SIZE_TINY
	accessory_icons = list(slot_w_uniform_str = 'customs/icons/mob/custom_items_mob.dmi', slot_wear_suit_str = 'customs/icons/mob/custom_items_mob.dmi')
	icon_state = "britishranks"

/obj/item/clothing/suit/storage/toggle/eloncake
	name = "vintage army greatcoat"
	desc = "A greatcoat in a very old style. It was probably stolen from the history museum."
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMBAND,ACCESSORY_SLOT_MEDAL,ACCESSORY_SLOT_INSIGNIA,ACCESSORY_SLOT_RANK,ACCESSORY_SLOT_DEPT)
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	icon_state = "vintagecoat"
	item_icons = list(slot_wear_suit_str = 'customs/icons/mob/custom_items_mob.dmi')
	accessories = list(/obj/item/clothing/accessory/solgov/rank/eloncake)

/obj/item/clothing/under/elloncake
	name = "BHL uniform"
	desc = "Uniform of the now disbanded Bounty Hunter League."
	icon_state = "explorer"
	item_state = "explorer"
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	item_icons = list(slot_w_uniform_str = 'customs/icons/mob/custom_items_mob.dmi')

/obj/item/material/hatchet/machete/unbreakable/elloncake
	name = "NanoTrasen short sword"
	desc = "Literally an ancient artifact"
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	icon_state = "ntsword"
	item_state = "ntsword"
	item_icons = list(
		slot_l_hand_str = 'customs/icons/mob/custom_items_lhand.dmi',
		slot_r_hand_str = 'customs/icons/mob/custom_items_rhand.dmi')
*/

/obj/item/clothing/mask/gas/elloncake
	name = "skrellian gas mask"
	desc = "A face-covering mask that can be connected to an air supply. It was made in the Empire, and looks pretty new."
	icon_state = "gasmask"
	item_state = "gasmask"
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	item_icons = list(slot_wear_mask_str = 'customs/icons/mob/custom_items_mob.dmi')
	sprite_sheets = list(
		SPECIES_SKRELL =  'customs/icons/mob/custom_items_mob_xenosheets.dmi')
	siemens_coefficient = 0.7

/obj/item/clothing/head/outhood
	name = "outcast hood"
	icon_state = "outhood"
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	item_icons = list(slot_head_str = 'customs/icons/mob/custom_items_mob.dmi')
	desc = "You certainly wouldn't wear it if you were loved."
	armor = list(
		bio = ARMOR_BIO_MINOR,
		)
	flags_inv = HIDEEARS|HIDEEYES|BLOCKHAIR
	item_flags = ITEM_FLAG_THICKMATERIAL
	body_parts_covered = HEAD|FACE|EYES
	siemens_coefficient = 0.9

/obj/item/clothing/suit/storage/hooded/outcast
	name = "outcast cloak"
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	item_icons = list(slot_wear_suit_str = 'customs/icons/mob/custom_items_mob.dmi')
	desc = "You certainly wouldn't wear it if you were loved"
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMBAND,ACCESSORY_SLOT_MEDAL,ACCESSORY_SLOT_INSIGNIA,ACCESSORY_SLOT_RANK,ACCESSORY_SLOT_DEPT)
	icon_state = "outcast"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	armor = list(
		bio = ARMOR_BIO_MINOR
		)
	action_button_name = "Toggle Hood"
	hoodtype = /obj/item/clothing/head/outhood
	siemens_coefficient = 0.6

/obj/item/cane/staff
	name = "wooden staff"
	desc = "You're either crippled or a wizard."
	icon_state = "staff"
	item_state = "staff"
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	item_icons = list(
		slot_l_hand_str = 'customs/icons/mob/custom_items_lhand.dmi',
		slot_r_hand_str = 'customs/icons/mob/custom_items_rhand.dmi')