#include "pirate_station.dm"

/obj/effect/overmap/visitable/sector/pirate_station
	name = "Infer Xiaos"
	desc = "Rough-skinned station with active internal indicators."
	icon_state = "object"
	known = FALSE

	initial_generic_waypoints = list(
	"nav_pirate_station_1",
	"nav_pirate_station_2",
	"nav_pirate_station_3",
	"nav_pirate_station_antag"
	)

/datum/map_template/ruin/away_site/pirate_station
	name = "Pirate Station"
	id = "awaysite_pirate_station"
	description = "Infer Xiaos Station."
	suffixes = list("pirate_station.dmm")
	spawn_cost = 1
	area_usage_test_exempted_root_areas = list(/area/pirate_station)

/obj/effect/shuttle_landmark/pirate_station/nav1
	name = "Infer Xiaos Hangar"
	landmark_tag = "nav_pirate_station_1"

/obj/effect/shuttle_landmark/pirate_station/nav2
	name = "Infer Xiaos #1"
	landmark_tag = "nav_pirate_station_2"

/obj/effect/shuttle_landmark/pirate_station/nav3
	name = "Infer Xiaos #2"
	landmark_tag = "nav_pirate_station_3"

/obj/effect/shuttle_landmark/pirate_station/navantag
	name = "Infer Xiaos #3"
	landmark_tag = "nav_pirate_station_antag"
