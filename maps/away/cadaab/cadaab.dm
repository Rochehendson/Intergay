#include "cadaab_areas.dm"
#include "cadaab_jobs.dm"
#include "cadaab_noise.dm"
#include "cadaab_objects.dm"
#include "cadaab_setup.dm"
#include "cadaab_shahti.dm"
#include "cadaab_text.dm"
#include "cadaab_turfs.dm"

//Include cadaab_castelnau.dm instead if you want planetside Castelnau

/datum/map_template/ruin/away_site/cadaab
	name = "Cadaab"
	id = "awaysite_cadaab"
	spawn_cost = 0
	description = "The hot desert moon of Inax. A recent landslide caused many roads to be blocked."
	suffixes = list("cadaab/cadaab_old.dmm")
	template_flags = TEMPLATE_FLAG_SPAWN_GUARANTEED
	shuttles_to_initialise = list(/datum/shuttle/autodock/ferry/lift)
	area_usage_test_exempted_root_areas = list(/area/cadaab)
	apc_test_exempt_areas = list(
		/area/cadaab/outpost = NO_SCRUBBER|NO_VENT,
		/area/cadaab/desert = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/cadaab/caves = NO_SCRUBBER|NO_VENT
	)