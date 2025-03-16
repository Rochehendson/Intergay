/obj/effect/overmap/visitable/ship/landable/landing_shuttle/land
	name = "Land-042"
	desc = "Small shuttle with Ellipse Fleet markings."
	shuttle = "Land-042"

/datum/shuttle/autodock/overmap/landing_shuttle/land
	name = "Land-042"
	shuttle_area = list(/area/ellipse/shuttle)
	dock_target = "land_shuttle"
	current_location = "nav_dock_land"
	landmark_transition = "nav_transit_land"
	logging_home_tag = "nav_dock_land"
	logging_access = access_ellipse
	defer_initialisation = TRUE
	multiz = 1
	flags = SHUTTLE_FLAGS_PROCESS

/obj/machinery/computer/shuttle_control/explore/land
	name = "Land-042 control console"
	shuttle_tag = "Land-042"
	req_access = list(access_ellipse)

/obj/effect/shuttle_landmark/land
	name = "Land-042"
	landmark_tag = "nav_dock_land"
	base_area = /area/ellipse/shuttle
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/effect/shuttle_landmark/transit/land
	name = "In transit"
	landmark_tag = "nav_transit_land"