/datum/gear/uniform/roboticist_skirt
	allowed_roles = list(/datum/job/scientist)

/datum/gear/uniform/camo
	display_name = "camouflage outfit"
	path = /obj/item/clothing/under/camo

/datum/gear/uniform/utility
	display_name = "Contractor Utility Uniform"
	path = /obj/item/clothing/under/solgov/utility

/datum/gear/uniform/avalonselection
	display_name = "Avalon uniform selection"
	path = /obj/item/clothing/under

/datum/gear/uniform/avalonselection/New()
	..()
	var/avalon = list()
	avalon += /obj/item/clothing/under/avalon
	avalon += /obj/item/clothing/under/avalon1
	avalon += /obj/item/clothing/under/avalon2
	gear_tweaks += new/datum/gear_tweak/path/specified_types_list(avalon)