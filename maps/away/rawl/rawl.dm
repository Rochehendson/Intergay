#include "rawl_shuttles.dm"
#include "rawl_jobs.dm"
#include "rawl_areas.dm"

/datum/map_template/ruin/away_site/rawl
	name = "IPV Rawl"
	id = "awaysite_rawl"
	description = "Unathi Poacher Ship."
	suffixes = list("rawl/rawl.dmm")
	area_usage_test_exempted_root_areas = list(/area/ship/rawl/)
	apc_test_exempt_areas = list(/area/ship/rawl/wreck = NO_SCRUBBER)
	spawn_cost = 0.5
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/rawl_ship)

/obj/effect/overmap/visitable/sector/rawl_spawn
	name = "mundane asteroid"
	desc = "Initial scans suggest something has impacted this asteroid. Further analysis reveals it was a second asteroid."
	icon_state = "meteor2"
	hide_from_reports = TRUE

	initial_generic_waypoints = list(
		"nav_rawl_1",
		"nav_rawl_2"
	)
	initial_restricted_waypoints = list(
		"IPV Rawl" = list("nav_hangar_rawlship")
	)

/obj/effect/shuttle_landmark/rawl/one
	name = "East of asteroid"
	landmark_tag = "nav_rawl_1"

/obj/effect/shuttle_landmark/rawl/two
	name = "South of asteroid"
	landmark_tag = "nav_rawl_2"

/obj/effect/submap_landmark/joinable_submap/rawl
	name =  "IPV Rawl"
	archetype = /decl/submap_archetype/derelict/rawl

/decl/submap_archetype/derelict/rawl
	descriptor = "Unathi Poacher Ship"
	map = "IPV Rawl"
	crew_jobs = list(
		/datum/job/submap/rawl_pilot,
		/datum/job/submap/rawl_tech,
		/datum/job/submap/rawl_medic
	)

/obj/machinery/power/smes/buildable/preset/rawl/smes
	uncreated_component_parts = list(/obj/item/stock_parts/smes_coil/super_capacity = 1)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE

/obj/item/melee/energy/knife  //these sprites slightly suck, may redo later
	icon = 'icons/bos/obj/weapons.dmi'
	icon_state = "knife_unathi_x"
	active_icon = "knife_unathi"
	active_force = 20
	active_throwforce = 30
	name = "power dagger"
	desc = "A dull yet extremely hot knife. Not to be confused with a laser scalpel, the only medical use for this knife is euthanasia. Or cutting a plastic bottle of soda."
	lighting_color = "#ceca2b"
	sharp = 1
	edge = 1
	base_parry_chance = 10 //more unwieldy than a combat knife, and you don't want to toast yourself!
	force = 7
	throwforce = 10
	throw_speed = 3
	throw_range = 7
	w_class = ITEM_SIZE_SMALL
	active_attack_verb = list("stabbed", "cut", "seared", "slashed")
	inactive_attack_verb = list("stabbed", "cut", "slashed")
	hitsound = 'sound/weapons/blade1.ogg'

/obj/item/melee/energy/pick
	icon = 'icons/bos/obj/weapons.dmi'
	icon_state = "pick_unathi_x"
	active_icon = "pick_unathi"
	active_force = 30
	active_throwforce = 20
	name = "War Pick"
	desc = "Probably not for mining. The head folds into the handle."
	lighting_color = "#ceca2b"
	sharp = 0
	edge = 0
	base_parry_chance = 20
	force = 25
	throwforce = 15
	throw_speed = 3
	throw_range = 7
	attack_cooldown = 8
	melee_accuracy_bonus = 5 //half that of a sword
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT
	active_attack_verb = list("stabbed", "pierced", "slashed", "jabbed")
	inactive_attack_verb = list("beaten", "clubbed", "bashed")

/obj/item/storage/secure/safe/rawl/New()
	..()
	new /obj/item/melee/energy/pick(src)
	new /obj/item/melee/energy/knife(src)
	new /obj/item/clothing/accessory/storage/holster/knife(src)
	spawn_money(rand(75,350)*10, src)

/var/const/access_rawl = "ACCESS_RAWL"
/datum/access/rawl
	id = access_rawl
	desc = "Rawl Access"
	region = ACCESS_REGION_NONE

/obj/item/card/id/rawl
	access = list(access_rawl)
	color = COLOR_BEIGE
	detail_color = COLOR_AMBER

/obj/machinery/power/apc/high/rawl
	req_access = list(access_rawl)

/obj/machinery/alarm/rawl
	req_access = list(access_rawl)
	target_temperature = T0C+40

