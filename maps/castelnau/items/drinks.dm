/datum/reagent/ethanol/cider
	name = "Cider"
	description = "A refreshing beverage."
	taste_description = "apples and some alcohol"
	reagent_state = LIQUID
	color = "#ffea73"
	strength = 50

	glass_name = "Cider"
	glass_desc = "A glass of refreshing cider."

/obj/item/weapon/reagent_containers/food/drinks/cans/cider
	name = "\improper Cyber Fox Cider"
	desc = "A can of Cyber Fox brand cider."
	icon = 'maps/castelnau/icons/obj/drinks.dmi'
	item_icons = list(slot_r_hand_str = 'maps/castelnau/icons/mob/righthand.dmi',
					  slot_l_hand_str = 'maps/castelnau/icons/mob/lefthand.dmi')
	icon_state = "cider"
	item_state = "cider"
	center_of_mass = "x=16;y=10"

/obj/item/weapon/reagent_containers/food/drinks/cans/cider/New()
	..()
	reagents.add_reagent(/datum/reagent/ethanol/cider, 30)
