/*********************
* Contractor Devices *
*********************/
/datum/uplink_item/item/contractor
	category = /datum/uplink_category/contractor


/datum/uplink_item/item/contractor/imp_spying
	name = "Spying Implant"
	item_cost = 1
	path = /obj/item/storage/box/syndie_kit/imp_spying
	desc = "An implant, created for hidden taking of all possible information from his carrier."
	antag_roles = list(MODE_TRAITOR)

/datum/uplink_item/item/contractor/imp_spying/buy(obj/item/device/uplink/U)
	. = ..()
	if(.)
		var/obj/item/storage/box/syndie_kit/imp_spying/B = .
		var/obj/item/implanter/spying/I = locate() in B
		var/obj/item/implant/spying/S = I.imp
		S.owner = U.uplink_owner


/datum/uplink_item/item/contractor/virus_sampler
	name = "Virus Sampler"
	item_cost = 1
	path = /obj/item/device/virus_sampler
	desc = "A device for downloading virus in machines. Disguised in core sampler. Also have fingerprint authentication for you, so other can't use it!.. Why other devices haven't it?.."
	antag_roles = list(MODE_TRAITOR)

/datum/uplink_item/item/contractor/virus_sampler/buy(obj/item/device/uplink/U)
	. = ..()
	if(.)
		var/obj/item/device/virus_sampler/V = .
		V.owner = U.uplink_owner


/datum/uplink_item/item/contractor/spy_sensor
	name = "Spying Sensor (4x)"
	item_cost = 1
	path = /obj/item/storage/box/syndie_kit/spy_sensor
	desc = "A box with four sensors, that collect different information and send it to proper peoples. One sensor go as a gift!"
	antag_roles = list(MODE_TRAITOR)

/datum/uplink_item/item/contractor/spy_sensor/buy(obj/item/device/uplink/U)
	. = ..()
	if(.)
		var/obj/item/storage/box/syndie_kit/spy_sensor/B = .
		for(var/obj/item/device/spy_sensor/S in B)
			S.owner = U.uplink_owner


/datum/uplink_item/item/contractor/snb
	name = "SyndieNet Box(SNB)"
	item_cost = 1
	path = /obj/item/storage/snb
	desc = "A box of medium size, designed for safe bluespace delivery of different items. For sending, need place it in a space."
	antag_roles = list(MODE_TRAITOR)

/datum/uplink_item/item/contractor/snb/buy(obj/item/device/uplink/U)
	. = ..()
	if(.)
		var/obj/item/storage/snb/B = .
		B.owner = U.uplink_owner


/*********************
*   SERVICE START    *
*********************/

/datum/uplink_item/item/contractor/teleport
	name = "Random Teleportation"
	item_cost = 25
	service = 1
	desc = "Gestalt can overpower the bluespace rele in your uplink, and you get randomly teleported in your destination base. WARNING: Gestalt can't guarantee that you won't be teleported into the danger zone."
	antag_roles = list(MODE_TRAITOR)

/datum/uplink_item/item/contractor/teleport/buy(obj/item/device/uplink/U)
	. = ..()
	var/datum/effect/effect/system/spark_spread/spark = new
	var/turf/T = pick_area_and_turf(GLOB.is_station_but_not_space_or_shuttle_area)
	spark.set_up(5,1,usr.loc)
	spark.attach(usr.loc)
	spark.start()
	usr.forceMove(T)
	spark.set_up(5,1,T)
	spark.attach(T)
	spark.start()


/datum/uplink_item/item/contractor/syndienet_archive
	name = "Check Archive"
	item_cost = 15
	service = 1
	desc = "Gestalt can check his contracts archive, and find for you one or two missions. Remember: other agents in your zone also can complete these contracts."
	antag_roles = list(MODE_TRAITOR)

/datum/uplink_item/item/contractor/syndienet_archive/buy(obj/item/device/uplink/U)
	. = ..()
	if(prob(80))
		SSticker.generate_contracts(1)
	else
		SSticker.generate_contracts(2)


/* Waiting for map
/datum/uplink_item/item/contractor/shuttle
	name = "Call Shuttle"
	item_cost = 1
	service = 1
	desc = "SyndieNet appreciating your work and sends in hangar a shuttle for your escape or any other needs."
	antag_roles = list(MODE_TRAITOR)

/datum/uplink_item/item/contractor/shuttle/buy(obj/item/device/uplink/U)
	. = ..()
	???
*/
