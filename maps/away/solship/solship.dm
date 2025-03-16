///WORK IN PROGRESS///
//////////////////////


#include "solship_areas.dm"
#include "solship_crew.dm"
#include "solship_items.dm"
#include "solship_ranks.dm"
#include "solship_presets.dm"
#include "solship_shuttle.dm"
//#include "solship_structures.dm"
#include "solship_uniforms.dm"

	///////////
	//OVERMAP//
	///////////

/datum/map_template/ruin/away_site/solship
	name = "LPS Diablo"
	id = "awaysite_solship"
	description = "---."
	suffixes = list("solship/solship.dmm")
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/exploration_shuttle/texas)
	spawn_cost = 1

/obj/effect/overmap/visitable/sector/solship_arrival
	name = "Incoming Vessel Report"
	desc = "Sensors indicate an increase in bluespace activity, coming from a bluespace-drive of a vessel trying to enter this sector. Estimated time until arrival vary between 20 minutes and 8 hours."
	icon_state = "event"
	hide_from_reports = TRUE

/obj/effect/overmap/visitable/ship/solship
	name = "LPS Diablo"
	desc = "Medium gunship with LSS markings."
	color = "#990000"
	fore_dir = WEST
	vessel_mass = 350
	initial_restricted_waypoints = list(
		"Tersten Red" = list("nav_hangar_texas")
	)

/obj/effect/shuttle_landmark/solship/nav_northwest
	name = "Northwest of Diablo"
	landmark_tag = "nav_solship_northwest"

/obj/effect/shuttle_landmark/solship/nav_south
	name = "South of Diablo"
	landmark_tag = "nav_solship_south"
