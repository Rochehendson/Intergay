/obj/item/projectile/missile/point_missile
	name = "point missile"
	icon_state = "missile"

/obj/item/projectile/missile/point_missile/on_impact(var/atom/target, var/blocked = 0)
	explosion(target, 1, 2, 2, 3)

/obj/item/projectile/missile/smoke_missile
	name = "smoke missile"
	icon_state = "84mm-hedp"

/obj/item/projectile/missile/smoke_missile/on_impact(var/atom/target, var/blocked = 0)
	explosion(target, 0, 0, 1, 0)

	var/datum/effect/effect/system/smoke_spread/smoke = new /datum/effect/effect/system/smoke_spread()
	smoke.set_up(10, 0, target)
	smoke.start()

/obj/item/projectile/missile/smoke_missile/on_hit(atom/target, blocked, def_zone)
	//We don't want smoke rocket to gib people, so... Do nothing

/obj/item/projectile/missile/shrapnel_missile
	name = "shrapnel missile"
	icon_state = "atrocket"

/obj/item/projectile/missile/shrapnel_missile/on_impact(var/atom/target, var/blocked = 0)
	var/list/target_turfs = getcircle(loc, 3)
	var/fragments_per_projectile = round(5/target_turfs.len)

	explosion(target, 0, 0, 2, 2)

	for(var/turf/O in target_turfs)
		sleep(0)
		var/fragment_type = /obj/item/projectile/bullet/pellet/fragment
		var/obj/item/projectile/bullet/pellet/fragment/P = new fragment_type(target)
		P.pellets = fragments_per_projectile
		P.shot_from = src.name
		P.hitchance_mod = 60
		P.launch(O)

/obj/item/projectile/missile/shrapnel_missile/on_hit(atom/target, blocked, def_zone)
	//Same as with smoke missile
