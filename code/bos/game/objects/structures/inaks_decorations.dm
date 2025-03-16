/obj/structure/inaks_decor
	name = "crosswalk sign"
	icon = 'icons/bos/obj/inaks_decorations.dmi'
	icon_state = "crosswalk_sign"
	anchored = TRUE
	density = FALSE
	layer = ABOVE_HUMAN_LAYER
	plane = DECORATIONS_PLANE

/obj/structure/inaks_decor/turn_sign
	name = "road turn sign"
	icon_state = "turn_sign"

/obj/structure/inaks_decor/lamppost
	name = "lamppost"
	icon_state = "lamppost"

/obj/structure/inaks_decor/lamppost/Crossed(mob/living/M)
	. = ..()
	plane = DEFAULT_PLANE

/obj/structure/inaks_decor/lamppost/Uncrossed(O)
	. = ..()
	plane = DECORATIONS_PLANE
