#define COMPLEXITY_ZERO   0
#define COMPLEXITY_ONE    1
#define COMPLEXITY_TWO    2
#define COMPLEXITY_THREE  3
#define COMPLEXITY_FOUR   4
#define COMPLEXITY_FIVE   5

#define ACTION_REPLACE "replace"
#define ACTION_TAKE	   "take"

/obj/structure/statue
	name = "statue stand"
	desc = "You will get here one day. Or it's just a statue honouring some piece of tile."
	icon = 'maps/torch/bos/icons/obj/structures/statue.dmi'
	icon_state = "placeholder"
	anchored = TRUE

	var/complexity = COMPLEXITY_ZERO
	var/obj/item/hidden_item

// -- Item transfering procs --

/// Moves the item into the statue
/obj/structure/statue/proc/transfer_item_to_statue(obj/item/item, mob/user)
	if (do_after(user, get_transfer_time()))
		user.drop_from_inventory(item)
		item.forceMove(src)
		hidden_item = item

/// Moves the item into the user's hands
/obj/structure/statue/proc/transfer_item_to_user(mob/user)
	if (do_after(user, get_transfer_time()))
		user.put_in_hands(hidden_item)
		hidden_item = null

/// Replaces item it the statue
/obj/structure/statue/proc/replace_item(obj/item/item, mob/user)
	transfer_item_to_user(user)
	transfer_item_to_statue(item, user)

// -- Getter-procs --

/// Returns the time it takes to detect the hidden item
/obj/structure/statue/proc/get_search_time()
	return complexity * 1.8 SECOND

/// Returns the time it takes to transfer the hidden item
/obj/structure/statue/proc/get_transfer_time()
	return complexity * 0.4 SECOND

// -- Procs for discovering items in statues --

/// Returns the user's choice based on action
/obj/structure/statue/proc/ask_user_to(action, mob/user)
	var/title
	var/message

	switch (action)
		if (ACTION_TAKE)
			title = "You found something in \the [src]."
			message = "After a little searching, you found \the [hidden_item]. Do you want to pick it up?"

		if (ACTION_REPLACE)
			title = "There is something already hidden in \the [src]."
			message = "\the [hidden_item] is already hidden here. Do you want to replace it?"

	var/choice = alert(user, message, title, "Yes", "No")
	if (choice == "Yes")
		return TRUE
	return FALSE

/// Returns the user's search result
/obj/structure/statue/proc/try_to_discover_item(mob/user)

	if (!do_after(user, get_search_time(), src))
		return FALSE

	if (!hidden_item)
		return FALSE

	return TRUE

/// Forces the user to make an attempt to find an object hidden in the statue
/obj/structure/statue/proc/try_to_get_item(mob/user)
	user.visible_message("[user] started groping \the [src].", "You started searching \the [src].")

	if (!try_to_discover_item(user))
		to_chat(user, "You didn't find anything.")
		return

	hidden_item.add_fingerprint(user)

	if (ask_user_to(ACTION_TAKE, user))
		user.visible_message(
			"[user] started pulling something out of \the [src]",
			"You started pulling item out of \the [src]"
		)
		transfer_item_to_user(user)
	else
		to_chat(user, SPAN_NOTICE("You left \the [hidden_item] in place."))


// -- Procs for hiding items in statues --

/// Returns the ability to hide an object in the statue
/obj/structure/statue/proc/is_item_suitable(obj/item/item)
	return complexity >= item.w_class

/// Forces the user to make an attempt to hide an object hidden in the statue
/obj/structure/statue/proc/try_to_hide_item(obj/item/item, mob/user)
	user.visible_message(
		"[user] started groping \the [src].",
		"You started looking for a place in \the [src] where you can hide \a [item]."
	)

	if (!is_item_suitable(item))
		to_chat(user, SPAN_NOTICE("It seems that \the [item] will not be able to hide in \the [src]."))

	if (try_to_discover_item(user))
		if (ask_user_to(ACTION_REPLACE, user))
			user.visible_message(
				"[user] started replacing something in \the [src]",
				"You started repalcing things in \the [src]"
			)
			replace_item(item, user)
			return

	user.visible_message(
		"[user] started hiding something in \the [src]",
		"You started hiding \a [item] in \the [src]"
	)
	transfer_item_to_statue(item, user)

/obj/structure/statue/attackby(obj/item/item, mob/user)
	if (user.a_intent == I_GRAB)
		try_to_hide_item(item, user)
		return
	return ..()

// -- Intent-based procs --

/// The action performed when user's intent is HELP
/obj/structure/statue/proc/intent_action_help(mob/user)
	user.visible_message("[user] put his hand on \the [src].", "You put your hand on \the [src]")
	to_chat(user, "Cold...")

/// The action performed when user's intent is GRAB
/obj/structure/statue/proc/intent_action_grab(mob/user)
	try_to_get_item(user)

/obj/structure/statue/attack_hand(mob/user)
	switch (user.a_intent)
		if (I_HELP)
			intent_action_help(user)
		if (I_GRAB)
			intent_action_grab(user)

