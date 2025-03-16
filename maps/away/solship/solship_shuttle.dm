/obj/effect/overmap/visitable/ship/landable/exploration_shuttle/texas
	name = "Tersten Red"
	desc = "Small shuttle with LSS markings."
	shuttle = "Tersten Red"

/datum/shuttle/autodock/overmap/exploration_shuttle/texas
	name = "Tersten Red"
	range = 1
	shuttle_area = list(/area/exploration_shuttle/texas/pass, /area/exploration_shuttle/texas/med, /area/exploration_shuttle/texas/can, /area/exploration_shuttle/texas/airlock)
	dock_target = "texas_shuttle"
	current_location = "nav_hangar_texas"
	landmark_transition = "nav_transit_texas"
	logging_home_tag = "nav_hangar_texas"
	logging_access = access_away_solship_main
	defer_initialisation = TRUE
	flags = SHUTTLE_FLAGS_PROCESS

/obj/machinery/computer/shuttle_control/explore/texas
	name = "Tersten Red control console"
	shuttle_tag = "Tersten Red"
	req_access = list(access_away_solship_main)

/obj/effect/shuttle_landmark/solship/texas
	name = "Tersten Red hangar"
	landmark_tag = "nav_hangar_texas"
	base_area = /area/space
	base_turf = /turf/space

/obj/effect/shuttle_landmark/transit/texas
	name = "In transit"
	landmark_tag = "nav_transit_texas"
