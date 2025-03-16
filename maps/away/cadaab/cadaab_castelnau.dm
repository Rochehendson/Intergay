#include "cadaab_areas.dm"
#include "cadaab_castelnau_shuttles.dm"
#include "cadaab_jobs.dm"
#include "cadaab_noise.dm"
#include "cadaab_objects.dm"
#include "cadaab_setup.dm"
#include "cadaab_shahti.dm"
#include "cadaab_text.dm"
#include "cadaab_turfs.dm"
#include "castelnau_areas.dm"

//Include cadaab.dm instead if you don't want planetside Castelnau

/datum/map_template/ruin/away_site/cadaab
	name = "Cadaab"
	id = "awaysite_cadaab"
	description = "The hot desert moon of Inax. There are six ship signatures on this moon."
//	suffixes = list("cadaab/castelnau-1-cadaab.dmm", "cadaab/castelnau-2-cadaab.dmm", "cadaab/castelnau-3-cadaab.dmm")
	template_flags = TEMPLATE_FLAG_SPAWN_GUARANTEED
	area_usage_test_exempted_root_areas = list(/area/cadaab, /area/castelnau)
	apc_test_exempt_areas = list(
		/area/cadaab/outpost = NO_SCRUBBER|NO_VENT,
		/area/cadaab/desert = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/cadaab/caves = NO_SCRUBBER|NO_VENT
	)