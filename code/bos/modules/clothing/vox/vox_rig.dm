/obj/item/clothing/head/helmet/space/rig/vox_rig_inq
	icon = 'icons/bos/obj/clothing/species/vox/obj_head_vox.dmi'
	icon_override = 'icons/bos/mob/onmob/species/vox/onmob_head_vox.dmi'
	icon_state = "vox_rig_inq"
	species_restricted = list(SPECIES_VOX)
	item_flags = 0
	flags_inv = 0

/obj/item/clothing/suit/space/rig/vox_rig_inq
	icon = 'icons/bos/obj/clothing/species/vox/obj_suit_vox.dmi'
	icon_override = 'icons/bos/mob/onmob/species/vox/onmob_suit_vox.dmi'
	icon_state = "vox_rig_inq"
	species_restricted = list(SPECIES_VOX)
	allowed = list(
		/obj/item/device/flashlight,
		/obj/item/tank,
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine/shotholder,
		/obj/item/handcuffs,
		/obj/item/device/radio,
		/obj/item/melee/baton,
		/obj/item/gun,
		/obj/item/pickaxe
	)

/obj/item/clothing/shoes/magboots/rig/vox_rig_inq
	icon = 'icons/bos/obj/clothing/species/vox/obj_feet_vox.dmi'
	icon_override = 'icons/bos/mob/onmob/species/vox/onmob_feet_vox.dmi'
	icon_state = "vox_rig_inq"
	species_restricted = list(SPECIES_VOX)

/obj/item/clothing/gloves/rig/vox_rig_inq
	icon = 'icons/bos/obj/clothing/species/vox/obj_hands_vox.dmi'
	icon_override = 'icons/bos/mob/onmob/species/vox/onmob_hands_vox.dmi'
	icon_state = "vox_rig_inq"
	species_restricted = list(SPECIES_VOX)
	siemens_coefficient = 0

/obj/item/clothing/head/helmet/space/rig/vox_rig_breacher
	icon = 'icons/bos/obj/clothing/species/vox/obj_head_vox.dmi'
	icon_override = 'icons/bos/mob/onmob/species/vox/onmob_head_vox.dmi'
	icon_state = "vox_rig_breacher"
	species_restricted = list(SPECIES_VOX)
	item_flags = 0
	flags_inv = 0

/obj/item/clothing/suit/space/rig/vox_rig_breacher
	icon = 'icons/bos/obj/clothing/species/vox/obj_suit_vox.dmi'
	icon_override = 'icons/bos/mob/onmob/species/vox/onmob_suit_vox.dmi'
	icon_state = "vox_rig_breacher"
	species_restricted = list(SPECIES_VOX)
	allowed = list(
		/obj/item/device/flashlight,
		/obj/item/tank,
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine/shotholder,
		/obj/item/handcuffs,
		/obj/item/device/radio,
		/obj/item/melee/baton,
		/obj/item/gun,
		/obj/item/pickaxe
	)

/obj/item/clothing/shoes/magboots/rig/vox_rig_breacher
	icon = 'icons/bos/obj/clothing/species/vox/obj_feet_vox.dmi'
	icon_override = 'icons/bos/mob/onmob/species/vox/onmob_feet_vox.dmi'
	icon_state = "vox_rig_breacher"
	species_restricted = list(SPECIES_VOX)

/obj/item/clothing/gloves/rig/vox_rig_breacher
	icon = 'icons/bos/obj/clothing/species/vox/obj_hands_vox.dmi'
	icon_override = 'icons/bos/mob/onmob/species/vox/onmob_hands_vox.dmi'
	icon_state = "vox_rig_breacher"
	species_restricted = list(SPECIES_VOX)
	siemens_coefficient = 0

// RIG modules
/obj/item/gun/energy/gun/mounted/darkmatter
	projectile_type = /obj/item/projectile/beam/stun/darkmatter
	init_firemodes = list(
		list(mode_name="stunning", burst=1, fire_delay=null, move_delay=null, burst_accuracy=list(30), dispersion=null, projectile_type=/obj/item/projectile/beam/stun/darkmatter, charge_cost = 50),
		list(mode_name="focused", burst=1, fire_delay=null, move_delay=null, burst_accuracy=list(30), dispersion=null, projectile_type=/obj/item/projectile/beam/darkmatter, charge_cost = 75),
		list(mode_name="scatter burst", burst=8, fire_delay=null, move_delay=4, burst_accuracy=list(0, 0, 0, 0, 0, 0, 0, 0), dispersion=list(0, 1, 2, 2, 3, 3, 3, 3, 3), projectile_type=/obj/item/projectile/energy/darkmatter, charge_cost = 10),
	)

