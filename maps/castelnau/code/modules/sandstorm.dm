#define CADAAB_INDOORS 3
#define CADAAB_OUTSIDE 4

/datum/sandstorm
	var/list/storm_areas = list() //Areas where sandstorm will damage peoples

/datum/sandstorm/New()
	for(var/area/cadaab/cadaab_area in world)
		if(cadaab_area.outside == TRUE)
			storm_areas += cadaab_area

/datum/sandstorm/proc/check_loc(var/mob/living/carbon/human/unlucky)
	var/checking_area = get_area(unlucky)
	if(is_type_in_list(checking_area, storm_areas))
		return CADAAB_OUTSIDE
	else if((unlucky.z << 4) && (!istype(checking_area, /area/cadaab/sputnik)))
		return CADAAB_INDOORS
	else
		return FALSE

/datum/sandstorm/proc/is_coming()
	for(var/mob/living/carbon/human/unlucky in shuffle(GLOB.living_mob_list_))
		if(check_loc(unlucky) == CADAAB_OUTSIDE)
			to_chat(unlucky, SPAN_WARNING("In the distance you see huge clouds of sand coming towards you... Less than ten minutes and they'll be here."))

	sleep(5 MINUTES)

	for(var/mob/living/carbon/human/unlucky in shuffle(GLOB.living_mob_list_))
		if(check_loc(unlucky) == CADAAB_OUTSIDE)
			to_chat(unlucky, SPAN_WARNING("Large clouds of sand, illuminated by flashes of lightning, get closer and closer to your location..."))
			sound_to(unlucky, sound('sound/effects/bos/lighting.ogg', volume = 40))
		else if(check_loc(unlucky) == CADAAB_INDOORS)
			to_chat(unlucky, SPAN_WARNING("You can hear lighting somewhere outside... Something is coming..."))
			sound_to(unlucky, sound('sound/effects/bos/lighting.ogg', volume = 30))

	sleep(5 MINUTES)

	for(var/mob/living/carbon/human/unlucky in shuffle(GLOB.living_mob_list_))
		if(check_loc(unlucky) == CADAAB_OUTSIDE)
			to_chat(unlucky, SPAN_WARNING("Many grains of sand are already reaching you. A couple of minutes more and a huge cloud of sand will cover everything around you."))

	sleep(2 MINUTES)

	for(var/mob/living/carbon/human/unlucky in shuffle(GLOB.living_mob_list_))
		if(check_loc(unlucky) == CADAAB_OUTSIDE)
			to_chat(unlucky, SPAN_WARNING("A sandstorm slowly absorbs the entire horizon, getting closer..."))

	sleep(30 SECONDS)

	for(var/mob/living/carbon/human/unlucky in shuffle(GLOB.living_mob_list_))
		if(check_loc(unlucky) == CADAAB_OUTSIDE)
			to_chat(unlucky, SPAN_WARNING("Along with the horizon, the sand swallows up the sky, bringing darkness and death."))

	sleep(15 SECONDS)

	for(var/mob/living/carbon/human/unlucky in shuffle(GLOB.living_mob_list_))
		if(check_loc(unlucky) == CADAAB_OUTSIDE)
			to_chat(unlucky, "<font size='4' color='red'><b>Another bolt of lightning flashes and the sandstorm, already blocking the entire horizon and the sun, is just a ten seconds away... Nothing seemed to be able to save from it...</b></font>")
			sound_to(unlucky, sound('sound/effects/bos/lighting.ogg', volume = 100))
			sound_to(unlucky, sound('sound/effects/bos/sandstorm_coming.ogg', volume = 100))
		else if(check_loc(unlucky) == CADAAB_INDOORS)
			to_chat(unlucky, SPAN_WARNING("You can hear lighting somewhere very close to you. Wild wind blows from every crevice..."))
			sound_to(unlucky, sound('sound/effects/bos/lighting.ogg', volume = 70))
			sound_to(unlucky, sound('sound/effects/bos/sandstorm_coming.ogg', volume = 40))

	for(var/turf/simulated/floor/exoplanet/desert/cadaab/target_turf in world) //Off light everwhere in Cadaab
		target_turf.set_light(0, 0, 0)

	for(var/turf/simulated/floor/inaks/target_turf in world)
		target_turf.set_light(0, 0, 0)

	for(var/turf/simulated/floor/shuttle_ceiling/cadaab/target_turf in world)
		target_turf.set_light(0, 0, 0)

	sleep(10 SECONDS)

	for(var/area/cadaab/areas in world)
		if(areas.outside == TRUE)
			areas.forced_ambience = list('sound/ambience/bos/super_sandstorm.ogg')
			areas.ambience = list('sound/effects/bos/lighting.ogg')
			areas.sandstorm_container = src
			for(var/turf/simulated/outside_turf in view(0, areas))
				var/image/I = image(icon='maps/away/cadaab/icons/turfs.dmi',icon_state="sandstorm")
				I.plane = DECORATIONS_PLANE
				I.layer = 10 //Above everything
				outside_turf.overlays += I
		else
			areas.forced_ambience = list('sound/ambience/bos/super_sandstorm_indoor.ogg')
			areas.ambience = list('sound/effects/bos/lighting.ogg')

	for(var/area/castelnau/areas in world)
		areas.forced_ambience = list('sound/ambience/bos/super_sandstorm_indoor.ogg')
		areas.ambience = list('sound/effects/bos/lighting.ogg')

	for(var/area/shuttle/castelnau/areas in world)
		areas.forced_ambience = list('sound/ambience/bos/super_sandstorm_indoor.ogg')
		areas.ambience = list('sound/effects/bos/lighting.ogg')

	for(var/obj/machinery/noisetv/broadcast in world)
		broadcast.endnoise()

	for(var/mob/living/carbon/human/unlucky in shuffle(GLOB.living_mob_list_))
		if(check_loc(unlucky) == CADAAB_OUTSIDE)
			to_chat(unlucky, "<font size='15' color='red'><b>It has begun.</b></font>")
			to_chat(unlucky, SPAN_DANGER("A sudden strong rush of wind knocks you down!"))
			unlucky.Weaken(Floor(2))
			sound_to(unlucky, sound('sound/ambience/bos/super_sandstorm.ogg', volume = 50, channel = GLOB.ambience_channel_forced))
			personal_hell(unlucky)
		else if(check_loc(unlucky) == CADAAB_INDOORS)
			to_chat(unlucky, "<font size='4' color='red'><b>You feel it. The storm is here.</b></font>")
			sound_to(unlucky, sound('sound/ambience/bos/super_sandstorm_indoor.ogg', volume = 30, channel = GLOB.ambience_channel_forced))

