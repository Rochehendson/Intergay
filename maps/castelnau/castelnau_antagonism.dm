//Makes sure we don't get any merchant antags as a balance concern. Can also be used for future castelnau specific antag restrictions.
/*
/datum/antagonist/changeling
	blacklisted_jobs = list(/datum/job/captain, /datum/job/hop, /datum/job/warden, /datum/job/officer)

/datum/antagonist/godcultist
	blacklisted_jobs = list(/datum/job/captain, /datum/job/hop)

/datum/antagonist/cultist
	blacklisted_jobs = list(/datum/job/hop)

/datum/antagonist/loyalists
	blacklisted_jobs = list()

/datum/antagonist/revolutionary
	blacklisted_jobs = list()

/datum/antagonist/traitor
	blacklisted_jobs = list(/datum/job/captain, /datum/job/warden, /datum/job/officer)
*/

/datum/antagonist/ert
	id = MODE_ERT
	role_text = "ERT Mercenary"
	role_text_plural = "ERT Mercenaries"
	antag_text = "You are an <b>anti</b>-antagonist! Within the rules, try to save the ship and its crew from the ongoing crisis. Or just join the victorious side. \
				 Try to make sure the other players have <i>fun</i>, and if you are confused or at a loss, always adminhelp. \
				 You should also contact the staff before taking any extreme actions. \
				 <b>Remember that all rules outside of those with explicit exceptions apply to the ERT!</b>"

/datum/antagonist/ert/Initialize()
	..()
	leader_welcome_text = SPAN_BOLD("Вы лидер отряда наёмников. ") + "Как лидер, вы определяете задачу отряда."
	welcome_text =        SPAN_BOLD("Вы член отряда наёмников.") + "Вы слушаете своего лидера, ведь он вам платит."

/datum/antagonist/ert/greet(var/datum/mind/player)
	if(!..())
		return
	to_chat(player.current, "С [GLOB.using_map.station_name] поступил сигнал бедствия, но поскольку вы продажные мрази, скорее всего вы решите помочь тому, кто заплатит больше.")
	to_chat(player.current, "Для начала снарядитесь и обсудите план. Позже может проснуться больше наёмников, так что не вылетайте, пока все точно не будут готовы.")

	if(reason)
		to_chat(player.current, SPAN_BOLD(FONT_LARGE("Вас вызвали на \the [GLOB.using_map.station_name] по причине: " + SPAN_NOTICE(reason))))

/datum/antagonist/ert/equip(var/mob/living/carbon/human/player)
	if(!..())
		return 0
	player.char_branch = "Other"
	player.char_rank = "Mercenary"

	var/decl/hierarchy/outfit/ert_outfit = outfit_by_type((player.mind == leader) ? /decl/hierarchy/outfit/job/castelnau/ert/leader : /decl/hierarchy/outfit/job/castelnau/ert)
	ert_outfit.equip(player)

	return 1

/datum/map_template/ruin/antag_spawn/ert
	name = "ERT Base"
	suffixes = list("ert/ert_base_merc.dmm")