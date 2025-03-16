/obj/item/clothing/under/ftu
	name = "FTU uniform"
	desc = "Standard uniform of the Free Trade Union"
	icon = 'maps/castelnau/bos/icons/obj/clothing/ftu/under.dmi'
	item_icons = list(slot_w_uniform_str = 'maps/castelnau/bos/icons/mob/clothing/ftu/under.dmi')
	icon_state = "ftu"
	item_state = "ftu"
	worn_state = "ftu"

/obj/item/clothing/under/ftu/security
	name = "FTU security uniform"
	desc = "Standard uniform of the Free Trade Union security personnel. It has rigged armor plate. This one looks like a medium one."
	icon_state = "sec"
	item_state = "sec"
	worn_state = "sec"
	armor = list(
		melee = ARMOR_MELEE_KNIVES,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_PADDED)

/obj/item/clothing/under/ftu/trd
	name = "FTU merchant uniform"
	desc = "Standard merchant uniform of the Free Trade Union"
	icon_state = "trd"
	item_state = "trd"
	worn_state = "trd"