/obj/random/lootable_mgsbox
	name = "random mgsbox"
	desc = "This is a random mgsbox."
	icon = 'icons/bos/obj/box.dmi'
	icon_state = "box"
	spawn_nothing_percentage = 10

/obj/random/lootable_mgsbox/spawn_choices()
	return list(/obj/item/storage/mgsbox/med/loot_medicaments,
				/obj/item/storage/mgsbox/loot_material,
				/obj/item/storage/mgsbox/loot_engineering,
				/obj/item/storage/mgsbox/loot_accesory,
				/obj/item/storage/mgsbox/loot_meal)

/obj/random/asphalt_crack
	name = "random crack"
	desc = "This is a random crack."
	icon = 'icons/bos/turf/inaks_decals.dmi'
	icon_state = "crack_1"
	spawn_nothing_percentage = 5

/obj/random/asphalt_crack/spawn_choices()
	return list(/obj/effect/floor_decal/inaks/asphalt_crack_1,
				/obj/effect/floor_decal/inaks/asphalt_crack_2,
				/obj/effect/floor_decal/inaks/asphalt_crack_3,
				/obj/effect/floor_decal/inaks/asphalt_crack_4,
				/obj/effect/floor_decal/inaks/asphalt_crack_5,
				/obj/effect/floor_decal/inaks/asphalt_crack_6,
				/obj/effect/floor_decal/inaks/asphalt_crack_7,
				/obj/effect/floor_decal/inaks/asphalt_crack_8,
				/obj/effect/floor_decal/inaks/asphalt_crack_9,
				/obj/effect/floor_decal/inaks/asphalt_crack_10,
				/obj/effect/floor_decal/inaks/asphalt_crack_11,
				/obj/effect/floor_decal/inaks/asphalt_crack_12,
				/obj/effect/floor_decal/inaks/asphalt_crack_13,
				/obj/effect/floor_decal/inaks/asphalt_crack_14,
				/obj/effect/floor_decal/inaks/asphalt_crack_15,
				/obj/effect/floor_decal/inaks/asphalt_crack_16,
				/obj/effect/floor_decal/inaks/asphalt_crack_17,
				/obj/effect/floor_decal/inaks/asphalt_crack_18,
				/obj/effect/floor_decal/inaks/asphalt_crack_19,
				/obj/effect/floor_decal/inaks/asphalt_crack_20,
				/obj/effect/floor_decal/inaks/asphalt_crack_21,
				/obj/effect/floor_decal/inaks/asphalt_crack_22,
				/obj/effect/floor_decal/inaks/asphalt_crack_23,
				/obj/effect/floor_decal/inaks/asphalt_crack_24)

/obj/random/supply_box //No grenades here, look below
	name = "random not cool supply box"
	desc = "Insert meme here"
	icon = 'proxima/icons/obj/supply_boxes.dmi'
	icon_state = "mre_box"

/obj/random/supply_box/spawn_choices()
	return list(/obj/item/storage/fancy/supply_box,
				/obj/item/storage/fancy/supply_box/cell,
				/obj/item/storage/fancy/supply_box/water,
				/obj/item/storage/fancy/supply_box/flashlight,
				/obj/item/storage/fancy/supply_box/bumaga)

/obj/random/supply_box_cool
	name = "random cool supply box"
	desc = "Insert meme here"
	icon = 'proxima/icons/obj/supply_boxes.dmi'
	icon_state = "m67_box"

/obj/random/supply_box/spawn_choices()
	return list(/obj/item/storage/fancy/supply_box/lightgrenade,
				/obj/item/storage/fancy/supply_box/grenade,
				/obj/item/storage/fancy/supply_box/flashlight)

/obj/random/good_tools
	name = "random tools and tech"
	desc = "This is a random tool."
	icon = 'icons/obj/tools.dmi'
	icon_state = "welder"

/obj/random/good_tools/spawn_choices()
	return list(/obj/item/weldingtool/largetank,
				/obj/item/device/flashlight/upgraded,
				/obj/item/cell/high,
				/obj/item/cell/super,
				/obj/item/cell/hyper,
				/obj/item/storage/toolbox/syndicate,
				/obj/item/stack/telecrystal,
				/obj/item/gun/energy/retro)


////
// MOBS
////

