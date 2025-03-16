/obj/item/clothing/head/helmet/space/void/castraid
	name = "raid unit helmet"
	desc = "A comfortable voidsuit helmet with cranial armor and eight-channel surround sound."
	icon = 'maps/castelnau/bos/icons/obj/clothing/spacesuit.dmi'
	item_icons = list(slot_head_str = 'maps/castelnau/bos/icons/mob/clothing/spacesuit.dmi')
	icon_state = "raiderhelm"
	item_state = "raiderhelm"
	item_state_slots = list(
		slot_l_hand_str = "sec_helm",
		slot_r_hand_str = "sec_helm",
		)
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
		)

/obj/item/clothing/head/helmet/space/void/castraid/leader
	name = "raid unit captain helmet"
	desc = "A comfortable voidsuit helmet with cranial armor and eight-channel surround sound."
	icon_state = "raiderleadhelm"
	item_state = "raiderleadhelm"
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_MAJOR,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
		)

/obj/item/clothing/suit/space/void/castraid
	name = "raid unit voidsuit"
	desc = "A somewhat clumsy voidsuit layered with impact and laser-resistant armor plating. Specially designed to dissipate minor electrical charges."
	icon = 'maps/castelnau/bos/icons/obj/clothing/spacesuit.dmi'
	icon_state = "raider"
	item_state = "raider"
	item_icons = list(slot_wear_suit_str = 'maps/castelnau/bos/icons/mob/clothing/spacesuit.dmi')
	item_state_slots = list(
		slot_l_hand_str = "sec_voidsuit",
		slot_r_hand_str = "sec_voidsuit",
	)
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
		)
/obj/machinery/suit_storage_unit/castraid
	name = "Raiders Storage Unit"
	suit= /obj/item/clothing/suit/space/void/castraid
	helmet = /obj/item/clothing/head/helmet/space/void/castraid
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen
	mask = /obj/item/clothing/mask/breath
	req_access = list(access_castelnau_perseus_helm)
	islocked = 1

/obj/machinery/suit_storage_unit/castraid/lead
	name = "Raiders Captain Storage Unit"
	suit= /obj/item/clothing/suit/space/void/castraid
	helmet = /obj/item/clothing/head/helmet/space/void/castraid/leader
	req_access = list(access_castelnau_perseus_helm, access_castelnau_bridge)
	islocked = 1