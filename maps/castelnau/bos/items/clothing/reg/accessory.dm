/obj/item/clothing/accessory/armband/reg
	name = "regulator armband"
	desc = "An armband, worn by the crew to display which department they're assigned to. This one is blue."
	icon = 'maps/castelnau/bos/icons/obj/clothing/reg/accessory.dmi'
	accessory_icons = list(slot_w_uniform_str = 'maps/castelnau/bos/icons/mob/clothing/reg/accessory.dmi', slot_wear_suit_str = 'maps/castelnau/bos/icons/mob/clothing/reg/accessory.dmi')
	accessory_flags = ACCESSORY_REMOVABLE | ACCESSORY_HIGH_VISIBILITY
	icon_state = "command"

/obj/item/clothing/accessory/armband/reg/sec
	name = "security armband"
	desc = "An armband, worn by the crew to display which department they're assigned to. This one is red."
	icon_state = "sec"

/obj/item/clothing/accessory/armband/reg/med
	name = "medic armband"
	desc = "An armband, worn by the crew to display which department they're assigned to. This one is white."
	icon_state = "med"

/obj/item/clothing/accessory/armband/reg/eng
	name = "engineer armband"
	desc = "An armband, worn by the crew to display which department they're assigned to. This one is orange."
	icon_state = "eng"