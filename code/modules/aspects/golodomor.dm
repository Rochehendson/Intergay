/datum/round_aspect/golodomor
	name = "Голодомор"
	chance = 30
	weight = ASPECT_WEIGHT_GOLODOMOR
	announce_text = "<span class=\"info\">На нашем судне произошло нечто ужасное... Все сожрали! Еды почти не осталось! И как нам быть?..</span>"
	var/list/allfood

/datum/round_aspect/golodomor/New()
	. = ..()
	allfood += typesof(/obj/item/reagent_containers/food)
	allfood += typesof(/obj/item/clothing/mask/chewable)
	allfood += typesof(/obj/item/storage/chewables)
	allfood += /obj/item/storage/fancy/egg_box

/datum/round_aspect/golodomor/get_desc_msg()
	return SPAN_WARNING("Большая часть еды на корабле пропала. Удачи.")

/datum/round_aspect/golodomor/do_preload_thing()
	. = ..()
	SSsupply.change_price_for(/decl/hierarchy/supply_pack/galley, rand(10,13))

	for(var/obj/item/reagent_containers/food/food in world)
		if(prob(20) || !is_station_area(get_area(food)))
			continue
		qdel(food)

	for(var/obj/item/clothing/mask/chewable/food in world)
		if(prob(20) || !is_station_area(get_area(food)))
			continue
		qdel(food)

	for(var/obj/item/storage/chewables/food in world)
		if(prob(20) || !is_station_area(get_area(food)))
			continue
		qdel(food)

	for(var/obj/machinery/vending/vendomat in world)
		if(!is_station_area(get_area(vendomat)))
			continue
		QDEL_NULL_LIST(vendomat.product_records)
		vendomat.product_records	= list()
		for(var/i in vendomat.products)
			if(i in allfood)
				vendomat.products[i] = 0

		vendomat.build_inventory(TRUE, prob(20))
