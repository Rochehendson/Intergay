//Mantidified objects

/obj/item/mop/advanced/ascent
	name = "deck detritus delaminator"
	desc = "An alien staff with spongy filaments on one end."
	icon = 'icons/bos/obj/ascent_doodads.dmi'
	item_state = "advmop"

/obj/item/reagent_containers/glass/bucket/ascent
	name = "portable liquid cleaning agent carrier"
	desc = "An alien container of some sort."
	icon = 'icons/bos/obj/ascent_doodads.dmi'
	item_state = "bucket"

/obj/structure/mopbucket/ascent
	name = "portable liquid cleaning agent holder"
	desc = "An alien container of some sort."
	icon = 'icons/bos/obj/ascent_doodads.dmi'

/obj/item/material/knife/kitchen/cleaver/ascent
	name = "xenobiological flenser"
	desc = "A mindboggingly alien tool for flensing flesh."
	icon = 'icons/bos/obj/ascent_doodads.dmi'
	icon_state = "xenobutch"

/obj/structure/closet/crate/freezer/meat/ascent
	name = "cryogenic stasis unit"
	desc = "A bizarre alien stasis unit."
	icon = 'icons/bos/obj/ascent_doodads.dmi'
	icon_state = "base"

/obj/item/reagent_containers/food/drinks/cans/waterbottle/ascent
	name = "hydration cylinder"
	desc = "An alien portable long term storage device for potable water."
	icon = 'icons/bos/obj/ascent_doodads.dmi'

/obj/item/reagent_containers/food/snacks/hydration
	name = "hydration ration"
	desc = "Approximately ten units of liquid hydration in a edible membrane. Unflavored."
	icon = 'icons/bos/obj/ascent_doodads.dmi'
	icon_state = "h2o_ration"
	bitesize = 10
/obj/item/reagent_containers/food/snacks/hydration/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/water, 10)

/obj/item/storage/box/water/ascent
	name = "box of hydration cylinders"
	desc = "A box full of bottled water."
	icon = 'icons/bos/obj/ascent_doodads.dmi'
	icon_state = "box"
	startswith = list(/obj/item/reagent_containers/food/drinks/cans/waterbottle/ascent = 7)

/obj/structure/hygiene/shower/ascent
	name = "hydrating decontamination armature"
	desc = "An alien vertical squirt bath."
	icon = 'icons/bos/obj/ascent_doodads.dmi'

/obj/structure/hygiene/sink/ascent
	name = "hydration outlet"
	desc = "An alien wall mounted basin with mysterious protrusions."
	icon = 'icons/bos/obj/ascent_doodads.dmi'

/obj/structure/reagent_dispensers/water_cooler/ascent
	name = "hydration dispensator"
	desc = "An alien device housing liquid for alien purposes."
	icon = 'icons/bos/obj/ascent_doodads.dmi'
	cups = 50
	cup_type = /obj/item/reagent_containers/food/snacks/hydration

/obj/structure/reagent_dispensers/water_cooler/ascent/DispenserMessages(var/mob/user)
	return list("\The [user] grabs a hydration ration orb from \the [src].", "You grab a hydration ration orb from \the [src].")

/obj/structure/reagent_dispensers/water_cooler/ascent/RejectionMessage(var/mob/user)
	return "\The [src]'s orb supply is empty. Notify a control mind."

/////////
// Cloest Appearance
/////////
/decl/closet_appearance/ascent
	decals = null
	extra_decals = null
	base_icon =  'icons/bos/obj/ascent_freezer.dmi'

//actual closet
/obj/structure/closet/ascentproper
	name = "cryogenic stasis unit"
	desc = "A bizarre alien stasis unit."
	closet_appearance = /decl/closet_appearance/ascent

/obj/structure/closet/ascentproper/WillContain()
	return list(
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh = 12
	)
///////
//tools and shit SORT THIS LATER ELLONCAKE PLEASE
///////
/obj/item/weldingtool/electric/mantid
	name = "mantid welding tool"
	desc = "An oddly shaped alien welding tool."
	icon = 'icons/bos/obj/ascent.dmi'

/obj/item/device/multitool/mantid
	name = "mantid multitool"
	desc = "An alien microcomputer of some kind."
	icon = 'icons/bos/obj/ascent.dmi'
	icon_state = "multitool"