/obj/item/rig_module/mounted/darkmatter
	name = "darkmatter cannon"
	desc = "A portable darkmatter generator with three firemodes"
	interface_name = "darkmatter cannon"
	interface_desc = "A portable darkmatter generator with three firemodes"
	suit_overlay_active = "darkmatter"
	icon = 'icons/bos/obj/clothing/species/vox/obj_rig_vox.dmi'
	icon_state = "darkmatter"
	gun = /obj/item/gun/energy/gun/mounted/darkmatter

/obj/item/rig_module/mounted/plasmacutter/darkmatter
	name = "plasmacutter"
	desc = "A portable darkmatter plasmacutter"
	interface_name = "plasmacutter"
	interface_desc = "A portable darkmatter plasmacutter"
	icon = 'icons/bos/obj/clothing/species/vox/obj_rig_vox.dmi'
	icon_state = "plasmacutter"
	suit_overlay_active = "plasmacutter"

/obj/item/rig_module/vision/darkmatter
	vision_modes = list(
		/datum/rig_vision/nvg,
		/datum/rig_vision/meson
	)

/obj/item/rig/vox/inq
	name = "inquisitor rig control module"
	desc = "A strange purple the thing, as if from the nightmares of a psychopath with schizophrenia. A thousand legs are moving, they clearly make it clear that it is alive and extremely unfriendly. It is these rigs that envelop the bodies of the Inquisition of the New Empire, so that they simultaneously instill the fire of their faith into the hearts of their brethren, and inspire animal fear to their enemies..However, if you look closely, you can see how Kighakiki is scratched on the chitin."
	suit_type = "alien rig"
	icon = 'icons/bos/obj/clothing/species/vox/obj_rig_vox.dmi'
	icon_override = 'icons/bos/mob/onmob/species/vox/onmob_rig_back_vox.dmi'
	icon_state = "vox_rig_inq"
	equipment_overlay_icon = 'icons/bos/mob/onmob/species/vox/onmob_rig_back_vox.dmi'
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SHIELDED
		)
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	max_pressure_protection = FIRESUIT_MAX_PRESSURE

	chest_type = /obj/item/clothing/suit/space/rig/vox_rig_inq
	helm_type = /obj/item/clothing/head/helmet/space/rig/vox_rig_inq
	boot_type = /obj/item/clothing/shoes/magboots/rig/vox_rig_inq
	glove_type = /obj/item/clothing/gloves/rig/vox_rig_inq
	air_type =     /obj/item/tank/nitrogen

	online_slowdown = 0.5

	initial_modules = list(
		/obj/item/rig_module/vision/darkmatter,
		/obj/item/rig_module/mounted/plasmacutter/darkmatter,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/teleporter,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/cooling_unit
		)

/obj/item/rig/vox/breacher
	name = "breacher control module"
	desc = "A strange purple the thing, as if from the nightmares of a psychopath with schizophrenia. A thousand legs are moving, they clearly make it clear that it is alive and extremely unfriendly. It is these rigs that envelop the bodies of the Inquisition of the New Empire, so that they simultaneously instill the fire of their faith into the hearts of their brethren, and inspire animal fear to their enemies..However, if you look closely, you can see how Ciharica is scratched on the chitin."
	suit_type = "alien rig"
	icon = 'icons/bos/obj/clothing/species/vox/obj_rig_vox.dmi'
	icon_override = 'icons/bos/mob/onmob/species/vox/onmob_rig_back_vox.dmi'
	icon_state = "vox_rig_breacher"
	equipment_overlay_icon = 'icons/bos/mob/onmob/species/vox/onmob_rig_back_vox.dmi'
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SHIELDED
		)
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	max_pressure_protection = FIRESUIT_MAX_PRESSURE

	chest_type = /obj/item/clothing/suit/space/rig/vox_rig_breacher
	helm_type = /obj/item/clothing/head/helmet/space/rig/vox_rig_breacher
	boot_type = /obj/item/clothing/shoes/magboots/rig/vox_rig_breacher
	glove_type = /obj/item/clothing/gloves/rig/vox_rig_breacher
	air_type =     /obj/item/tank/nitrogen

	online_slowdown = 0.6

	initial_modules = list(
		/obj/item/rig_module/vision/darkmatter,
		/obj/item/rig_module/mounted/plasmacutter/darkmatter,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/teleporter,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/cooling_unit
		)