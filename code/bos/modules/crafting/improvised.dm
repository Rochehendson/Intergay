//Wrenchsword
/decl/crafting_stage/wrenchswordbegin
	begins_with_object_type = /obj/item/material/hatchet/machete
	completion_trigger_type = /obj/item/material/hatchet/machete
	item_icon = 'icons/bos/obj/crafting_icons.dmi'
	item_icon_state = "wrenchsword_unfinished"
	progress_message = "You align the two machete blades together."
	next_stages = list(
		/decl/crafting_stage/welding/wrenchswordweld)

/decl/crafting_stage/welding/wrenchswordweld
	progress_message = "You weld the blades together into a single, larger blade."
	item_icon = 'icons/bos/obj/crafting_icons.dmi'
	item_icon_state = "wrenchsword_unfinished"
	next_stages = list(
		/decl/crafting_stage/wrenchswordfinish)

/decl/crafting_stage/wrenchswordfinish
	completion_trigger_type = /obj/item/wrench
	progress_message = "You attach the wrench into the hilt, securing it."
	product = /obj/item/material/sword/improvised

//Spiked Crowbar

/decl/crafting_stage/spikedcrowbegin
	begins_with_object_type = /obj/item/material/knife
	completion_trigger_type = /obj/item/crowbar
	item_icon = 'icons/bos/obj/crafting_icons.dmi'
	item_icon_state = "spiked_crowbar_unfinished"
	progress_message = "You align the knife and the crowbar together."
	next_stages = list(
		/decl/crafting_stage/welding/spikedcrowweld)

/decl/crafting_stage/welding/spikedcrowweld
	progress_message = "You weld them together."
	item_icon = 'icons/bos/obj/crafting_icons.dmi'
	item_icon_state = "spiked_crowbar_unfinished"
	next_stages = list(
		/decl/crafting_stage/spikedcrowfinish)

/decl/crafting_stage/spikedcrowfinish
	completion_trigger_type = /obj/item/tape_roll
	progress_message = "You finish the spiked crowbar."
	product = /obj/item/material/knife/combat/improvised