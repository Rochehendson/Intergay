#if !defined(using_map_DATUM)
	#include "cricket_areas.dm"
	#include "cricket_shuttles.dm"
	#include "cricket_unit_testing.dm"

	#include "cricket-1.dmm"
	#include "cricket-2.dmm"
	#include "cricket-3.dmm"

	#define using_map_DATUM /datum/map/cricket

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring cricket

#endif