/obj/item/clothing/under/rank/ntpilot/dohruk
	name = "brown flight suit"
	desc = "A dull unmarked flight suit. It has some patches on it, but all of them are just a mess of brown, like someone tried to clean a coffee stain with more coffee."
	icon_state = "pilot_unathi"
	gender_icons = 0
	worn_state = "pilot_unat"
	item_icons = list(slot_w_uniform_str = 'icons/mob/onmob/onmob_under_corporate.dmi')
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/generated/onmob_under_corporate_unathi.dmi',
		)

/obj/machinery/alarm/rawl/Initialize()
	. = ..()
	TLV[GAS_OXYGEN] =			list(18, 19, 135, 140) // Partial pressure, kpa
	TLV["temperature"] =	list(T0C-26, T0C, T0C+80, T0C+90) // K

/obj/structure/closet/secure_closet/personal/rawl
	name = "personal wall closet"
	desc = "It's a wall-mounted ID-locked closet for personal storage."
	anchored = TRUE
	density = FALSE
	wall_mounted = TRUE
	storage_types = CLOSET_STORAGE_ITEMS
	closet_appearance = /decl/closet_appearance/wall

/obj/structure/closet/rawlkitchen
	name = "kitchen cabinet"
	desc = "A small cupboard made of metal for storing kitchen supplies."
	anchored = TRUE
	density = FALSE
	wall_mounted = TRUE
	storage_types = CLOSET_STORAGE_ITEMS
	closet_appearance = /decl/closet_appearance/wall

/obj/structure/closet/secure_closet/personal/rawl/WillContain()
	return list(
		/obj/item/clothing/under/rank/ntpilot/dohruk,
		/obj/item/clothing/shoes/jackboots/unathi,
		/obj/item/storage/backpack/satchel/leather/reddish)

/obj/structure/closet/secure_closet/freezer/rawl
	name = "freezer"
	icon = 'icons/obj/closets/fridge.dmi'
	closet_appearance = null
	req_access = list(access_rawl)

/obj/item/device/radio/rawl
	name = "old radio"
	desc = "An old, cheap radio that looks heavy enough to kill someone."
	cell = /obj/item/cell/device/high
	throwforce = 35
	hitsound = 'sound/weapons/Genhit.ogg'
	force = 22
	melee_accuracy_bonus = -30 //takes years of training to use properly, truly powerful weapon
	attack_verb = list("smashed","bashed","bonked")
	attack_cooldown = 25 //heavy enough
	icon_state = "radio"
	w_class = ITEM_SIZE_HUGE
	canhear_range = 6
	power_usage = 8

/obj/item/rig/unathi/rawl

	initial_modules = list(
		/obj/item/rig_module/mounted/plasmacutter,
		/obj/item/rig_module/device/drill,
		/obj/item/rig_module/device/orescanner,
		/obj/item/rig_module/vision/meson,
		)

/obj/item/clothing/head/helmet/space/void/dohruk/
	name = "\improper Unathi helmet"
	desc = "A bulky helmet with padding to protect from the collisions wearing this can cause."
	species_restricted = list(SPECIES_UNATHI)
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SHIELDED
		)
	icon_state = "rig0-dohruk"
	item_state = "dohruk_helm"

/obj/item/clothing/head/helmet/space/void/dohruk/heavy
	name = "heavy Unathi helmet"
	desc = "A thick helmet for the intellectual who needs to headbutt people safely."
	armor = list(
		melee = ARMOR_MELEE_VERY_HIGH,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SHIELDED
		)
	siemens_coefficient = 0.3
	icon_state = "rig0-dohrukheavy"
	item_state = "dohruk_heavy_helm"
	max_pressure_protection = ENG_VOIDSUIT_MAX_PRESSURE

/obj/item/clothing/suit/space/void/dohruk/
	name = "\improper Unathi voidsuit"
	desc = "A dull voidsuit with thick but uneven padding. Perfect for those lacking other options."
	species_restricted = list(SPECIES_UNATHI)
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SHIELDED
		)
	icon_state = "rig-dohruk"

/obj/item/clothing/suit/space/void/dohruk/heavy
	name = "heavy Unathi voidsuit"
	desc = "This suit tries to compensate for poor material quality with flashes of color and excessive padding."
	species_restricted = list(SPECIES_UNATHI)
	armor = list(
		melee = ARMOR_MELEE_VERY_HIGH,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SHIELDED
		)
	siemens_coefficient = 0.3
	icon_state = "rig-dohrukheavy"
	max_pressure_protection = ENG_VOIDSUIT_MAX_PRESSURE

/obj/item/clothing/suit/space/void/dohruk/prepared
	helmet = /obj/item/clothing/head/helmet/space/void/dohruk
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen

/obj/item/clothing/suit/space/void/dohruk/heavy/prepared
	helmet = /obj/item/clothing/head/helmet/space/void/dohruk/heavy
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen

/obj/item/clothing/suit/space/void/dohruk/heavy/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 2