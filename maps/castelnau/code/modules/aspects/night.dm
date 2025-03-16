/datum/round_aspect/night
	name = "Ночь"
	chance = 15
	weight = ASPECT_WEIGHT_CONTRABAND
	announce_text = "<span class=\"info\">Испепеляющая звезда зашла за горизонт. Тьма воцарилась на этой части планеты.</span>"

/datum/round_aspect/night/get_desc_msg()
	return SPAN_WARNING("В темноте мелькают не ясные силуэты...")

/datum/round_aspect/night/do_preload_thing()
	. = ..()
	for(var/turf/simulated/floor/exoplanet/desert/cadaab/target_turf in world)
		target_turf.set_light(0, 0, 0)

	for(var/turf/simulated/floor/inaks/target_turf in world)
		target_turf.set_light(0, 0, 0)

	for(var/turf/simulated/floor/grass/cadaab/target_turf in world)
		target_turf.set_light(0, 0, 0)
