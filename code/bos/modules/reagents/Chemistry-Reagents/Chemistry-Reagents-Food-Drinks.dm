/datum/reagent/drink/compote
	name = "Compote"
	description = "Traditional Terran drink. Grandma would be proud."
	taste_description = "Love of Terra"
	color = "#9e4b00"

	glass_name = "Compote"
	glass_desc = "Traditional Terran drink. Grandma would be proud."

/obj/item/reagent_containers/food/snacks/dumpling
	name = "\improper meat dumplings"
	desc = "Raw meat appetizer, native to Terra."
	icon = 'icons/bos/obj/food.dmi'
	icon_state = "pelmeni"
	filling_color = "#ffffff"
	center_of_mass = "x=16;y=16"
	bitesize = 2
/obj/item/reagent_containers/food/snacks/dumpling/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 5)

/obj/item/reagent_containers/food/snacks/boileddumplings
	name = "\improper boiled dumplings"
	desc = "A dish consisting of boiled pieces of meat wrapped in dough. Delicious!"
	icon = 'icons/bos/obj/food.dmi'
	icon_state = "pelmeni_boiled"
	filling_color = "#ffffff"
	center_of_mass = "x=16;y=16"
	bitesize = 2
/obj/item/reagent_containers/food/snacks/dumpling/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 30)