/obj/structure/statue/roger
	name = "Roger Blackmore statue"
	desc = "A native of Tersten, a war hero who was head of the Tersten cell of the League of Struggle. Led the takeover of Tersten City, marched in the forefront of the rebels, blew himself up next to one of the army's military installations, posthumously a hero of the Sovereign Lordania."
	icon_state = "shahid"
	complexity = COMPLEXITY_THREE

/obj/structure/statue/matt
	name = "Matt Striker statue"
	desc = "Personally killed over ninety SCG commanders during the conflict. Passed away after numerous attempts on his life due to stress."
	icon_state = "suecidnik"
	complexity = COMPLEXITY_THREE

/obj/structure/statue/boris
	name = "Boris Booker statue"
	desc = "Your leader and founder of the Sovereign Lordania. 'I see no point in Lordania's existence if it is not united into one strong state capable of dealing with any aggressor in the galactic arena.'"
	icon_state = "booker"
	complexity = COMPLEXITY_THREE

/obj/structure/statue/boris/proc/invoke_reaction_normal(mob/living/carbon/human/user)
	var/list/quotes = list(
		"It's humiliating.",
		"Maybe it's time for me to see a doctor?",
		"The Lordanians adore him too much.",
		"What I'm doing is not normal.",
		"Why did I do it?",
		"Why?",
	)

	switch (user.gender)
		if (MALE)
			quotes += list(
				"Compensates.",
				"Mine is even bigger.",
				"No homo.",
				"Typical Politician: Big Cock But No Cum",
			)
		if (FEMALE)
			quotes += list(
				"At a meeting, it is necessary to stab immediately in the groin.",
				"Dreamers.",
				"This is impossible from the point of view of biology!",
			)

	to_chat(user, SPAN_BOLD(SPAN_WARNING(pick(quotes))))

/obj/structure/statue/boris/proc/invoke_reaction_lordanian(mob/living/carbon/human/user)
	var/list/quotes = list(
		"He is a true lord-protector",
		"This is absolute power of Lordania",
		"Titanium Power",
		"Wow! Nice rock.",
	)

	switch (user.gender)
		if (MALE)
			quotes += list(
				"He is my king.",
				"Nice rock. Awesome eyeballs.",
				"Such weapons are not found in any system.",
				"That's why I'm proud to be a Lordanian!"
			)
		if (FEMALE)
			quotes += list(
				"I'm willing to bet that the inhabitants of Mars are not even close to it.",
				"Masculinity, beauty, domination.",
				"Thanks to this power, everyone is equal in Lordania."
			)

	to_chat(user, SPAN_BOLD(SPAN_NOTICE(pick(quotes))))

/obj/structure/statue/boris/proc/special_action(mob/living/carbon/human/user)
	user.visible_message(
		"[user] put their hand on the groin of the statue of Boris Booker",
		"You put your hand on the groin of the statue of Boris Booker"
	)

	// TODO Move this to defines
	var/list/lordanian_faction = list(FACTION_SOVLORDANIA, FACTION_LARFLEET, FACTION_LARMARINES)
	var/list/lordanian_cultures = list(CULTURE_HUMAN_LORDANIAN_WEST, CULTURE_HUMAN_LORDANIAN_EAST)
	var/faction = user.get_faction()
	var/homeworld = user.get_homeworld()
	var/culture = user.get_culture()


	if ((faction in lordanian_faction) && (homeworld == HOME_SYSTEM_LORDANIA) && (culture in lordanian_cultures))
		invoke_reaction_lordanian(user)
	else
		invoke_reaction_normal(user)

/obj/structure/statue/boris/intent_action_help(mob/living/carbon/human/user)
	if ((user.zone_sel.selecting == BP_GROIN) && (user.species.name in HUMAN_SPECIES))
		special_action(user)
		return
	return ..()

/obj/structure/statue/vasiliy
	name = "Vasiliy Petrenko statue"
	desc = "Effectively used the subjugation implants to sacrifice himself and his personnel to destroy the SCG patrol fleet in the name of sovereign Lordania. The Systems will not forget their heroes!"
	icon_state = "urod"
	complexity = COMPLEXITY_THREE

/obj/structure/statue/grisha
	name = "Bolshoy Grigoriy statue"
	desc = " The Hero cat. He bit the wire of an enemy artillery mount and saved the squad."
	icon_state = "grisha"
	complexity = COMPLEXITY_TWO

/obj/structure/statue/shmesser
	name = "Unknown warrior statue"
	desc = " This naked unknown warrior appeared out of nowhere and attacked Lordania's enemies with only a toolbox. He showed the most important trait of the Lordanian people - courage and commitment to the homeland"
	icon_state = "shmesser"
	complexity = COMPLEXITY_ONE

/obj/structure/statue/ambrosia
	name = "Stas Bolgarka statue"
	desc = "The most famous GCC officer of the GrigoriWald concentration camp. Killed hundreds of enemies of Lordania and ate SCG children. Retired from service due to old age, today is a member of the party 'Love your xenos'"
	icon_state = "ambrosia"
	complexity = COMPLEXITY_THREE

#undef COMPLEXITY_ZERO
#undef COMPLEXITY_ONE
#undef COMPLEXITY_TWO
#undef COMPLEXITY_THREE
#undef COMPLEXITY_FOUR
#undef COMPLEXITY_FIVE

#undef ACTION_REPLACE
#undef ACTION_TAKE
