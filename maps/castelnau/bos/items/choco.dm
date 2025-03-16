/obj/item/reagent_containers/food/snacks/chocomedal
	name = "chocolate medal"
	desc = "For a true Lordanian hero."
	icon = 'maps/torch/bos/icons/obj/items/choco.dmi'
	icon_state = "choco"
	filling_color = "#e00d34"
	center_of_mass = "x=16;y=16"
	bitesize = 4
/obj/item/reagent_containers/food/snacks/chocomedal/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment/protein = 3, /datum/reagent/sugar = 4)