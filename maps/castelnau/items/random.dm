/obj/random/material_rnd_steel
	name = "random steel"
	desc = "This is a random metal ammout for RND's storage."
	icon = 'icons/obj/materials.dmi'
	icon_state = "sheet-mult"
	spawn_nothing_percentage = 50

/obj/random/material_rnd_steel/spawn_choices()
	return list(/obj/item/stack/material/steel/ten = 1,
				/obj/item/stack/material/steel/fifty = 2)

/obj/random/material_rnd_glass
	name = "random glass"
	desc = "This is a random glass ammout for RND's storage."
	icon = 'icons/obj/materials.dmi'
	icon_state = "sheet-clear-mult"
	spawn_nothing_percentage = 50

/obj/random/material_rnd_glass/spawn_choices()
	return list(/obj/item/stack/material/glass/ten = 1,
				/obj/item/stack/material/glass/fifty = 2)

/obj/random/trash/space
	name = "random space trash"
	desc = "This is some random trash."
	icon = 'icons/effects/effects.dmi'
	icon_state = "greenglow"

/obj/random/trash/space/spawn_choices()
	return list(/obj/item/ore/iron = 1,
				/obj/item/ore/glass = 5,
				/obj/item/stack/material/rods = 2,
				/obj/effect/decal/cleanable/ash = 5,
				/obj/effect/decal/cleanable/dirt = 3,
				/obj/item/remains/robot = 2)