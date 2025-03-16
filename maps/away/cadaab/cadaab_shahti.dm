/obj/structure/cadaab
	name = "stone"
	desc = "You will surely burn your hand if you touch it."
	icon = 'maps/away/cadaab/icons/shahti.dmi'
	icon_state = "stone0"
	anchored = TRUE
	density = TRUE
	layer = ABOVE_HUMAN_LAYER
	health_max = 300
	luminosity = 1

/obj/structure/cadaab/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/pickaxe))
		playsound(loc, 'sound/weapons/Genhit.ogg', 100, 1)
		qdel(src)
		return
	else
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		damage_health(W.force, W.damtype)
		..()
/obj/structure/cadaab/on_death()
	qdel(src)

/obj/structure/cadaab/Initialize()
	. = ..()
	icon_state = "stone[rand(0,6)]"


/obj/structure/cadaab/mineral
	name = "ore deposit"
	desc = "It certainly shouldn't stick out of the stone."
	icon_state = "stoneiron0"

/obj/structure/cadaab/mineral/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/pickaxe))
		playsound(loc, 'sound/weapons/Genhit.ogg', 100, 1)
		new /obj/item/ore/iron(get_turf(src))
		new /obj/item/ore/iron(get_turf(src))
		new /obj/item/ore/iron(get_turf(src))
		new /obj/item/ore/iron(get_turf(src))
		new /obj/item/ore/iron(get_turf(src))
		new /obj/item/ore/coal(get_turf(src))
		qdel(src)
		return
	else
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		damage_health(W.force, W.damtype)
		..()

/obj/structure/cadaab/mineral/Initialize()
	. = ..()
	icon_state = "stoneiron[rand(0,7)]"

/obj/structure/cadaab/mineral/silver
	name = "silver deposit"
	icon_state = "stonesilver0"

/obj/structure/cadaab/mineral/silver/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/pickaxe))
		playsound(loc, 'sound/weapons/Genhit.ogg', 100, 1)
		new /obj/item/ore/silver(get_turf(src))
		new /obj/item/ore/silver(get_turf(src))
		new /obj/item/ore/silver(get_turf(src))
		new /obj/item/ore/silver(get_turf(src))
		new /obj/item/ore/silver(get_turf(src))
		qdel(src)
		return
	else
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		damage_health(W.force, W.damtype)
		..()

/obj/structure/cadaab/mineral/silver/Initialize()
	. = ..()
	icon_state = "stonesilver[rand(0,7)]"

/obj/structure/cadaab/mineral/gold
	name = "gold deposit"
	icon_state = "stonegold0"

/obj/structure/cadaab/mineral/gold/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/pickaxe))
		playsound(loc, 'sound/weapons/Genhit.ogg', 100, 1)
		new /obj/item/ore/gold(get_turf(src))
		new /obj/item/ore/gold(get_turf(src))
		new /obj/item/ore/gold(get_turf(src))
		new /obj/item/ore/gold(get_turf(src))
		new /obj/item/ore/gold(get_turf(src))
		qdel(src)
		return
	else
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		damage_health(W.force, W.damtype)
		..()

/obj/structure/cadaab/mineral/gold/Initialize()
	. = ..()
	icon_state = "stonegold[rand(0,7)]"

/obj/structure/cadaab/mineral/uranium
	name = "uranium deposit"
	icon_state = "stoneuran0"

/obj/structure/cadaab/mineral/uranium/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/pickaxe))
		playsound(loc, 'sound/weapons/Genhit.ogg', 100, 1)
		new /obj/item/ore/uranium(get_turf(src))
		new /obj/item/ore/uranium(get_turf(src))
		new /obj/item/ore/uranium(get_turf(src))
		new /obj/item/ore/uranium(get_turf(src))
		new /obj/item/ore/uranium(get_turf(src))
		qdel(src)
		return
	else
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		damage_health(W.force, W.damtype)
		..()

/obj/structure/cadaab/mineral/uranium/Initialize()
	. = ..()
	icon_state = "stoneuran[rand(0,6)]"

/obj/structure/cadaab/mineral/phoron
	name = "phoron deposit"
	icon_state = "stonephoron0"

/obj/structure/cadaab/mineral/phoron/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/pickaxe))
		playsound(loc, 'sound/weapons/Genhit.ogg', 100, 1)
		new /obj/item/ore/phoron(get_turf(src))
		new /obj/item/ore/phoron(get_turf(src))
		new /obj/item/ore/phoron(get_turf(src))
		new /obj/item/ore/phoron(get_turf(src))
		new /obj/item/ore/phoron(get_turf(src))
		qdel(src)
		return
	else
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		damage_health(W.force, W.damtype)
		..()

/obj/structure/cadaab/mineral/phoron/Initialize()
	. = ..()
	icon_state = "stonephoron[rand(0,6)]"

/obj/random/cadaab_minerals
	name = "random mineral deposit"
	desc = "This is a random mineral deposit."
	icon = 'maps/away/cadaab/icons/shahti.dmi'
	icon_state = "stonephoron0"

/obj/random/cadaab_minerals/spawn_choices()
	return list(/obj/structure/cadaab/mineral,
				/obj/structure/cadaab/mineral/silver,
				/obj/structure/cadaab/mineral/gold,
				/obj/structure/cadaab/mineral/uranium,
				/obj/structure/cadaab/mineral/phoron)