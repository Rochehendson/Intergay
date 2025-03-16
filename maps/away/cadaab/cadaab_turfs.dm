/turf/simulated/floor/exoplanet/cadaab
	name = "stone"
	desc = "Guess you could call it a RED STONE."
	icon = 'maps/away/cadaab/icons/turfs.dmi'
	icon_state = "stone0"
	color = null
	diggable = 0

/turf/simulated/floor/exoplanet/cadaab/Initialize()
	.=..()
	icon_state = "stone[rand(0,1)]"

/turf/simulated/floor/exoplanet/cadaab/road
	name = "scorched sand" // I don't know what the fuck it's called
	desc = "Guess you could call it a RED STONE."
	icon = 'maps/away/cadaab/icons/turfs.dmi'
	icon_state = "road"
	diggable = 0

/turf/simulated/floor/exoplanet/cadaab/road/Initialize()
	.=..()
	icon_state = "road"

/turf/simulated/floor/exoplanet/cadaab/road/rock
	name = "stone road"
	icon_state = "stone_road"

/turf/simulated/floor/exoplanet/cadaab/road/rock/Initialize()
	.=..()
	icon_state = "stone_road"

/turf/simulated/floor/exoplanet/desert/cadaab
	name = "sand"
	desc = "It's coarse and gets everywhere."
	icon = 'maps/away/cadaab/icons/turfs.dmi'
	icon_state = "sand0"
	color = null
	footstep_type = /decl/footsteps/sand
	diggable = 1

/turf/simulated/floor/exoplanet/desert/cadaab/Initialize()
	.=..()
	icon_state = "sand[rand(0,6)]"
	set_light(1, 1, 5, l_color = "#FF9D8E")

/turf/simulated/floor/exoplanet/desert/attackby(obj/item/stack/W as obj, mob/user as mob)
	if(istype(W, /obj/item/stack/sandbag_empty))
		to_chat(usr, SPAN_NOTICE("You started to fill one of the bags with sand..."))
		playsound(usr.loc, 'sound/effects/bos/sandbags_filling.ogg', 80, 1)
		if(do_after(usr, rand(3, 4) SECONDS, src, DO_BAR_OVER_USER | DO_SHOW_PROGRESS | DO_USER_SAME_HAND | DO_BOTH_UNIQUE_ACT))
			to_chat(usr, SPAN_NOTICE("You have successfully filled the bag with sand."))
			W.amount -= 1
			W.update_icon()
			if(W.amount == 0)
				qdel(W)
			if(usr.put_in_any_hand_if_possible(new /obj/item/stack/sandbag_full()))
				return
			else
				new /obj/item/stack/sandbag_full(usr.loc)

/turf/simulated/mineral/cadaab
	name = "rock"
	icon = 'maps/away/cadaab/icons/turfs.dmi'
	icon_state = "rock0"
	color = null
	mined_turf = /turf/simulated/floor/exoplanet/cadaab

/turf/unsimulated/cadaab/rock
	name = "impassable rock"
	desc = "It's a particularly tough rock here."
	icon = 'maps/away/cadaab/icons/turfs.dmi'
	icon_state = "rock0"
	opacity = 1
	density = TRUE
	blocks_air = 1

/turf/unsimulated/cadaab/rock/Initialize()
	.=..()
	icon_state = "rock[rand(0,1)]"

/decl/flooring/cadaab_wood
	name = "wooden floor"
	desc = "Polished wood planks."
	icon = 'maps/away/cadaab/icons/turfs.dmi'
	icon_base = "wooden0"
	has_damage_range = 6
	damage_temperature = T0C+200
	descriptor = "planks"
	build_type = /obj/item/stack/tile/cadaab_wood
	flags = TURF_CAN_BREAK | TURF_IS_FRAGILE | TURF_REMOVE_SCREWDRIVER
	footstep_type = /decl/footsteps/wood

/turf/simulated/floor/cadaab_wood
	name = "wooden floor"
	icon = 'maps/away/cadaab/icons/turfs.dmi'
	icon_state = "wooden0"
	initial_flooring = /decl/flooring/cadaab_wood

/turf/simulated/floor/cadaab_wood/Initialize()
	.=..()
	icon_state = "wooden[rand(0,3)]"

/turf/simulated/floor/shuttle_ceiling/cadaab

/turf/simulated/floor/shuttle_ceiling/cadaab/Initialize()
	.=..()
	set_light(1, 1, 5, l_color = "#FF9D8E")

/obj/item/stack/tile/cadaab_wood
	name = "wood floor tile"
	singular_name = "wood floor tile"
	desc = "An easy to fit wooden floor tile."
	icon_state = "tile-wood"
	matter = list(MATERIAL_WOOD = 450)

/turf/simulated/floor/grass/cadaab
	footstep_type = /decl/footsteps/grass

/turf/simulated/floor/grass/cadaab/Initialize()
	.=..()
	set_light(1, 1, 5, l_color = "#FF9D8E")

/obj/structure/quicksand/cadaab
	icon = 'maps/away/cadaab/icons/quicksand.dmi'

/turf/simulated/floor/exoplanet/water/shallow/cadaab

/turf/simulated/floor/exoplanet/water/shallow/cadaab/Initialize()
	. = ..()
	set_light(1, 1, 5, l_color = "#FF9D8E")

/obj/item/lazy
	name = "Smolergo can't code staff buttons"
	desc = "What"
	icon = 'icons/bos/obj/barrier.dmi'
	icon_state = "barrier_rised"
	var/on = 0

/obj/item/lazy/Click(location, control, params)
	. = ..()
	if(on)
		on = !on

		for(var/turf/simulated/floor/exoplanet/desert/cadaab/target_turf in world)
			target_turf.set_light(1, 1, 5, l_color = "#FF9D8E")

		for(var/turf/simulated/floor/inaks/target_turf in world)
			target_turf.set_light(1, 1, 5, l_color = "#FF9D8E")

		for(var/turf/simulated/floor/grass/cadaab/target_turf in world)
			target_turf.set_light(1, 1, 5, l_color = "#FF9D8E")
	else
		on = !on

		for(var/turf/simulated/floor/exoplanet/desert/cadaab/target_turf in world)
			target_turf.set_light(0, 0, 0)

		for(var/turf/simulated/floor/inaks/target_turf in world)
			target_turf.set_light(0, 0, 0)

		for(var/turf/simulated/floor/grass/cadaab/target_turf in world)
			target_turf.set_light(0, 0, 0)

	visible_message("Niggers is coming")
