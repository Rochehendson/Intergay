/datum/gear/fr_paroled
	sort_category = "|F| Alt-Hired"
	category = /datum/gear/fr_paroled

/datum/gear/fr_paroled/razor
	display_name = "razor"
	path = /obj/item/material/knife/bos/razor
	allowed_branches = ALTH
	cost = 3

/datum/gear/fr_paroled/balisong
	display_name = "butterfly knife"
	path = /obj/item/material/knife/folding/combat/balisong
	allowed_branches = ALTH
	cost = 5

/datum/gear/fr_paroled/swtichblade
	display_name = "switchblade"
	path = /obj/item/material/knife/folding/combat/switchblade
	allowed_branches = ALTH
	cost = 5

/datum/gear/fr_paroled/jackets
	display_name = "badass jacket selection"
	description = "A selection of badass jackets"
	path = /obj/item/clothing/suit/storage/par
	cost = 1
	slot = slot_wear_suit
	allowed_branches = ALTH

/datum/gear/fr_paroled/jackets/New()
	..()
	var/jackets = list()
	jackets["police jacket"] = /obj/item/clothing/suit/storage/par/pol
	jackets["black jacket"] = /obj/item/clothing/suit/storage/par/black
	jackets["wastelander jacket"] = /obj/item/clothing/suit/storage/par/wastelander
	gear_tweaks += new/datum/gear_tweak/path(jackets)