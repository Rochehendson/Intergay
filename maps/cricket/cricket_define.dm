/datum/map/cricket
	name = "Grasshopper"
	full_name = "Grasshopper Delivery Group"
	path = "cricket"

	lobby_screens = list('maps/cricket/lobby.png')
	lobby_tracks = list(/decl/audio/track/absconditus)

	station_levels = list(1, 2, 3)
	contact_levels = list(1, 2, 3)
	player_levels = list(1, 2, 3)
	accessible_z_levels = list("1"=1,"2"=1,"3"=1)

	allowed_spawns = list("Cryogenic Storage")
	default_spawn = "Cryogenic Storage"

	station_name  = "Cricket"
	station_short = "Cricket"
	dock_name     = "Main Dock"
	boss_name     = "TriNet Corp"
	boss_short    = "TriNet"
	company_name  = "Grasshopper Delivery Group"
	company_short = "GDG"

	usable_email_tlds = list("jk.mail", "trinet.inc", "email.com", "freemail.com")
	map_admin_faxes = list("Grasshopper Delivery Group", "TriNet Corporation")

	use_overmap = 1

/datum/map/cricket/get_map_info()
	. = list()
	. += "Grasshopper Delivery Group/Grasshopper DG - практически обанкротившеяся Грузовая Корпорация, что оформила множество выгодных договоров с TriNet Corp, что грозит самой корпорации слиянием с гигантом от безысходности."
	. += "Очередное, практически безымянное судно, отстроенное ещё в лучшие годы, кое-как сводит концы с концами и даже раз в пару месяцев способно превысить собственные расходы."
	return jointext(., "<hr>")
