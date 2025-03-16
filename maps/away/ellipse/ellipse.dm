#include "ellipse_areas.dm"
#include "ellipse_jobs.dm"
#include "ellipse_shuttle.dm"

/obj/effect/overmap/visitable/ship/ellipse
	name = "Ellipse Ship"
	desc = "Sensor array is detecting a small vessel with 'Ellipse Fleet' signature."
	color = "#404040"
	vessel_mass = 1000
	max_speed = 2/(2 SECONDS)
	initial_generic_waypoints = list(
		"nav_ellipse_1",
		"nav_ellipse_2",
		"nav_ellipse_3",
		"nav_ellipse_4",
		"nav_dock_land"
	)

/datum/map_template/ruin/away_site/ellipse
	name = "Ellipse Ship"
	id = "awaysite_ellipse"
	description = "Tiny movable ship with no bio signature."
	suffixes = list("ellipse/ellipse.dmm")
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/landing_shuttle/land)
	spawn_cost = 0.5
	area_usage_test_exempted_root_areas = list(/area/ellipse)

/obj/effect/overmap/visitable/ship/ellipse/New(nloc, max_x, max_y)
	name = "SSS [pick("Seeker-007", "Pathfinder-013", "Prospector-015", "Researcher-017")], \a [name]"
	..()

/var/const/access_ellipse = "ACCESS_ELLIPSE"

/datum/access/ellipse
	id = access_ellipse
	desc = "SSS Operator"
	region = ACCESS_REGION_NONE

/obj/item/card/id/ellipse
	color = COLOR_GRAY40
	detail_color = "#404040"
	access = list(access_ellipse)

/obj/effect/shuttle_landmark/nav_ellipse/nav1
	name = "Ellipse Navpoint #1"
	landmark_tag = "nav_ellipse_1"

/obj/effect/shuttle_landmark/nav_ellipse/nav2
	name = "Ellipse Navpoint #2"
	landmark_tag = "nav_ellipse_2"

/obj/effect/shuttle_landmark/nav_ellipse/nav3
	name = "Ellipse Navpoint #3"
	landmark_tag = "nav_ellipse_3"

/obj/effect/shuttle_landmark/nav_ellipse/nav4
	name = "Ellipse Navpoint #4"
	landmark_tag = "nav_ellipse_antag"

/obj/effect/shuttle_landmark/nav_ellipse/nav_dock
	name = "Ellipse Dock"
	landmark_tag = "nav_dock_land"