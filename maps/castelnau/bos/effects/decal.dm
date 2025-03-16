/obj/effect/decal/cleanable/antar
	name = "graffiti"
	desc = "'XYN'"
	icon = 'maps/torch/bos/icons/effects/graffiti.dmi'
	icon_state = "huy"
	anchored = 1

/obj/effect/decal/cleanable/antar/gaia
	desc = "'Remember Gaia'"
	icon_state = "gaia"

/obj/effect/decal/cleanable/antar/solgov
	desc = "Very offensive redrawing of a famous poster"
	icon_state = "solgov"

/obj/effect/decal/cleanable/antar/text
	icon_state = "text"

/obj/effect/decal/cleanable/antar/text2
	icon_state = "text2"

/obj/effect/decal/cleanable/antar/text3
	icon_state = "text3"

/obj/effect/decal/cleanable/antar/text4
	icon_state = "text4"

/obj/effect/decal/cleanable/antar/text5
	icon_state = "text5"

/obj/effect/floor_decal/outpostsign
	name = "outpost"
	icon = 'maps/castelnau/bos/icons/effects/text.dmi'
	icon_state = "outpost"
	alpha = 230

/obj/effect/floor_decal/outops
	name = "outops"
	icon = 'maps/castelnau/bos/icons/effects/text.dmi'
	icon_state = "outops"
	alpha = 230

/obj/effect/floor_decal/cadbio
	name = "bio"
	icon = 'maps/castelnau/bos/icons/effects/text.dmi'
	icon_state = "bio"
	alpha = 230

/obj/effect/floor_decal/ftu
	name = "ftu"
	icon = 'maps/castelnau/bos/icons/effects/ftu.dmi'
	icon_state = "ftu"
	alpha = 200

/mob/living/simple_animal/passive/bob
	name = "Bob"
	icon = 'maps/castelnau/bos/icons/effects/bob.dmi'
	desc = "You shouldn't be here."
	health = 9999
	maxHealth = 9999
	icon_state = "bob"
	item_state = "bob"
	icon_living = "bob"
	icon_dead = "bob"
	mob_size = MOB_MEDIUM
	mob_bump_flag = HEAVY
	mob_swap_flags = HEAVY
	mob_push_flags = ALLMOBS
	can_escape = TRUE
	response_help  = "is afraid of"
	response_disarm = "can't change fate of"
	response_harm   = "is weaker than"
