#include "raider_vessel_areas.dm"

/obj/effect/overmap/visitable/sector/raider_vessel
	name = "Raider Vessel"
	desc = "Vessel with a lot of debris on the hull and no indication of activity on board."
	icon_state = "ship"
	known = FALSE

	initial_generic_waypoints = list(
	"nav_raider_vessel_1",
	"nav_raider_vessel_2",
	"nav_raider_vessel_3",
	"nav_raider_vessel_antag"
	)

/datum/map_template/ruin/away_site/raider_vessel
	name = "Raider Vessel"
	id = "awaysite_raider_vessel"
	description = "Raider Vessel."
	suffixes = list("raider_vessel.dmm")
	spawn_cost = 0.5
	area_usage_test_exempted_root_areas = list(/area/raider_vessel)

/obj/effect/shuttle_landmark/raider_vessel/nav1
	name = "Raider Vessel #1"
	landmark_tag = "nav_raider_vessel_1"

/obj/effect/shuttle_landmark/raider_vessel/nav2
	name = "Raider Vessel #2"
	landmark_tag = "nav_raider_vessel_2"

/obj/effect/shuttle_landmark/raider_vessel/nav3
	name = "Raider Vessel #3"
	landmark_tag = "nav_raider_vessel_3"

/obj/effect/shuttle_landmark/raider_vessel/navantag
	name = "Raider Vessel #4"
	landmark_tag = "nav_raider_vessel_antag"
