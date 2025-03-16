/obj/structure/ruins
	name = "ruins"
	desc = "A huge impenetrable pile of garbage, consisting of fragments of walls, cars, tanks and the rest."
	icon = 'icons/obj/rubble.dmi'
	icon_state = "base"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_HUMAN_LAYER
	opacity = 1

/obj/structure/ruins/Initialize()
	. = ..()
	update_icon()

/obj/structure/ruins/on_update_icon()
	overlays.Cut()
	var/list/parts = list()
	for(var/i = 1 to 7)
		var/image/I = image(icon,"rubble[rand(1,15)]")
		if(prob(10))
			var/atom/A
			if(initial(A.icon) && initial(A.icon_state))
				I.icon = initial(A.icon)
				I.icon_state = initial(A.icon_state)
				I.color = initial(A.color)
		I.appearance_flags = DEFAULT_APPEARANCE_FLAGS | PIXEL_SCALE
		I.pixel_x = rand(-16,16)
		I.pixel_y = rand(-16,16)
		I.SetTransform(rotation = rand(0,360))
		parts += I
	overlays = parts
