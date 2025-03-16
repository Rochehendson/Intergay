//All glory to Eris coders
GLOBAL_LIST_EMPTY(all_antag_contracts)

/datum/antag_contract
	var/name
	var/desc
	var/reward = 0
	var/completed = FALSE
	var/unique = FALSE
	var/reputation_reward
	var/hirer
	//Lists of possible hirers for differents contracts types
	var/list/spy_hirers = list("Astro Media-Journalism", "Lordanian Patriots Association", "Syndicate", "ICCG", "Skrellian Defence Task Forces", "United Stations Of Star AED-1918", "Cult of Ascension", "Gestalt", "Boris Booker's Army")
	var/list/thief_hirers = list("Lordanian Patriots Association", "Space Travelers", "Private Face", "Empire Of Asteroid D-451", "Tajarans Vendetta Community", "Tribune of Lorriman Independence", "Cult of Ascension", "Gestalt", "Boris Booker's Army")
	var/list/sabotage_hirers = list("Lordanian Patriots Association", "Space Travelers", "Lordanian Miners Conglomerate Radicals", "Private Face", "Haliphate Of Black Hole ALLH-1453", "Tajarans Vendetta Community", "Tribune of Lorriman Independence", "Cult of Ascension", "Gestalt", "Boris Booker's Army")

/datum/antag_contract/proc/can_place()
	if(unique)
		for(var/datum/antag_contract/C in GLOB.all_antag_contracts)
			if(istype(C, type) && !C.completed)
				return FALSE
	return !!name

/datum/antag_contract/proc/place()
	GLOB.all_antag_contracts += src

/datum/antag_contract/proc/complete(datum/mind/M)
	if(completed)
		warning("Contract completed twice: [name] [desc]")
	completed = TRUE
	for(var/obj/item/device/uplink/U in world_uplinks)
		if(U.uplink_owner != M)
			continue
		U.uses += reward
		U.reputation += reputation_reward
		break


/datum/antag_contract/item

/datum/antag_contract/item/proc/on_container(obj/item/storage/snb/container)
	if(check(container))
		complete(container.owner)

/datum/antag_contract/item/proc/check(obj/item/storage/container)
	warning("Item contract does not implement check(): [name] [desc]")
	return FALSE



/datum/antag_contract/implant
	name = "Implant"
	var/mob/living/carbon/human/target

/datum/antag_contract/implant/New()
	hirer = pick(spy_hirers)
	reward = rand(20,25)
	reputation_reward = 28
	reputation_reward -= reward
	var/list/candidates = SSticker.minds.Copy()
	for(var/datum/antag_contract/implant/C in GLOB.all_antag_contracts)
		candidates -= C.target.mind
	while(candidates.len)
		var/datum/mind/target_mind = pick(candidates)
		var/mob/living/carbon/human/H = target_mind.current
		if(!istype(H) || H.stat == DEAD)
			candidates -= target_mind
			continue
		target = H
		desc = "Hirer: [hirer].<br>Implant [target.real_name] with a spying implant."
		break
	..()

/datum/antag_contract/implant/can_place()
	return ..() && target

/datum/antag_contract/implant/proc/check(obj/item/implant/spying/spy)
	if(completed)
		return
	if(spy.imp_in == target)
		complete(spy.owner)


#define CONTRACT_RECON_TARGET_COUNT 3

/datum/antag_contract/recon
	name = "Recon"
	var/list/area/targets = list()

/datum/antag_contract/recon/New()
	hirer = pick(spy_hirers)
	reward = rand(15,20)
	reputation_reward = 22
	reputation_reward -= reward
	targets += pick_area(GLOB.is_station_but_not_maint_area)
	targets += pick_area(GLOB.is_station_but_not_maint_area)
	desc = "Hirer: [hirer].<br>Activate 3 spying sensors in [english_list(targets, and_text = " or ")] and let them work without interruption for 10 minutes."
	..()

/datum/antag_contract/recon/can_place()
	return ..() && targets.len

/datum/antag_contract/recon/proc/check(obj/item/device/spy_sensor/sensor)
	if(completed)
		return
	if(get_area(sensor) in targets)
		complete(sensor.owner)

/datum/antag_contract/item/punisment
	name = "Punisment"
	var/obj/item/target
	var/datum/mind/target_mind
	var/target_limb

/datum/antag_contract/item/punisment/New()
	..()
	hirer = pick(sabotage_hirers)
	reward = rand(20,25)
	reputation_reward = 28
	reputation_reward -= reward
	target_limb = pick(BP_R_ARM, BP_L_ARM, BP_L_FOOT, BP_R_FOOT)
	var/list/candidates = SSticker.minds.Copy()
	for(var/datum/antag_contract/item/punisment/C in GLOB.all_antag_contracts)
		candidates -= C.target_mind
	while(candidates.len)
		target_mind = pick(candidates)
		var/mob/living/carbon/human/H = target_mind.current
		if(!istype(H) || H.stat == DEAD)
			candidates -= target_mind
			continue
		if(!target)
			target = H.organs_by_name[target_limb]
		desc = "Hirer: [hirer].<br>[pick("Give a lesson to the", "Make an invalid from the", "Punish the")] [target_mind.current.real_name] and send [target_mind.current.gender == MALE ? "his" : "her"] [target.name] [pick("via", "in")] SNB as a [pick("proof", "evidence of your work")]."
		break

