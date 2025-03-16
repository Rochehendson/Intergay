/datum/gear/accessory/custom_ribbon
	display_name = "custom ribbon"
	description = "A military decoration awarded to personnel for significant (or not) accomplishments."
	path = /obj/item/clothing/accessory/ribbon/lordan/custom
	cost = 2

/datum/gear/accessory/custom_ribbon/color
	display_name = "custom ribbon, colorable"
	path = /obj/item/clothing/accessory/ribbon/lordan/custom/color
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/accessory/armband_ma
	display_name = "master-at-arms brassard"
	path = /obj/item/clothing/accessory/armband/lordan/ma
	allowed_roles = SECURITY_ROLES

/datum/gear/accessory/armband_mp
	display_name = "military police brassard"
	path = /obj/item/clothing/accessory/armband/lordan/mp
	allowed_roles = SECURITY_ROLES

/datum/gear/accessory/smc_patch
	display_name = "Marine Corps patch"
	path = /obj/item/clothing/accessory/lordan/smc_patch
	allowed_branches = list(/datum/mil_branch/larmarine)
	cost = 0
	whitelisted = list(SPECIES_HUMAN, SPECIES_IPC)

/datum/gear/accessory/smc_patch_xenos
	display_name = "Marine Corps patch (xenoic division)"
	path = /obj/item/clothing/accessory/lordan/smc_patch/xeno
	cost = 0
	allowed_branches = list(/datum/mil_branch/larmarine)

/datum/gear/tactical/civ_tag
	display_name = "Civilian tag"
	path = /obj/item/clothing/accessory/armor_tag/civ
	allowed_branches = CIVILIAN_BRANCHES
/*
/datum/gear/tactical/med_tag
	display_name = "Medical tag"
	path = /obj/item/clothing/accessory/armor_tag/solgov/medic
	allowed_skills = list(SKILL_MEDICAL = SKILL_BASIC)
*/
/datum/gear/tactical/med_tag_alt
	display_name = "Medical tag, alt"
	path = /obj/item/clothing/accessory/armor_tag/civ/med

/datum/gear/accessory/tags/marine
	display_name = "dog tags, lordanian marine corps"
	description = "Plain identification tags made from a durable metal. This one is issued to marines."
	path = /obj/item/clothing/accessory/badge/lordan/tags/marine
	allowed_branches = list(/datum/mil_branch/larmarine)
	cost = 0

/datum/gear/accessory/tags/fleet
	display_name = "dog tags, lordanian fleet"
	description = "Plain identification tags made from a durable metal. This one is issued to fleet."
	path = /obj/item/clothing/accessory/badge/lordan/tags/fleet
	allowed_branches = list(/datum/mil_branch/larfleet)
	cost = 0

// Separating main's certain armor customization items.
/datum/gear/tactical/blood_patch
	display_name = "blood patch selection"
	description = "A selection of blood type patches. Attaches to plate carrier."
	path = /obj/item/clothing/accessory/armor_tag
	cost = 0 // Life-saving.

/datum/gear/tactical/blood_patch/New()
	..()
	var/blood_type = list()
	blood_type["A+"] = /obj/item/clothing/accessory/armor_tag/apos
	blood_type["A-"] = /obj/item/clothing/accessory/armor_tag/aneg
	blood_type["B+"] = /obj/item/clothing/accessory/armor_tag/bpos
	blood_type["B-"] = /obj/item/clothing/accessory/armor_tag/bneg
	blood_type["AB+"] = /obj/item/clothing/accessory/armor_tag/abpos
	blood_type["AB-"] = /obj/item/clothing/accessory/armor_tag/abneg
	blood_type["O+"] = /obj/item/clothing/accessory/armor_tag/opos
	blood_type["O-"] = /obj/item/clothing/accessory/armor_tag/oneg
	gear_tweaks += new/datum/gear_tweak/path(blood_type)

// Armor plates
/datum/gear/tactical/armor_plate_light
	display_name = "armor plate - light"
	description = "A light armor plate to be slipped into a plate carrier"
	path = /obj/item/clothing/accessory/armor_plate
	cost = 3
	allowed_branches = MILITARY_BRANCHES

/datum/gear/tactical/armor_plate_medium
	display_name = "armor plate - medium"
	description = "A medium armor plate to be slipped into a plate carrier"
	path = /obj/item/clothing/accessory/armor_plate/medium
	cost = 4
	allowed_roles = ARMORED_ROLES


/// Limb guards
// Arms
/datum/gear/tactical/arm_guards
	display_name = "armor | arm guards selection"
	description = "A selection of military arm guards. Attaches to plate carrier."
	path = /obj/item/clothing/accessory/arm_guards
	cost = 2
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/arm_guards/New()
	..()
	var/arm_guards = list()
	arm_guards["black arm guards"] = /obj/item/clothing/accessory/arm_guards
	arm_guards["navy arm guards"] = /obj/item/clothing/accessory/arm_guards/navy
	arm_guards["blue arm guards"] = /obj/item/clothing/accessory/arm_guards/blue
	arm_guards["green arm guards"] = /obj/item/clothing/accessory/arm_guards/green
	arm_guards["tan arm guards"] = /obj/item/clothing/accessory/arm_guards/tan
	gear_tweaks += new/datum/gear_tweak/path(arm_guards)

