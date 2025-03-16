/*******************
castelnau specific items
*******************/

/obj/item/modular_computer/pda/heads/hop
	stored_pen = /obj/item/pen/multi/cmd/hop

/obj/item/modular_computer/pda/captain
	stored_pen = /obj/item/pen/multi/cmd/captain

/***********
Unique items
***********/

/obj/item/pen/multi/cmd/hop
	name = "head of personnel's pen"
	icon = 'maps/castelnau/icons/obj/uniques.dmi'
	icon_state = "pen_xo"
	desc = "A slightly bulky pen with a silvery case. Twisting the top allows you to switch the nib for different colors."

/obj/item/pen/multi/cmd/captain
	name = "captain's pen"
	icon = 'maps/castelnau/icons/obj/uniques.dmi'
	icon_state = "pen_co"
	desc = "A slightly bulky pen with a golden case. Twisting the top allows you to switch the nib for different colors."

/obj/item/pen/multi/cmd/attack_self(mob/user)
	if(++selectedColor > 3)
		selectedColor = 1
	colour = colors[selectedColor]
	to_chat(user, "<span class='notice'>Changed color to '[colour].'</span>")

/******
Weapons
******/

/obj/item/gun/projectile/revolver/webley/captain
	desc = "A shiny al-Maliki & Mosley Autococker automatic revolver, with black accents. Marketed as the 'Revolver for the Modern Era'. Uses .44 magnum rounds. This one has 'To the Captain of RMV Castelnau' engraved."

/obj/item/gun/projectile/pistol/liaison
	magazine_type = /obj/item/ammo_magazine/mc9mm/oneway

/obj/item/ammo_magazine/mc9mm/oneway
	initial_ammo = 1

/*****
OTHER
****/

/obj/item/device/boombox/anchored //for bar's private rooms
	name = "stationary boombox"
	anchored = 1

/obj/item/device/boombox/anchored/attack_hand(var/mob/user)
	interact(user)

/obj/item/disk/survey
	w_class = ITEM_SIZE_TINY

/obj/item/tape/police
	req_access = list(access_castelnau_security)

/obj/item/tape/engineering
	req_access = list(access_castelnau_engineering)

/obj/item/tape/atmos
	req_access = list(access_castelnau_atmospherics)

/obj/item/tape/research

/obj/item/tape/medical
	req_access = list(access_castelnau_medical)

/obj/item/rig/eva
	req_access = list(access_castelnau_engineering)