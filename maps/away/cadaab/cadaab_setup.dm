/obj/effect/overmap/visitable/sector/cadaab
	name = "Cadaab"
	desc = "The hot desert Moon of Inax. A recent landslide caused many roads to be blocked."
	sector_flags = OVERMAP_SECTOR_KNOWN
	icon_state = "globe"
	color = "#cc6600"
	start_x = 4
	start_y = 4
	initial_generic_waypoints = list(
		"nav_prettyboy_dock",
		"nav_outpost",
		"nav_shahtinsk"
	)

/obj/effect/overmap/visitable/sector/sputnik
	name = "Sputnik"
	desc = "A small telecommunications satellite. Too small to be docked or shot down."
	sector_flags = OVERMAP_SECTOR_KNOWN
	icon_state = "object"
	color = "#4287f5"
	start_x = 3
	start_y = 3

/obj/effect/overmap/visitable/sector/inax
	name = "Inax"
	desc = "Inax is a dark jungle planet, in a place where the Lordanian Sovereign Systems has no serious influence. Thus, it is inhabited by pirates and other undesirables who live in small settlements on nitrogen-rich land."
	icon_state = "globe"
	color = "#00cc66"
	start_x = 5
	start_y = 5
	sector_flags = OVERMAP_SECTOR_KNOWN

/datum/shuttle/autodock/overmap/syndi
	name = "PrettyBoy"
	move_time = 10
	shuttle_area = list(
		/area/cadaab/outpost/syndishuttle
	)
	dock_target = "nav_prettyboy_dock"
	current_location = "nav_prettyboy_dock"
	landmark_transition = "nav_prettyboy_transit"
	range = 1
	logging_home_tag = "nav_prettyboy_dock"
	logging_access = access_castelnau_syndipass
	ceiling_type = /turf/simulated/floor/shuttle_ceiling

/obj/effect/shuttle_landmark/nearoutpost
	name = "Place near the Outpost"
	landmark_tag = "nav_prettyboy_dock"
//	docking_controller = "prettyboy_shuttle_dock"
	base_area = /area/cadaab/outpost/landing
	base_turf = /turf/simulated/floor

/obj/effect/shuttle_landmark/transit/syndi
	name = "Transit"
	landmark_tag = "nav_prettyboy_transit"

/obj/effect/overmap/visitable/ship/landable/syndi
	name = "SSS PrettyBoy"
	shuttle = "PrettyBoy"
	vessel_mass = 1000
	fore_dir = NORTH

/obj/machinery/computer/shuttle_control/explore/syndi
	name = "PrettyBoy control console"
	shuttle_tag = "PrettyBoy"
	req_access = list(access_castelnau_syndipass)

/obj/effect/shuttle_landmark/lzoutpost
	name = "Outpost - Landing Zone"
	landmark_tag = "nav_outpost"

/obj/effect/shuttle_landmark/nearshahtinsk
	name = "Place near Shahtinsk"
	landmark_tag = "nav_shahtinsk"

/obj/machinery/telecomms/relay/preset/planetside
	id = "Planetside Relay"
	autolinkers = list("cadaab_relay")
	usage_offise = 5 KILOWATTS
	outage_probability = 100
