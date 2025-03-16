// Officer swords are spilt into two now, Marine and Fleet.

/obj/item/material/sword/officersword
	name = "fleet pattern sword"
	desc = "A polished sword issued to Fleet officers and NCOs alike. Surprisngly robust and deadly. Considering its former roots as a ship to ship weapon, before the rise of Frangible ammuniton and Laser weaponry."
	icon_state = "fleet_sword"
	item_state = "officersword"
	max_force = 20
	base_parry_chance = 20
	w_class = ITEM_SIZE_HUGE
	applies_material_colour = FALSE

/obj/item/material/sword/officersword/marine
	name = "marine pattern sword"
	desc = "A polished sword issued to Marine NCOs and Officers alike. Surprisingly robust. Considering it used to be used on ship to ship combat, before the rise of Frangible ammunition and Laser weaponry."
	icon_state = "marine_sword"

// And their sheath.

/obj/item/storage/belt/holster/sheath
	name = "sword sheath"
	desc = "A sword sheath, it can hold pattern swords."
	icon_state = "sword_sheath"
	item_state = "sword_sheath"
	storage_slots = 1
	w_class = 6
	max_w_class = 6
	max_storage_space = 16 // Swords are bulky, needs this to not erorr.
	slot_flags = SLOT_BELT|SLOT_BACK
	sound_in = 'sound/effects/holster/sheathin.ogg'
	sound_out = 'sound/effects/holster/blade_unsheath.ogg'
	can_holster = list(/obj/item/material/sword/officersword)

/obj/item/storage/belt/holster/sheath/fleet/New()
	..()
	new /obj/item/material/sword/officersword(src)
	update_icon()

/obj/item/storage/belt/holster/sheath/marine/New()
	..()
	new /obj/item/material/sword/officersword/marine(src)
	update_icon()