/datum/antag_contract/item/punisment/can_place()
	return ..() && target

/datum/antag_contract/item/punisment/check(obj/item/storage/container)
	return target in container


/datum/antag_contract/item/steal
	name = "Steal"
	var/target_desc
	var/target_type

	var/static/list/possible_items = list(
		"the captain's antique laser gun" = /obj/item/gun/energy/captain,
//		"the hand teleporter" = /obj/prefab/hand_teleporter,
		"an RCD" = /obj/item/rcd,
		"a captain's jumpsuit" = /obj/item/clothing/under/rank/captain,
//		"a intelicard" = /obj/item/aicard,
//		"the chief engineer RIG" = /obj/item/rig/ce,
		"the ship blueprints" = /obj/item/blueprints,
		"a piece of corgi meat" = /obj/item/reagent_containers/food/snacks/meat/corgi,
		"the ship model" = /obj/item/toy/torchmodel,
		"the hypospray" = /obj/item/reagent_containers/hypospray,
		"the captain's pinpointer" = /obj/item/pinpointer,
		"an ablative armor vest" = /obj/item/clothing/suit/armor/laserproof
//		"the marine squad leader RIG" = /obj/item/rig/infantry/sl/equipped,
//		"the captain's secret documents" = /obj/item/folder/envelope/captain
	)

/datum/antag_contract/item/steal/New()
	..()
	hirer = pick(thief_hirers)
	reward = rand(15,20)
	reputation_reward = 22
	reputation_reward -= reward
	var/list/candidates = possible_items.Copy()
	for(var/datum/antag_contract/item/steal/C in GLOB.all_antag_contracts)
		candidates.Remove(C.target_desc)
	if(candidates.len)
		target_desc = pick(candidates)
		target_type = possible_items[target_desc]
		desc = "Hirer: [hirer].<br>Steal [target_desc] and send it [pick("via", "in")] SNB."

/datum/antag_contract/item/steal/can_place()
	return ..() && target_desc

/datum/antag_contract/item/steal/check(obj/item/storage/container)
	return locate(target_type) in container


/datum/antag_contract/item/dump
	name = "Dump"
	unique = TRUE
	var/sum

/datum/antag_contract/item/dump/New()
	..()
	hirer = pick(thief_hirers)
	reward = rand(10,15)
	reputation_reward = 16
	reputation_reward -= reward
	sum = rand(15, 25) * 500
	desc = "Hirer: [hirer].<br>Collect a sum of [sum] credits and send it [pick("via", "in")] SNB."

/datum/antag_contract/item/dump/check(obj/item/storage/container)
	var/received = 0
	for(var/obj/item/reagent_containers/food/snacks/spacecash/cash in container)
		received += cash.worth
	return received >= sum


/datum/antag_contract/virus
	name = "Spy Virus"
	var/target_desc
	var/target_type

	var/static/list/possible_targets = list(
		"the main ship helm control console in bridge" = /obj/machinery/computer/ship/helm,
		"a ship sensors" = /obj/machinery/shipsensors,
//		"the pointdefense control" = /obj/machinery/pointdefense_control,
		"the R&D server control console" = /obj/machinery/computer/rdservercontrol,
		"the teleporter control console" = /obj/machinery/computer/teleporter,
		"the forensic electric microscope" = /obj/machinery/microscope,
		"the bluespace emergency relay" = /obj/machinery/bluespacerelay,
//		"the AI upload console" = /obj/machinery/computer/upload/ai,
		"the missilies control console" = /obj/machinery/computer/ship/missiles
	)

/datum/antag_contract/virus/New()
	..()
	hirer = pick(spy_hirers)
	reward = rand(15,20)
	reputation_reward = 22
	reputation_reward -= reward
	var/list/candidates = possible_targets.Copy()
	for(var/datum/antag_contract/virus/M in GLOB.all_antag_contracts)
		candidates.Remove(M.target_desc)
	if(candidates.len)
		target_desc = pick(candidates)
		target_type = possible_targets[target_desc]
		desc = "Hirer: [hirer].<br>Infect [target_desc] with spying [pick("software", "program")] by virus sampler."

/datum/antag_contract/virus/proc/check(obj/item/device/virus_sampler/sampler)
	if(completed)
		return
	if(sampler.infected_machinery == target_type)
		complete(sampler.owner)
