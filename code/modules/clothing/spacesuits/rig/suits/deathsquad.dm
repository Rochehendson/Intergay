// * BOS | Deathsquad's overpowered rigs |
// * ----+-------------------------------+


// * Section: abstracted deathsquad's hardsuit
// ! Please note that only humans can wear this rig
// ? Maybe we should remove thermals
// TODO Add access restrictions - everyone can wear this rigs


/obj/item/clothing/head/helmet/space/rig/deathsquad
	icon = 'icons/bos/obj/clothing/rigs/helmets.dmi'
	light_overlay = "explorer_light"
	species_restricted = list(SPECIES_HUMAN)
	sprite_sheets = list(SPECIES_HUMAN = 'icons/bos/mob/species/human/onmob_head.dmi')


/obj/item/clothing/gloves/rig/deathsquad
	icon = 'icons/bos/obj/clothing/rigs/gauntlets.dmi'
	item_flags = ITEM_FLAG_THICKMATERIAL | ITEM_FLAG_NOCUFFS | ITEM_FLAG_AIRTIGHT
	siemens_coefficient = 0
	species_restricted = list(SPECIES_HUMAN)
	sprite_sheets = list(SPECIES_HUMAN = 'icons/bos/mob/species/human/onmob_hands.dmi')


/obj/item/clothing/suit/space/rig/deathsquad
	icon = 'icons/bos/obj/clothing/rigs/chestplates.dmi'
	species_restricted = list(SPECIES_HUMAN)
	allowed = list(
		/obj/item/device/flashlight,
		/obj/item/tank,
		/obj/item/device/suit_cooling_unit,
		/obj/item/gun,
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/melee/baton,
		/obj/item/melee/energy/sword,
		/obj/item/handcuffs
	)
	sprite_sheets = list(SPECIES_HUMAN = 'icons/bos/mob/species/human/onmob_suit.dmi')


/obj/item/clothing/shoes/magboots/rig/deathsquad
	icon = 'icons/bos/obj/clothing/rigs/boots.dmi'
	species_restricted = list(SPECIES_HUMAN)
	sprite_sheets = list(SPECIES_HUMAN = 'icons/bos/mob/species/human/onmob_shoes.dmi')


/obj/item/rig/deathsquad
	name = "hardsuit control module"
	desc = "Grey hardsuit control module with its own special purpose"
	icon = 'icons/bos/obj/rig_modules.dmi'
	icon_state = "skulls"

	species_icon_override = 'icons/bos/mob/onmob/onmob_rigs.dmi'
	item_state_slots = list(slot_back_str = "hidden")  // ? Ask Coiscin to draw state for this slot

	helm_type =  /obj/item/clothing/head/helmet/space/rig/deathsquad
	glove_type = /obj/item/clothing/gloves/rig/deathsquad
	chest_type = /obj/item/clothing/suit/space/rig/deathsquad
	boot_type =  /obj/item/clothing/shoes/magboots/rig/deathsquad
	cell_type = /obj/item/cell/hyper

	armor = list(
		melee = ARMOR_MELEE_VERY_HIGH,
		bullet = ARMOR_BALLISTIC_AP,
		laser = ARMOR_LASER_RIFLES,
		energy = ARMOR_ENERGY_STRONG,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SHIELDED
	)

	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/chem_dispenser/combat,
		/obj/item/rig_module/cooling_unit,
		/obj/item/rig_module/datajack,
		/obj/item/rig_module/device/rcd,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/mounted/egun,
		/obj/item/rig_module/mounted/plasmacutter,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/vision/multi
	)


// * Section: Skulls - LSS's deathsquad
// ! The field icon_state is directly inherited from the parent class


/obj/item/rig/deathsquad/lss
	name = "skull's hardsuit control module"
	desc = "A hard suit belonging to the member of Skull Squad, an elite unit of the Lordanian Sovereign Systems"
	suit_type = "skull's hardsuit"

/obj/item/rig/deathsquad/lss/lead
	name = "skull's leader hardsuit control module"
	desc = "A hard suit belonging to the leader of Skull Squad, an elite unit of the Lordanian Sovereign Systems"
	suit_type = "skull's leader hardsuit"
	icon_state = "skulls_lead"