/obj/item/clustertool
	name = "alien clustertool"
	desc = "A bewilderingly complex knot of tool heads."
	icon = 'icons/bos/obj/ascent.dmi'
	icon_state = "clustertool"
	w_class = ITEM_SIZE_SMALL

	var/tool_mode
	var/list/tool_modes = list("wrench", "wirecutters", "crowbar", "screwdriver")

/obj/item/clustertool/attack_self(var/mob/user)
	var/new_index = tool_modes.Find(tool_mode) + 1
	if(new_index > tool_modes.len)
		new_index = 1
	tool_mode = tool_modes[new_index]
	name = "[initial(name)] ([tool_mode])"
	playsound(user, 'sound/machines/bolts_down.ogg', 10)
	to_chat(user, SPAN_NOTICE("You select the [tool_mode] attachment."))
	update_icon()

/obj/item/clustertool/on_update_icon()
	icon_state = "[initial(icon_state)]-[tool_mode]"

/obj/item/clustertool/Initialize()
	. = ..()
	tool_mode = tool_modes[1]
	name = "[initial(name)] ([tool_mode])"
	update_icon()

/obj/item/clustertool/IsWrench()
	return tool_mode == "wrench"

/obj/item/clustertool/IsWirecutter()
	return tool_mode == "wirecutters"

/obj/item/clustertool/IsScrewdriver()
	return tool_mode == "screwdriver"

/obj/item/clustertool/IsCrowbar()
	return tool_mode == "crowbar"

// Self-charging power cell.
/obj/item/cell/mantid
	name = "mantid microfusion plant"
	desc = "An impossibly tiny fusion reactor of mantid design."
	icon = 'icons/bos/obj/ascent.dmi'
	icon_state = "plant"
	maxcharge = 1500
	w_class = ITEM_SIZE_NORMAL
	var/recharge_amount = 12

/obj/item/cell/mantid/Initialize()
	START_PROCESSING(SSobj, src)
	. = ..()

/obj/item/cell/mantid/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/cell/mantid/Process()
	if(charge < maxcharge)
		give(recharge_amount)

/obj/item/rig_module/maneuvering_jets/tirowings
	name = "tiro glider"
	desc = "A highly advanced system of wing-like protrusions, made entirely from contained plasma. How it works is completely lost on you."
	icon_state = "tirowings"
	interface_name = "maneuvering wings"
	interface_desc = "An inbuilt energy wing maneuvering system, fueled by suit atmosphere."
	suit_overlay_active = "tirowings_active"
	suit_overlay_inactive = "tirowings_inactive"
	jets = /obj/item/tank/jetpack/ascent/tiro

/obj/item/rig_module/maneuvering_jets/tirowings/elite
	name = "tiro wings"
	desc = "An incredibly advanced projector capable of sustaining large wing-like appendages made from pure energy."
	suit_overlay_active = "tirowings_elite_active"
	suit_overlay_inactive = "tirowings_elite_inactive"
	jets = /obj/item/tank/jetpack/ascent/tiro/elite

/obj/item/device/megaphone/ascent
	name = "voice of crystal"
	desc = "A device capable of projecting one's voice in a loud, regal tone."
	insultmsg = list()

/obj/item/device/megaphone/ascent/attack_self(mob/living/user as mob) //I hate doing shitcode like this but it would legit not work otherwise
	if (user.client)
		if(user.client.prefs.muted & MUTE_IC)
			to_chat(src, "<span class='warning'>You cannot speak in IC (muted).</span>")
			return
	if(user.silent)
		return
	if(spamcheck)
		to_chat(user, "<span class='warning'>\The [src] needs to recharge!</span>")
		return

	var/message = sanitize(input(user, "Proclaim thy word.", "Regal Voice", null)  as text)
	if(!message)
		return
	for(var/mob/O in (viewers(user)))
		to_chat(O, "<B>[user]</B> thunders, <span class='danger'><font size=3>\"[message]\"</span></font>",2) // We do it this way because funny suit bullshit
	return

/obj/item/clothing/under/tiro
	icon = 'icons/bos/obj/clothing/obj_under.dmi'
	name = "tiro fatigues"
	desc = "A simple suit made from some unknown fabric. Surprisingly comfortable."
	icon_state = "tiro_jumpsuit"
	item_state = "tiro_jumpsuit"
	worn_state = "tiro_jumpsuit"
	siemens_coefficient = 0.7
	armor = list(
		energy = ARMOR_ENERGY_SMALL,
		rad = ARMOR_RAD_SMALL
		)
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE //I still want some heat protection but this should be better balanced(?)