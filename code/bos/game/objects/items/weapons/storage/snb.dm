/obj/item/storage/snb
	name = "\improper SNB unit"
	desc = "A strange box with a button."
	icon_state = "box_of_doom" // placeholder
	w_class = ITEM_SIZE_LARGE
	max_w_class = ITEM_SIZE_HUGE
	storage_slots = 1
	var/datum/mind/owner

/obj/item/storage/snb/attack_self(mob/user)
	if(owner == user.mind)
		return
	owner = user.mind
	to_chat(user, "You claim \the [src].")

/obj/item/storage/snb/AltClick(mob/usr)
	. = ..()
	launch()

/obj/item/storage/snb/verb/activate()
	set name = "Launch"
	set category = "Object"
	set src in oview(1)

	launch()

/obj/item/storage/snb/proc/launch()
	if(usr.incapacitated())
		return

	if(!(locate(/area/space) in oview(src)))
		to_chat(usr, "\The [src.name] must be placed near space.")
		return

	for(var/datum/antag_contract/item/C in GLOB.all_antag_contracts)
		if(C.completed)
			continue
		C.on_container(src)
	to_chat(usr, "<span class=\"info\">You press button on the [src.name] and it disappear with bunch of sparks!</span>")
	var/datum/effect/effect/system/spark_spread/spark = new
	var/turf/T = get_turf(src)
	spark.set_up(5,1,src)
	spark.attach(T)
	spark.start()
	qdel(src)
