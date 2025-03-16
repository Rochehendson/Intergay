/mob/living/simple_animal/passive/cat/caracal
	name = "space caracal"
	desc = "A caracal with very floppy ears."
	icon = 'icons/bos/mob/cat.dmi'
	icon_state = "floppa"
	item_state = "floppa"
	icon_living = "floppa"
	icon_dead = "floppa_dead"
	speak_emote = list("шлёпает ушами")
	ai_holder = /datum/ai_holder/simple_animal/passive/caracal
	say_list_type = /datum/say_list/caracal

/datum/ai_holder/simple_animal/passive/caracal
	can_flee = TRUE

/datum/say_list/caracal
	emote_hear = list("yawn", "lick his paws")
	emote_see = list("shakes his head", "flop his ears")


/mob/living/simple_animal/passive/cat/caracal/grisha
	name = "Bolshoy Grigoriy"
	desc = "That's Bolshoy Grigoriy, a big Terran cat. His mere presence inspires fear."
	mob_size = MOB_LARGE

/mob/living/simple_animal/passive/cat/caracal/grisha/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/reagent_containers/food/snacks/dumpling) && (src.health != 0))
		set_dir(get_dir(src, user))
		qdel(W)
		visible_emote(pick("eat dumpling with big joy!",
						   "eat dumpling and lick his lips!",
						   "eat dumpling and fast flop with his ears!"))
	if(istype(W, /obj/item/reagent_containers/food/snacks/boileddumplings) && (src.health != 0))
		set_dir(get_dir(src, user))
		qdel(W)
		visible_emote("eat all of the dumplings in few seconds with gigantic happines!")

/mob/living/simple_animal/passive/cat/caracal/grisha/new_year
	name = "Novogodniy Grigoriy"
	desc = "That's Bolshoy Grigoriy, a big Terran cat. Now he is full of determination to celebrate the New Year. So you better not interfere.."
	icon_state = "floppa_newyear"
	item_state = "floppa_newyear"
	icon_living = "floppa_newyear"
	mob_size = MOB_LARGE

/mob/living/simple_animal/passive/cat/bolgarin
	name = "Major Bolgarin"
	desc = "A domesticated, upolnomochenniy ICCG officer. Has a tendency to kiss crewmembers."
	icon = 'icons/bos/mob/cat.dmi'
	icon_state = "bolgar"
	item_state = "bolgar"
	icon_living = "bolgar"
	icon_dead = "bolgar_dead"
