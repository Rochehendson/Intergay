/obj/item/storage/messenger
	name = "messenger bag"
	desc = "A small green-grey messenger bag with a blue Corvid Couriers logo on it."
	icon = 'icons/mob/simple_animal/crow.dmi'
	icon_state = "messenger_bag"
	storage_slots = 7
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_SMALL

/mob/living/simple_animal/crow
	name = "crow"
	desc = "A large crow. Caw caw."
	icon = 'icons/mob/simple_animal/crow.dmi'
	icon_state = "crow"
	icon_living = "crow"
	icon_dead = "crow_dead"
	pass_flags = PASS_FLAG_TABLE
	mob_size = MOB_SMALL
	density = FALSE

	speak_emote = list("caws")

	natural_weapon = /obj/item/natural_weapon/crow_claws

	response_help  = "pets"
	response_disarm = "gently moves aside"
	response_harm   = "swats"
	universal_speak = TRUE
	pass_flags = PASS_FLAG_TABLE

	var/obj/item/storage/messenger/messenger_bag
	var/obj/item/card/id/access_card

	say_list_type = /datum/say_list/crow

/obj/item/natural_weapon/crow_claws
	name = "claws"
	gender = PLURAL
	attack_verb = list("clawed")
	sharp = TRUE
	force = 7

/mob/living/simple_animal/crow/New()
	..()
	messenger_bag = new(src)
	update_icon()

/mob/living/simple_animal/crow/GetIdCard()
	return access_card

/mob/living/simple_animal/crow/show_inv(var/mob/user)
	if(user.incapacitated())
		return
	var/list/dat = list()
	if(access_card)
		dat += "<b>ID:</b> [access_card] (<a href='byond://?src=\ref[src];remove_inv=access cuff'>Remove</a>)"
	else
		dat += "<b>ID:</b> <a href='byond://?src=\ref[src];add_inv=access cuff'>Nothing</a>"
	if(messenger_bag)
		dat += "<b>Back:</b> [messenger_bag] (<a href='byond://?src=\ref[src];remove_inv=back'>Remove</a>)"
	else
		dat += "<b>Back:</b> <a href='byond://?src=\ref[src];add_inv=back'>Nothing</a>"
	var/datum/browser/popup = new(user, "[name]", "Inventory of \the [name]", 350, 150, src)
	popup.set_content(jointext(dat, "<br>"))
	popup.open()

/mob/living/simple_animal/crow/DefaultTopicState()
	return GLOB.physical_state

/mob/living/simple_animal/crow/OnTopic(mob/user, href_list)
	if(!ishuman(user))
		return ..()
	if(href_list["remove_inv"])
		var/obj/item/removed
		switch(href_list["remove_inv"])
			if("access cuff")
				removed = access_card
				access_card = null
			if("back")
				removed = messenger_bag
				messenger_bag = null
		if(removed)
			removed.dropInto(loc)
			usr.put_in_hands(removed)
			visible_message("<span class='notice'>\The [usr] removes \the [removed] from \the [src]'s [href_list["remove_inv"]].</span>")
			show_inv(usr)
			update_icon()
		else
			to_chat(user, "<span class='warning'>There is nothing to remove from \the [src]'s [href_list["remove_inv"]].</span>")
		return TOPIC_HANDLED
	if(href_list["add_inv"])
		var/obj/item/equipping = user.get_active_hand()
		if(!equipping)
			to_chat(user, "<span class='warning'>You have nothing in your hand to put on \the [src]'s [href_list["add_inv"]].</span>")
			return 0
		var/obj/item/equipped
		var/checktype
		switch(href_list["add_inv"])
			if("access cuff")
				equipped = access_card
				checktype = /obj/item/card/id
			if("back")
				equipped = messenger_bag
				checktype = /obj/item/storage/messenger
		if(equipped)
			to_chat(user, "<span class='warning'>There is already something worn on \the [src]'s [href_list["add_inv"]].</span>")
			return TOPIC_HANDLED
		if(!istype(equipping, checktype))
			to_chat(user, "<span class='warning'>\The [equipping] won't fit on \the [src]'s [href_list["add_inv"]].</span>")
			return TOPIC_HANDLED
		switch(href_list["add_inv"])
			if("access cuff")
				access_card = equipping
			if("back")
				messenger_bag = equipping
		if(!user.unEquip(equipping, src))
			return TOPIC_HANDLED
		visible_message("<span class='notice'>\The [user] places \the [equipping] on to \the [src]'s [href_list["add_inv"]].</span>")
		update_icon()
		show_inv(user)
		return TOPIC_HANDLED
	return ..()

/mob/living/simple_animal/crow/examine(mob/user)
	. = ..()
	if(Adjacent(src))
		if(messenger_bag)
			if(messenger_bag.contents.len)
				to_chat(user, "It's wearing a little messenger bag with a Corvid Couriers logo on it. There's something stuffed inside.")
			else
				to_chat(user, "It's wearing a little messenger bag with a Corvid Couriers logo on it. It seems to be empty.")
		if(access_card)
			to_chat(user, "It has an access cuff with \the [access_card] inserted.")

/mob/living/simple_animal/crow/on_update_icon()
	..()
	overlays -= "bag"
	overlays -= "bag_dead"
	if(messenger_bag)
		if(icon_state != icon_dead)
			overlays |= "bag"
		else
			overlays |= "bag_dead"

/mob/living/simple_animal/crow/cyber
	name = "cybercrow"
	desc = "A large cybercrow. k4w k4w."
	speak_emote = list("beeps")

/mob/living/simple_animal/crow/cyber/on_update_icon()
	..()
	overlays -= "cyber"
	overlays -= "cyber_dead"
	if(icon_state != icon_dead)
		overlays |= "cyber"
	else
		overlays |= "cyber_dead"

/datum/say_list/crow
	speak = list("Caw.", "Caw?", "Caw!", "CAW.")
	emote_hear = list("caws")
	emote_see = list("hops")
