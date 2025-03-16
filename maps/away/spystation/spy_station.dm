#include "spy_station_areas.dm"

/obj/effect/overmap/visitable/sector/spy_station
	name = "Delta Station"
	desc = "Delta Station."
	icon_state = "object"
	known = FALSE

	initial_generic_waypoints = list(
	"nav_spy_station_1",
	"nav_spy_station_2",
	"nav_spy_station_3",
	"nav_spy_station_antag"
	)

/datum/map_template/ruin/away_site/spy_station
	name = "Spy Station"
	id = "awaysite_spy_station"
	description = "Delta Station."
	suffixes = list("spy_station/spy_station.dmm")
	spawn_cost = 0.5
	area_usage_test_exempted_root_areas = list(/area/spy_station)

/obj/effect/shuttle_landmark/spy_station/nav1
	name = "Spy Station #1"
	landmark_tag = "nav_spy_station_1"

/obj/effect/shuttle_landmark/spy_station/nav2
	name = "Spy Station #2"
	landmark_tag = "nav_spy_station_2"

/obj/effect/shuttle_landmark/spy_station/nav3
	name = "Spy Station #3"
	landmark_tag = "nav_spy_station_3"

/obj/effect/shuttle_landmark/spy_station/navantag
	name = "Spy Station #4"
	landmark_tag = "nav_spy_station_antag"
