/*QUICK REMINDER:
	id  - id of this bump_teleporter.
	id_target - id of bump_teleporter which this moves you to.*/

/obj/effect/bump_teleporter/fasttravel
	name = "next location"
	icon = 'icons/bos/effects/fasttravel.dmi'
	icon_state = "start"

/obj/effect/bump_teleporter/fasttravel/end
	name = "previous location"
	icon_state = "end"
	density = FALSE