/datum/gear/tactical/arm_guards_light_fleet
	display_name = "armor | arm pads (LSS fleet)"
	description = "A navy-colored arm pads. They're weaker than normal guards."
	path = /obj/item/clothing/accessory/arm_guards/light/navy
	allowed_branches = MILITARY_BRANCHES

/datum/gear/tactical/arm_guards_light
	display_name = "armor | arm pads selection"
	description = "A selection of military arm pads. They're weaker than normal guards."
	path = /obj/item/clothing/accessory/arm_guards/light
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/arm_guards_light/New()
	..()
	var/arm_guards = list()
	arm_guards["black arm pads"] = /obj/item/clothing/accessory/arm_guards/light
	arm_guards["navy arm pads"] = /obj/item/clothing/accessory/arm_guards/light/navy
	arm_guards["blue arm pads"] = /obj/item/clothing/accessory/arm_guards/light/blue
	arm_guards["green arm pads"] = /obj/item/clothing/accessory/arm_guards/light/green
	arm_guards["tan arm pads"] = /obj/item/clothing/accessory/arm_guards/light/tan
	arm_guards["grey arm pads"] = /obj/item/clothing/accessory/arm_guards/light/grey
	gear_tweaks += new/datum/gear_tweak/path(arm_guards)


// Legs
/datum/gear/tactical/leg_guards
	display_name = "armor | leg guards selection"
	description = "A selection of military leg guards. Attaches to plate carrier."
	path = /obj/item/clothing/accessory/leg_guards
	cost = 2
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/leg_guards/New()
	..()
	var/leg_guards = list()
	leg_guards["black leg guards"] = /obj/item/clothing/accessory/leg_guards
	leg_guards["navy leg guards"] = /obj/item/clothing/accessory/leg_guards/navy
	leg_guards["blue leg guards"] = /obj/item/clothing/accessory/leg_guards/blue
	leg_guards["green leg guards"] = /obj/item/clothing/accessory/leg_guards/green
	leg_guards["tan leg guards"] = /obj/item/clothing/accessory/leg_guards/tan
	gear_tweaks += new/datum/gear_tweak/path(leg_guards)

/datum/gear/tactical/leg_guards_light_fleet
	display_name = "armor | leg pads (LSS fleet)"
	description = "A navy-colored leg pads. They're weaker than normal guards."
	path = /obj/item/clothing/accessory/leg_guards/light/navy
	allowed_branches = MILITARY_BRANCHES

/datum/gear/tactical/leg_guards_light
	display_name = "armor | leg pads selection"
	description = "A selection of military leg pads. They're weaker than normal guards."
	path = /obj/item/clothing/accessory/leg_guards/light
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/leg_guards_light/New()
	..()
	var/leg_guards = list()
	leg_guards["black leg pads"] = /obj/item/clothing/accessory/leg_guards/light
	leg_guards["navy leg pads"] = /obj/item/clothing/accessory/leg_guards/light/navy
	leg_guards["blue leg pads"] = /obj/item/clothing/accessory/leg_guards/light/blue
	leg_guards["green leg pads"] = /obj/item/clothing/accessory/leg_guards/light/green
	leg_guards["tan leg pads"] = /obj/item/clothing/accessory/leg_guards/light/tan
	leg_guards["grey leg pads"] = /obj/item/clothing/accessory/leg_guards/light/grey
	gear_tweaks += new/datum/gear_tweak/path(leg_guards)

/datum/gear/tactical/combatknife
	display_name = "combat knife"
	path = /obj/item/material/knife/combat
	cost = 3
	allowed_roles = ARMORED_ROLES

// Too lazy to adjust outfit
/datum/gear/accessory/nt_blaze
	display_name = "blaze, janitor"
	path = /obj/item/clothing/accessory/lordan/specialty/janitor
	allowed_roles = list(/datum/job/janitor)
	cost = 0

/datum/gear/accessory/nt_blaze/brig
	display_name = "blaze, brig chief"
	path = /obj/item/clothing/accessory/lordan/specialty/brig
	allowed_roles = list(/datum/job/warden)

/datum/gear/accessory/nt_blaze/detective
	display_name = "blaze, forenscics"
	path = /obj/item/clothing/accessory/lordan/specialty/forensic
	allowed_roles = list(/datum/job/detective)

/datum/gear/accessory/nt_blaze/atmos
	display_name = "blaze, atmospherics"
	path = /obj/item/clothing/accessory/lordan/specialty/atmos
	allowed_roles = ENGINEERING_ROLES

/datum/gear/accessory/nt_blaze/chemist
	display_name = "blaze, chemist"
	path = /obj/item/clothing/accessory/lordan/specialty/chemist
	allowed_roles = list(/datum/job/chemist)

/datum/gear/accessory/nt_blaze/counselor
	display_name = "blaze, counselor"
	path = /obj/item/clothing/accessory/lordan/specialty/counselor
	allowed_roles = list(/datum/job/psychiatrist)

/datum/gear/clothing/cloak
	display_name = "cloak, colored"
	path = /obj/item/clothing/accessory/cloak
	slot = slot_wear_suit
	flags = GEAR_HAS_COLOR_SELECTION

// Alternative cloak
/datum/gear/clothing/cloak/alt
	display_name = "cloak, colored (alt)"
	path = /obj/item/clothing/accessory/cloak/boh
