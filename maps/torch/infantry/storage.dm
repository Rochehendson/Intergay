/////////
// Infantry Kits
/////////

/obj/item/gunbox/sidearm/infantry
	name = "Sidearm Kit"
	desc = "A secure box containing a primary."

/obj/item/gunbox/sidearm/infantry/attack_self(mob/living/user)
	var/list/options = list()
//	options["Energy - NTSec Revolver"] = list(/obj/item/gun/energy/revolver/secure/inf)
	options["Ballistic - HPI P20"] = list(/obj/item/gun/projectile/pistol/military)
	options["Ballistic - MA Blacklist"] = list(/obj/item/gun/projectile/revolver/medium)
	var/choice = input(user,"What type of equipment?") as null|anything in options
	if(src && choice)
		var/list/things_to_spawn = options[choice]
		for(var/new_type in things_to_spawn)
			var/atom/movable/AM = new new_type(get_turf(src))
			if(istype(AM, /obj/item/gun/))
				to_chat(user, "You have chosen \the [AM].")
		qdel(src)



/obj/item/gunbox/infantry
	name = "Standard Kit"
	desc = "A secure box containing a primary."

/obj/item/gunbox/infantry/attack_self(mob/living/user)
	var/list/options = list()
	options["Ballistic - Z9"] = list(/obj/item/gun/projectile/automatic/bullpup_rifle/sec/loaded,/obj/item/ammo_magazine/mil_rifle/sec,/obj/item/grenade/frag/shell,/obj/item/grenade/frag/shell,/obj/item/grenade/frag/shell)
	options["Energy - G40B"] = list(/obj/item/gun/energy/laser/infantry,/obj/item/grenade/smokebomb,/obj/item/grenade/smokebomb,/obj/item/grenade/frag)
	var/choice = input(user,"What type of equipment?") as null|anything in options
	if(src && choice)
		var/list/things_to_spawn = options[choice]
		for(var/new_type in things_to_spawn)
			var/atom/movable/AM = new new_type(get_turf(src))
			if(istype(AM, /obj/item/gun/))
				to_chat(user, "You have chosen \the [AM].")
		qdel(src)

/obj/item/gunbox/infcom
	name = "Squad Leader Kit"
	desc = "A secure box containing a primary."

/obj/item/gunbox/infcom/attack_self(mob/living/user)
	var/list/options = list()
	options["Ballistic - GS-95"] = list(/obj/item/gun/projectile/shotgun/sabotgun,/obj/item/grenade/smokebomb,/obj/item/grenade/smokebomb,/obj/item/grenade/frag)
	options["Ballistic - Z9"] = list(/obj/item/gun/projectile/automatic/bullpup_rifle/sec,/obj/item/grenade/smokebomb,/obj/item/grenade/smokebomb,/obj/item/grenade/frag)
	options["Ballistic - C-20b"] = list(/obj/item/gun/projectile/automatic/merc_smg/sec,/obj/item/grenade/smokebomb,/obj/item/grenade/smokebomb,/obj/item/grenade/frag)
	options["Energy - G40C"] = list(/obj/item/gun/energy/laser/infantry/sl,/obj/item/grenade/smokebomb,/obj/item/grenade/smokebomb,/obj/item/grenade/frag)
	var/choice = input(user,"What type of equipment?") as null|anything in options
	if(src && choice)
		var/list/things_to_spawn = options[choice]
		for(var/new_type in things_to_spawn)
			var/atom/movable/AM = new new_type(get_turf(src))
			if(istype(AM, /obj/item/gun/))
				to_chat(user, "You have chosen \the [AM].")
		qdel(src)

/obj/item/gunbox/inftech
	name = "Technician Kit"
	desc = "A secure box containing a primary."

/obj/item/gunbox/inftech/attack_self(mob/living/user)
	var/list/options = list()
	options["Ballistic|Explosive - Z-6 Automatic Rifle|L-19 Disposable Launcher"] = list(/obj/item/gun/projectile/automatic/bullpup_rifle/sec/lmg, /obj/item/gun/projectile/rocket/oneuse,/obj/item/grenade/smokebomb,/obj/item/grenade/smokebomb,/obj/item/grenade/frag)
	options["Explosive - TVP-3, Recoilless Rifle"] = list(/obj/item/gun/projectile/rocket/recoilless/sec,/obj/item/grenade/smokebomb,/obj/item/grenade/smokebomb,/obj/item/grenade/frag)
	options["Ballistic - Z2, Light Machinegun"] = list(/obj/item/gun/projectile/automatic/l6_saw/sec,/obj/item/ammo_magazine/box/machinegun,/obj/item/ammo_magazine/box/machinegun)
	options["Energy - G40B"] = list(/obj/item/gun/energy/laser/infantry,/obj/item/grenade/smokebomb,/obj/item/grenade/smokebomb,/obj/item/grenade/frag)
	var/choice = input(user,"What type of equipment?") as null|anything in options
	if(src && choice)
		var/list/things_to_spawn = options[choice]
		for(var/new_type in things_to_spawn)
			var/atom/movable/AM = new new_type(get_turf(src))
			if(istype(AM, /obj/item/gun/))
				to_chat(user, "You have chosen \the [AM].")
		qdel(src)

/obj/item/gunbox/infmed
	name = "Combat Medic Kit"
	desc = "A secure box containing a primary."

/obj/item/gunbox/infmed/attack_self(mob/living/user)
	var/list/options = list()
	options["Ballistic - C-20b"] = list(/obj/item/gun/projectile/automatic/merc_smg/sec,/obj/item/grenade/smokebomb,/obj/item/grenade/smokebomb,/obj/item/grenade/frag)
	options["Ballistic - Z9"] = list(/obj/item/gun/projectile/automatic/bullpup_rifle/sec/loaded,/obj/item/grenade/smokebomb,/obj/item/grenade/smokebomb,/obj/item/grenade/frag)
	var/choice = input(user,"What type of equipment?") as null|anything in options
	if(src && choice)
		var/list/things_to_spawn = options[choice]
		for(var/new_type in things_to_spawn)
			var/atom/movable/AM = new new_type(get_turf(src))
			if(istype(AM, /obj/item/gun/))
				to_chat(user, "You have chosen \the [AM].")
		qdel(src)

/////////
// Suits
/////////
/obj/machinery/suit_cycler/infantry
	name = "Infantry suit cycler"
	model_text = "Marines"
	req_access = list(access_marines)
	available_modifications = list(/decl/item_modifier/space_suit/hazard, /decl/item_modifier/space_suit/engineering/alt, /decl/item_modifier/space_suit/security/alt, /decl/item_modifier/space_suit/security)
