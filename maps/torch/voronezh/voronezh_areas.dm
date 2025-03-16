/datum/map/voronezh

	base_floor_type = /turf/unsimulated/floor/snow/permafrost

/area/voronezh
	name = "Charon"
	icon = 'maps/torch/voronezh/voronezh_icons.dmi'
	icon_state = "charon"
	base_turf = /turf/unsimulated/floor/snow/permafrost

/area/voronezh/acquilla
	name = "Acquilla"
	icon_state = "acquilla"

/area/voronezh/engineers
	name = "Engineering Field Bay"
	icon_state = "engi"
	req_access = list(access_engine, access_engine_equip)

/area/voronezh/bridge
	name = "Field Bridge"
	icon_state = "bridge"
	req_access = list(access_bridge)

/area/voronezh/grisha
	name = "Bolshoy Grigoriy Quarters"
	icon_state = "grisha"
	req_access = list(access_captain)

/area/voronezh/common_room
	name = "Common House"
	icon_state = "common_room"

/area/voronezh/arsenal
	name = "Field Arsenal"
	icon_state = "arsenal"
	req_access = list(access_armory)

/area/voronezh/med
	name = "Field Medical Bay"
	icon_state = "med"
	req_access = list(access_medical)

/area/voronezh/cap
	name = "SCG Earth Central Governement House"
	icon_state = "cap"
	req_access = list(access_cent_captain)
	sound_env = LARGE_SOFTFLOOR

/area/voronezh/bunker_lor
	name = "Field Bunker"
	icon_state = "bunker_lor"

/area/voronezh/bunker_sol
	name = "Sol Bunker"
	icon_state = "bunker_sol"
	req_access = list(access_cent_captain)

/area/voronezh/outside
	name = "Outside"
	icon_state = "outside"
	ambience = list('sound/ambience/bos/warambient1.ogg','sound/ambience/bos/warambient2.ogg','sound/ambience/bos/warambient3.ogg','sound/ambience/bos/warambient4.ogg')
	luminosity = 1
	lighting_tone = AREA_LIGHTING_WARM
	sound_env = LARGE_ENCLOSED
	area_flags = AREA_FLAG_EXTERNAL

/area/voronez/outside/atmosalert()
	return

/area/voronez/outside/fire_alert()
	return

/area/voronez/outside/fire_reset()
	return

/area/voronez/outside/readyalert()
	return

/area/voronez/outside/partyalert()
	return

/area/shuttle/escapeevent
	name = "Transport Shuttle"
	icon_state = "shuttlered"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED