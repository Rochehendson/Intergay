/obj/machinery/computer/ship/disperser/proc/fire(mob/user)
	log_and_message_admins("attempted to launch a disperser beam.")
	if(!link_parts())
		return FALSE //no disperser, no service
	if(!front.powered() || !middle.powered() || !back.powered())
		return FALSE //no power, no boom boom
	var/chargetype = get_charge_type()
	if(chargetype <= 0)
		return FALSE //no dear, you cannot fire the captain out of a cannon... unless  you put him in a box of course

	var/atom/movable/atomcharge = get_charge()

	var/turf/start = front
	var/direction = front.dir

	var/distance = 0
	for(var/turf/T in getline(get_step(front,front.dir),get_target_turf(start, direction)))
		distance++
		if(T.density)
			if(distance < 7)
				explosion(T,1,2,3)
				continue
			else
				T.ex_act(1)
		for(var/atom/A in T)
			if(A.density)
				if(distance < 7)
					explosion(A,1,2,3)
					break
				else
					A.ex_act(1)

	var/list/relevant_z = GetConnectedZlevels(start.z)
	for(var/mob/M in GLOB.player_list)
		var/turf/T = get_turf(M)
		if(!T || !(T.z in relevant_z))
			continue
		shake_camera(M, 25)
		if(!isdeaf(M))
			sound_to(M, sound('sound/machines/disperser_far.ogg', volume=40))

	if(front) //Meanwhile front might have exploded
		front.layer = ABOVE_OBJ_LAYER //So the beam goes below us. Looks a lot better
	playsound(start, 'sound/machines/disperser_fire.ogg', 100, 1)
	handle_beam(start, direction)
	handle_overbeam()
	if (chargetype != OVERMAP_WEAKNESS_DROPPOD && chargetype != OVERMAP_WEAKNESS_ODST)
		qdel(atomcharge)

	//Some moron disregarded the cooldown warning. Let's blow in their face.
	if(prob(cool_failchance()))
		explosion(middle,rand(1,2),rand(2,3),rand(3,4))

	if(chargetype == OVERMAP_WEAKNESS_ODST)
		next_shot = coolinterval * 0.1 + world.time //Cooldown reduced for odst
	else
		next_shot = coolinterval + world.time

	//Success, but we missed.
	if(prob(100 - cal_accuracy()))
		if(chargetype == OVERMAP_WEAKNESS_DROPPOD || chargetype == OVERMAP_WEAKNESS_ODST)
			atomcharge.forceMove(locate(rand(1,world.maxx),rand(1,world.maxy), GLOB.using_map.get_empty_zlevel())) //Remove it in case it's a droppod.
		return TRUE

	reset_calibration()

	var/turf/overmaptarget = get_step(linked, overmapdir)
	var/list/candidates = list()

	//Prioritize events. Thus you can hide in meteor showers in exchange for protection from the disperser.
	for(var/obj/effect/overmap/event/O in overmaptarget)
		candidates += O
	//Next we see if there are any ships around. Logically they are between us and the sector if one exists.
	if(!length(candidates))
		for(var/obj/effect/overmap/visitable/ship/S in overmaptarget)
			if(S == linked)
				continue //Why are you shooting yourself?
			candidates += S

	//No events, no ships, the last thing to check is a sector.
	if(!length(candidates))
		for(var/obj/effect/overmap/O in overmaptarget)
			if(O == linked)
				continue //Why are you shooting yourself?
			candidates += O

	//Way to waste a charge
	if(!length(candidates))
		return TRUE

	var/obj/effect/overmap/finaltarget = pick(candidates)
	log_and_message_admins("A type [chargetype] disperser beam was launched at [finaltarget].", location=finaltarget)

	//Deletion of the overmap effect and the actual event trigger. Bye bye pesky meteors.
	if(istype(finaltarget, /obj/effect/overmap/event))
		fire_at_event(finaltarget, chargetype)
		qdel(atomcharge)
	//After this point ships act basically as sectors so we stop taking care of differences
	else
		fire_at_sector(finaltarget, atomcharge, chargetype)
	return TRUE

/obj/machinery/computer/ship/disperser/proc/fire_at_event(obj/effect/overmap/event/finaltarget, chargetype)
	if(chargetype & finaltarget.weaknesses)
		var/turf/T = finaltarget.loc
		qdel(finaltarget)
		overmap_event_handler.update_hazards(T)

/obj/machinery/computer/ship/disperser/proc/fire_at_sector(obj/effect/overmap/visitable/finaltarget, obj/structure/ship_munition/disperser_charge/charge, chargetype)
	var/list/targetareas = finaltarget.get_areas()
	targetareas -= locate(/area/space)
	var/area/finalarea = pick(targetareas)
	var/turf/targetturf = pick_area_turf(finalarea.type, list(/proc/is_not_space_turf))

	log_and_message_admins("Disperser beam hit sector at [get_area(targetturf)].", location=targetturf)
	if(chargetype == OVERMAP_WEAKNESS_DROPPOD)
		if(targetturf.density)
			targetturf.ex_act(1)
		for(var/atom/A in targetturf)
			A.ex_act(3)
		charge.forceMove(targetturf)
		//The disperser is not a taxi
		for(var/mob/living/L in charge)
			to_chat(L, SPAN_DANGER("Your body shakes violently, immense and agonising forces tearing it apart."))
			L.forceMove(targetturf)
			L.ex_act(1)

	if(chargetype == OVERMAP_WEAKNESS_ODST)
		if(targetturf.density)
			targetturf.ex_act(1)
		for(var/atom/A in targetturf)
			A.ex_act(3)
		//BoS start. Add some effects, make hole in roof if droppod fall in house
		var/turf/above_turf = GetAbove(targetturf)
		while(above_turf)
			explosion(above_turf, 1, 1, 2)
			above_turf = GetAbove(above_turf)
		explosion(targetturf, 0, 0, 3)
		var/datum/effect/effect/system/smoke_spread/smoke = new /datum/effect/effect/system/smoke_spread()
		smoke.set_up(7, 0, targetturf)
		smoke.start()
		//BoS end
		charge.forceMove(targetturf)
		//The disperser is infact a taxi
		for(var/mob/living/L in charge)
			to_chat(L, SPAN_DANGER("Your body shakes violently as the drop pod reaches it's destination."))
	else
		charge.fire(targetturf, strength, range)
		qdel(charge)

/obj/machinery/computer/ship/disperser/proc/handle_beam(turf/start, direction)
	set waitfor = FALSE
	start.Beam(get_target_turf(start, direction), "disperser_beam", time = 50, maxdistance = world.maxx)
	if(front)
		front.layer = initial(front.layer)

/obj/machinery/computer/ship/disperser/proc/handle_overbeam()
	set waitfor = FALSE
	linked.Beam(get_step(linked, overmapdir), "disperser_beam", time = 150, maxdistance = world.maxx)

/obj/machinery/computer/ship/disperser/proc/get_target_turf(turf/start, direction)
	switch(direction)
		if(NORTH)
			return locate(start.x,world.maxy,start.z)
		if(SOUTH)
			return locate(start.x,1,start.z)
		if(WEST)
			return locate(1,start.y,start.z)
		if(EAST)
			return locate(world.maxx,start.y,start.z)
