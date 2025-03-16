/obj/structure/fake_stairs
	name = "stairs"
	desc = "It's section of stairs."
	icon = 'icons/obj/stairs.dmi'
	anchored = 1
	density = 0

/datum/shuttle/autodock/ferry/escapeevent
	name = "Transport Shuttle"
	warmup_time = 10
	shuttle_area = /area/shuttle/escapeevent
	dock_target = "escapeevent_shuttle_fore"
	waypoint_station = "nav_escapeevent_start"
	waypoint_offsite = "nav_escapeevent_out"

/obj/effect/shuttle_landmark/escapeevent/start
	name = "Hangar"
	landmark_tag = "nav_escapeevent_start"

/obj/effect/shuttle_landmark/escapeevent/out
	name = "Space near the Earth"
	landmark_tag = "nav_escapeevent_out"