/datum/map/castelnau
	// Unit test exemptions
	apc_test_exempt_areas = list(
		/area/space = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/exoplanet = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/castelnau/maintenance/thirddeck/port = NO_SCRUBBER|NO_VENT,
		/area/shuttle/castelnau/bixie/power = NO_SCRUBBER|NO_VENT,
		/area/shuttle/castelnau/perseus/power = NO_SCRUBBER|NO_VENT,
		/area/castelnau/thruster/d2port = NO_SCRUBBER,
//		/area/castelnau/maintenance = NO_SCRUBBER|NO_VENT,
		/area/castelnau/maintenance/seconddeck/port = NO_SCRUBBER|NO_VENT,
		/area/castelnau/maintenance/seconddeck/forestarboard = NO_SCRUBBER|NO_VENT,
		/area/castelnau/maintenance/seconddeck/starboard = NO_SCRUBBER|NO_VENT,
		/area/castelnau/maintenance/seconddeck/aftstarboard = NO_SCRUBBER|NO_VENT,
		/area/castelnau/thruster/d2starboard = NO_SCRUBBER,
		/area/castelnau/thruster/d1port = NO_SCRUBBER|NO_VENT,
		/area/castelnau/thruster/d1starboard = NO_SCRUBBER|NO_VENT,
		/area/castelnau/medical/maintenance_equipstorage = NO_SCRUBBER|NO_VENT,
		/area/castelnau/maintenance/firstdeck/aftport = NO_SCRUBBER|NO_VENT,
		/area/castelnau/maintenance/firstdeck/foreport = NO_SCRUBBER|NO_VENT,
		/area/castelnau/maintenance/firstdeck/aft = NO_SCRUBBER|NO_VENT,
		/area/shuttle/escape_pod1 = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/castelnau/engineering/substation = NO_SCRUBBER|NO_VENT,
		/area/shuttle/escape_pod2 = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/shuttle/escape_pod3 = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/shuttle/escape_pod4/station = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/castelnau/maintenance/firstdeck/forestarboard = NO_SCRUBBER|NO_VENT,
		/area/castelnau/engineering/shield = NO_SCRUBBER|NO_VENT,
		/area/castelnau/maintenance/firstdeck/centralstarboard = NO_SCRUBBER|NO_VENT,
		/area/castelnau/maintenance/firstdeck/aftstarboard = NO_SCRUBBER|NO_VENT,
		/area/maintenance/exterior = NO_SCRUBBER|NO_VENT|NO_APC
	)

	area_coherency_test_exempt_areas = list(
		/area/centcom/control,
		/area/maintenance/exterior,
		/area/space
	)

	area_usage_test_exempted_areas = list(
		/area/overmap,
		/area/syndicate_elite_squad,
		/area/shuttle/escape,
		/area/shuttle/escape/centcom,
		/area/shuttle/syndicate_elite/station,
		/area/turbolift,
		/area/template_noop,
		/area/tdome/testing,
		/area/tdome/testing/engineering,
		/area/tdome/testing/engineering/unpowered,
		/area/chapel,
		/area/castelnau/supply/hangar,
		/area/hallway,
		/area/rnd,
		/area/rnd/xenobiology,
		/area/rnd/xenobiology/xenoflora,
		/area/rnd/xenobiology/xenoflora_storage,
		/area/medical,
//		/area/medical/virology,
//		/area/medical/virologyaccess,
		/area/security,
		/area/security/brig,
		/area/security/prison,
		/area/supply
	)

/datum/unit_test/zas_area_test/warehouse
	name = "ZAS: Warehouse"
	area_path = /area/castelnau/supply/storage
