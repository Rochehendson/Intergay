/obj/item/implant/spying
	name = "spying implant"
	icon_state = "implant_evil"
	var/timer
	var/datum/mind/owner

/obj/item/implant/spying/attack_self(mob/user)
	if(owner == user.mind)
		return
	owner = user.mind
	to_chat(user, "You claim \the [src].")

/obj/item/implant/spying/implanted()
	timer = addtimer(CALLBACK(src, .proc/report), 1 MINUTES, TIMER_STOPPABLE)

/obj/item/implant/spying/removed()
	deltimer(timer)

/obj/item/implant/spying/proc/report()
	if(!imp_in)
		return
	for(var/datum/antag_contract/implant/C in GLOB.all_antag_contracts)
		if(C.completed)
			continue
		C.check(src)

/obj/item/implanter/spying
	name = "implanter (S)"
	imp = /obj/item/implant/spying