/obj/random/simple_mob
	name = "random mob base(not use this)"
	desc = "Here is a random mob."
	icon = 'icons/mob/simple_animal/nightmaremonsters.dmi'
	icon_state = "horror"

	spawn_method = /obj/random/simple_mob/proc/spawn_mob
	var/no_other_mob_range = 1			//When spawn a mob, all spawners of other mobs types will be deleted in this range
	var/check_in_zone_passed = FALSE 	//Since sometime random_mob types can initialize(and cause proc below multiple times in a row) one after another, this increases the chance of a certain type of mobs spawning in an area. To fix this, the first one to initialize is a check for all types in the environment at once. Shortly, it's for more randomly random

/obj/random/simple_mob/proc/spawn_mob()
	if(prob(spawn_nothing_percentage))
		if(!check_in_zone_passed)
			for(var/obj/random/simple_mob/other_mob in range(no_other_mob_range, src))
				if(istype(other_mob.type, src.type))
					qdel(other_mob)
		return

	if(isnull(loc))
		return

	var/build_path = pickweight(spawn_choices())

	var/atom/A = new build_path(src.loc)
	if(pixel_x || pixel_y)
		A.pixel_x = pixel_x
		A.pixel_y = pixel_y

	for(var/obj/random/simple_mob/other_mob in range(no_other_mob_range, src))
		if(!istype(other_mob.type, src.type))
			qdel(other_mob)
		else
			other_mob.check_in_zone_passed = TRUE

	return A

/obj/random/simple_mob/meat
	name = "random meat mob"
	desc = "Here is a random Dead Space reference."

/obj/random/simple_mob/meat/spawn_choices()
	return list(/mob/living/simple_animal/hostile/meat/horrorsmall = 7,
				/mob/living/simple_animal/hostile/meat/horrorminer = 10,
				/mob/living/simple_animal/hostile/meat/strippedhuman = 10,
				/mob/living/simple_animal/hostile/meat/humansecurity = 6,
				/mob/living/simple_animal/hostile/meat/horror = 5,
				/mob/living/simple_animal/hostile/meat/abomination = 3)

/obj/random/simple_mob/bot
	name = "random bot"
	desc = "Here is a random beep-boop maker."
	icon = 'icons/mob/simple_animal/hivebot.dmi'
	icon_state = "basic"

/obj/random/simple_mob/bot/spawn_choices()
	return list(/mob/living/simple_animal/hostile/hivebot = 10,
				/mob/living/simple_animal/hostile/hivebot/tank/armored = 2,
				/mob/living/simple_animal/hostile/hivebot/ranged_damage/ion = 2,
				/mob/living/simple_animal/hostile/hivebot/ranged_damage/dot = 4,
				/mob/living/simple_animal/hostile/hivebot/range = 7,
				/mob/living/simple_animal/hostile/viscerator/hive = 6,
				/mob/living/simple_animal/hostile/retaliate/malf_drone/hive = 3)

/mob/living/simple_animal/hostile/retaliate/malf_drone/hive
	faction = "hivebot"

/obj/random/simple_mob/barbarian
	name = "random tech-barbarian"
	desc = "Here is a random ITshnik maker."
	icon = 'maps/castelnau/techbarb-event/barbs.dmi'
	icon_state = "barbmelee"

/obj/random/simple_mob/barbarian/spawn_choices()
	return list(/mob/living/simple_animal/hostile/russian/barbmelee/wild = 10,
				/mob/living/simple_animal/hostile/sol_military/barbarian/wild = 4,
				/mob/living/simple_animal/hostile/sol_military/barbarian/shield/wild = 2)

/mob/living/simple_animal/hostile/russian/barbmelee/wild
	faction = "tech-barbarians"

/mob/living/simple_animal/hostile/sol_military/barbarian/wild
	faction = "tech-barbarians"

////
// No way, turf random generation?7?
////
/*
/obj/random/syndivault
	name = "syndivault door"
	desc = "Here can spawn airlock or wall turf"
	icon = 'icons/obj/doors/vault/door.dmi'
	icon_state = "preview"
	spawn_nothing_percentage = 0

/obj/random/syndivault/spawn_choices()
	return list(/obj/machinery/door/airlock/vault,
				/turf/unsimulated/cadaab/rock)
*/
