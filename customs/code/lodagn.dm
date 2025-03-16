//kakoi-to bdsm nabor ebaniy

/obj/item/clothing/gloves/latex/lodagn
	name = "latex gloves"
	desc = "Cheap sterile gloves made from latex. On them you can see strange spots of white mucus." //what the fuck
	icon_state = "lodagn" //4 some reason oni ne rabotayut v ikonkah kastomok
	item_state = "lodagn"

/obj/item/clothing/shoes/dutyboots/lodagn
	name = "high heels"
	desc = "A fancy pair of high heels. Won't compensate for your below average height that much."
	item_icons = list(slot_shoes_str = 'customs/icons/mob/custom_items_mob.dmi')
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	icon_state = "heels"

/obj/item/clothing/glasses/hud/security/lodagn
	name = "red glasses"
	desc = "Red glasses. It is possible that the lenses shimmer very quickly."
	icon_state = "ochki"
	off_state = "ochki"
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	item_icons = list(slot_glasses_str = 'customs/icons/mob/custom_items_mob.dmi')
	flash_protection = FLASH_PROTECTION_MODERATE

/obj/item/melee/lodagn //literally toolbox, but sharp
	name = "bastard sword"
	desc = "A sword capable of standing one-handed and two-handed grips. The handle is upholstered in fabric that is covered in a transparent goo that smells like Skrells..." //chto s toboy ne tak
	slot_flags = SLOT_BACK
	force = 20
	attack_cooldown = 15
	throwforce = 10
	throw_speed = 1
	throw_range = 7
	base_parry_chance = 50
	sharp = TRUE
	edge = TRUE
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	origin_tech = list(TECH_COMBAT = 2)
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	icon_state = "bastard"
	item_icons = list(
		slot_l_hand_str = 'customs/icons/mob/custom_items_lhand.dmi',
		slot_r_hand_str = 'customs/icons/mob/custom_items_rhand.dmi',
		slot_back_str = 'customs/icons/mob/custom_items_mob.dmi'
		)
/*
/obj/item/paper/lodagn
	name = "note"
	language = LANGUAGE_SKRELLIAN
	info = {"
Привет!<br>
Старайся иметь хоть какое-то уважение к другим, если не любишь лишаться своих вещей как "контрабанды".<br>
С любовью, <i>Твоя Лучшая Подруга</i><br>
<center><img src = xri.png></center><br>
	"}
*/