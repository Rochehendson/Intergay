/turf/simulated/inaks/asphalt
	name = "asphalt"
	icon = 'icons/bos/turf/inaks_turfs.dmi'
	icon_state = "asphalt"
	footstep_type = /decl/footsteps/asphalt

/turf/simulated/inaks/plate
	name = "plate"
	icon = 'icons/bos/turf/inaks_turfs.dmi'
	icon_state = "plate"
	footstep_type = /decl/footsteps/concrete

/turf/simulated/inaks/cubic_plate
	name = "cubic plate"
	icon = 'icons/bos/turf/inaks_turfs.dmi'
	icon_state = "cubic_plate"
	footstep_type = /decl/footsteps/concrete

/turf/simulated/inaks/dark_cafel
	name = "dark cafel"
	icon = 'icons/bos/turf/inaks_turfs.dmi'
	icon_state = "dark_cafel"

//WHY THERE ARE TWO DIFFERENT KINDS OF TURFS HERE WHAT THE ACTUAL FUCJ

/turf/simulated/floor/inaks
	icon = 'icons/bos/turf/inaks_turfs.dmi'

/turf/simulated/floor/inaks/Initialize() //for cadaab
	.=..()
	set_light(1, 1, 5, l_color = "#FF9D8E")

/turf/simulated/floor/inaks/asphalt
	name = "asphalt"
	icon_state = "asphalt"
	footstep_type = /decl/footsteps/asphalt

/turf/simulated/floor/inaks/plate
	name = "plate"
	icon_state = "plate"
	footstep_type = /decl/footsteps/concrete

/turf/simulated/floor/inaks/cubic_plate
	name = "cubic plate"
	icon_state = "cubic_plate"
	footstep_type = /decl/footsteps/concrete

/turf/simulated/floor/inaks/dark_cafel
	name = "dark cafel"
	icon_state = "dark_cafel"

/turf/simulated/floor/inaks/roof
	name = "dark roof"
	icon_state = "roof0"

/turf/simulated/floor/inaks/roof/Initialize()
	.=..()
	icon_state = "roof[rand(0,3)]"