/datum/sandstorm/proc/personal_hell(var/mob/living/carbon/human/unlucky)
	unlucky.overlay_fullscreen("sand", /obj/screen/fullscreen/sandstorm)
	unlucky.overlay_fullscreen("sand2", /obj/screen/fullscreen/sandstorm/second)

	while(check_loc(unlucky) == CADAAB_OUTSIDE)
		unlucky.apply_damage(3, DAMAGE_BRUTE, pick(BP_L_LEG, BP_R_LEG, BP_L_HAND, BP_R_HAND, BP_HEAD, BP_CHEST))
		if(prob(20))
			to_chat(unlucky, SPAN_DANGER(pick("Sand particles fly into your body in large masses, causing noticeable damage.", "The wind blows so hard that you can barely stand on your feet.")))
		if(prob(5))
			to_chat(unlucky, SPAN_DANGER("A sudden strong rush of wind knocks you down!"))
			unlucky.Weaken(Floor(4))
		if(prob(5))
			playsound(unlucky, 'sound/effects/bos/lighting.ogg', 100)
		sleep(3 SECONDS)

	unlucky.clear_fullscreen("sand")
	unlucky.clear_fullscreen("sand2")

#undef CADAAB_INDOORS
#undef CADAAB_OUTSIDE

// FULLSCREENS //
//   EFFECTS   //

/obj/screen/fullscreen/sandstorm
	icon = 'icons/bos/mob/screen_full.dmi'
	icon_state = "sandstorm1"
	layer = DAMAGE_LAYER
	alpha = 0

/obj/screen/fullscreen/sandstorm/Initialize()
	. = ..()
	animate(src, alpha = rand(55, 70), time = rand(40, 60))

/obj/screen/fullscreen/sandstorm/second
	icon_state = "sandstorm2"

//     AREAS     //
// SPECIAL PROCS //

/area/cadaab/Entered(something)
	. = ..()
	if(sandstorm_container != null)
		if(istype(something, /mob/living/carbon/human))
			sandstorm_container.personal_hell(something)
		if(istype(something, /obj/effect/dummy/box))
			var/obj/effect/dummy/box/borziu = something
			borziu.attack_hand()
			qdel(borziu)
	else
		return
