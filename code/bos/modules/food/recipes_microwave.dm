/datum/recipe/pelmeni
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice,
		/obj/item/reagent_containers/food/snacks/doughslice,
		/obj/item/reagent_containers/food/snacks/rawmeatball
	)
	result = /obj/item/reagent_containers/food/snacks/dumpling

/datum/recipe/pelmeniboiled
	reagents = list(/datum/reagent/water = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/dumpling,
		/obj/item/reagent_containers/food/snacks/dumpling,
		/obj/item/reagent_containers/food/snacks/dumpling,
		/obj/item/reagent_containers/food/snacks/dumpling,
		/obj/item/reagent_containers/food/snacks/dumpling
	)
	result = /obj/item/reagent_containers/food/snacks/boileddumplings