/////////
// Bodyguard Lockbox
/////////
/obj/item/gunbox/bodyguard
	name = "equipment kit"
	desc = "A secure box containing a sidearm."
	icon = 'icons/obj/storage.dmi'
	icon_state = "ammo" //temp

/obj/item/gunbox/bodyguard/attack_self(mob/living/user)
	var/list/options = list()
	options["Ballistic"] = list(/obj/item/gun/projectile/pistol/military/alt/solar,/obj/item/ammo_magazine/pistol/double/rubber)
//	options["Energy"] = list(/obj/item/gun/energy/gun/secure/corporate)
//	options["Energy - Stun"] = list(/obj/item/gun/energy/stunrevolver/secure/nanotrasen)
	var/choice = input(user,"What type of equipment?") as null|anything in options
	if(src && choice)
		var/list/things_to_spawn = options[choice]
		for(var/new_type in things_to_spawn)
			var/atom/movable/AM = new new_type(get_turf(src))
			if(istype(AM, /obj/item/gun/))
				to_chat(user, "You have chosen \the [AM].")
		qdel(src)