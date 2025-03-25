#if !defined(using_map_DATUM)

	// --- MAP MAINTENANCE --- //
	#include "dev_setup.dm"
	#include "dev_turfs.dm"
	#define using_map_DATUM /datum/map/dev

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring dev

#endif
