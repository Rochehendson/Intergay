/obj/item/gun/projectile/shotgun/pump/exploration
	name = "ballistic launcher"
	desc = "As the user's handbook will tell you, the Xynergy XP-3 is /not/ a shotgun, it just launches payloads of same caliber at high speed towards targets. Nicknamed 'Boomstick' for the way it behaves when full-power ammunition is loaded."
	icon = 'maps/torch/icons/obj/explshotgun.dmi'
	icon_state = "expshotgun0"
	starts_loaded = 0
	req_access = list(access_hop)
	authorized_modes = list(UNAUTHORIZED)
	init_firemodes = list(
		list(mode_name="fire"),
		)
	var/explosion_chance = 50
	var/obj/item/pipe/reinforced

/obj/item/gun/projectile/shotgun/pump/get_mechanics_info()
	. = ..()
	. += "<br>This gun will be allowed to fire freely once off-ship, otherwise needs to be authorized by XO. \
	<br>While you can load this gun with lethal ammo, there's a considerable risk of explosion when fired."

/obj/item/gun/projectile/shotgun/pump/exploration/get_antag_info()
	. = ..()
	. += "<br>You can reinforce the barrel with a simple pipe, lowering chance of explosion to 1 in 10.<br>"

/obj/item/gun/projectile/shotgun/pump/exploration/on_update_icon()
	..()
	if(!reinforced)
		icon_state = "expshotgun[!!chambered]"
	else
		icon_state = "ghettexpshotgun[!!chambered]"

/obj/item/gun/projectile/shotgun/pump/exploration/Destroy()
	QDEL_NULL(reinforced)
	. = ..()

/obj/item/gun/projectile/shotgun/pump/exploration/free_fire()
	var/my_z = get_z(src)
	if(!GLOB.using_map.station_levels.Find(my_z))
		return TRUE
	return ..()

/obj/item/gun/projectile/shotgun/pump/exploration/attackby(obj/item/I, mob/user)
	if(!reinforced && istype(I, /obj/item/pipe) && user.unEquip(I, src))
		reinforced = I
		to_chat(user, SPAN_WARNING("You reinforce \the [src] with \the [reinforced]."))
		playsound(src, 'sound/effects/tape.ogg',25)
		explosion_chance = 10
		bulk = bulk + 4
		update_icon()
		return 1
	if(reinforced && I.IsWirecutter())
		to_chat(user, SPAN_WARNING("You remove \the [reinforced] that was reinforcing \the [src]."))
		playsound(src.loc, 'sound/items/Wirecutter.ogg', 25, 1)
		reinforced.dropInto(loc)
		reinforced = null
		explosion_chance = initial(explosion_chance)
		bulk = initial(bulk)
		update_icon()
		return 1
	return ..()

/obj/item/gun/projectile/shotgun/pump/exploration/special_check()
	if(chambered && chambered.BB && prob(explosion_chance))
		var/damage = chambered.BB.get_structure_damage()
		if(istype(chambered.BB, /obj/item/projectile/bullet/pellet))
			var/obj/item/projectile/bullet/pellet/PP = chambered.BB
			damage = PP.damage*PP.pellets
		if(damage > 30)
			var/mob/living/carbon/C = loc
			if(istype(loc))
				C.visible_message("<span class='danger'>[src] explodes in [C]'s hands!</span>", "<span class='danger'>[src] explodes in your face!</span>")
				C.drop_from_inventory(src)
				if(reinforced)
					reinforced.dropInto(loc)
					reinforced.throw_at(C, 2, 10)
					reinforced = null
				for(var/zone in list(BP_L_HAND, BP_R_HAND, BP_HEAD))
					C.apply_damage(rand(10,20), def_zone=zone)
			else
				visible_message("<span class='danger'>[src] explodes!</span>")
			explosion(get_turf(src), -1, -1, 1)
			qdel(src)
			return FALSE
	return ..()

/obj/item/storage/box/ammo/explo_shells
	name = "box of utility shells"
	startswith = list(/obj/item/ammo_magazine/shotholder/beanbag = 1,
					  /obj/item/ammo_magazine/shotholder = 1,
					  /obj/item/ammo_magazine/shotholder/flash = 1)

/obj/structure/closet/secure_closet/explo_gun
	name = "gun locker"
	desc = "Wall locker holding the boomstick and two locked rifles."
	req_access = list(access_expedition_shuttle_helm)
	closet_appearance = /decl/closet_appearance/wall/explo_gun
	density = 0
	anchored = 1
	wall_mounted = 1
	storage_types = CLOSET_STORAGE_ITEMS

/obj/structure/closet/secure_closet/explo_gun/WillContain()
	return list(
		/obj/item/storage/box/ammo/explo_shells = 3,
		/obj/item/gun/projectile/shotgun/pump/exploration,
		/obj/item/gun/energy/laser/exploration = 2
	)

/decl/closet_appearance/wall/explo_gun
	color = COLOR_GRAY20
	decals = null
	can_lock = 1
	extra_decals = list(
		"stripe_outer" = COLOR_PURPLE
	)

//pathfinder
/obj/structure/closet/secure_closet/explo_gun/pf
	desc = "Wall locker holding the Pathfinder's survival sidearm."
	closet_appearance = /decl/closet_appearance/wall/explo_gun/pf
	req_access = list(access_pathfinder)

/obj/structure/closet/secure_closet/explo_gun/pf/WillContain()
	return list(
		/obj/item/gun/projectile/pistol/sec/pf = 1,
		/obj/item/ammo_magazine/pistol/double/pepperball = 1
	)

/decl/closet_appearance/wall/explo_gun/pf
	extra_decals = list(
		"stripe_outer" = COLOR_RED,
		"stripe_inner" = COLOR_PURPLE
	)
