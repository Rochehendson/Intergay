//Cloning revival method.
//The pod handles the actual cloning while the computer manages the clone profiles

//Potential replacement for genetics revives or something I dunno (?)

//Find a dead mob with a brain and client.

#define CLONE_BIOMASS 40 //VOREstation Edit

/obj/machinery/clonepod
	name = "cloning pod"
	desc = "A combination organic tissue incubator and substrate three-dimensional printer, large enough to produce copies of most species found within known space."
	density = 1
	anchored = 1
	icon = 'icons/obj/cloning.dmi'
	icon_state = "pod_0"
//	req_access = list(access_genetics) // For premature unlocking.
	base_type = /obj/machinery/clonepod
	construct_state = /decl/machine_construction/default/panel_closed
	var/mob/living/occupant
	var/heal_level = 20			// The clone is released once its health reaches this level.
	var/heal_rate = 1
	var/locked = 0
	var/obj/machinery/computer/cloning/connected = null //So we remember the connected clone machine.
	var/mess = 0					// Need to clean out it if it's full of exploded clone.
	var/attempting = 0				// One clone attempt at a time thanks
	var/eject_wait = 0				// Don't eject them as soon as they are created fuckkk

	var/biomass
	var/maximum_biomass = 160 //4 clones

/obj/machinery/clonepod/New()
	update_icon()

/obj/machinery/clonepod/attack_ai(mob/user as mob)
	add_hiddenprint(user)
	return attack_hand(user)

/obj/machinery/clonepod/Initialize()
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/clonepod/proc/end_wait()
	eject_wait = 0

//Start growing a human clone in the pod!
/obj/machinery/clonepod/proc/growclone(var/datum/dna2/record/R)
	if(mess || attempting)
		return 0
/*no modifiers in bay yet
	for(var/modifier_type in R.genetic_modifiers)	//Can't be cloned, even if they had a previous scan
		if(istype(modifier_type, /datum/modifier/no_clone))
			return 0
*/
	// Remove biomass when the cloning is started, rather than when the guy pops out
	remove_biomass(CLONE_BIOMASS)
	attempting = 1 //One at a time!!
	locked = 1

	eject_wait = 1
	addtimer(CALLBACK(src, PROC_REF(end_wait)), 3 SECONDS)

	var/mob/living/carbon/human/H = new /mob/living/carbon/human(src, R.dna.species)
	occupant = H

	if(!R.dna.real_name)	//to prevent null names
		R.dna.real_name = "clone ([rand(0,999)])"
	H.real_name = R.dna.real_name
	H.gender = R.gender
	H.descriptors = R.body_descriptors

	//Get the clone body ready
	H.adjustCloneLoss(H.maxHealth/2) // We want to put them exactly at the crit level, so we deal this much clone damage
	H.Paralyse(4)

	//Here let's calculate their health so the pod doesn't immediately eject them!!!
	H.updatehealth()

	if(!R.dna)
		H.dna = new /datum/dna()
		H.dna.real_name = H.real_name
	else
		H.dna = R.dna
	H.UpdateAppearance()
	H.sync_organ_dna()
	var/mut_level = rand(1,3)
	for(var/i = 1 to mut_level)
		randmutb(H) //Sometimes the clones come out wrong.
		H.dna.UpdateSE()
		H.dna.UpdateUI()

	H.set_cloned_appearance()
	update_icon()
	for(var/datum/language/L in R.languages)
		H.add_language(L.name)

	H.flavor_texts = R.flavor.Copy()
	attempting = 0
	heal_level = rand(10, 45)
	return 1

//Grow clones to maturity then kick them out.  FREELOADERS
/obj/machinery/clonepod/Process()
	if(stat & NOPOWER) //Autoeject if power is lost
		if(occupant)
			locked = 0
			go_out()
		return

	if((occupant) && (occupant.loc == src))

		if(occupant.getCloneLoss() <= heal_level && !eject_wait)
			playsound(src.loc, 'sound/machines/ding.ogg', 50, 1)
			src.audible_message("\The [src] signals that the cloning process is complete.")
			connected_message("Cloning Process Complete.")
			locked = 0
			visible_message(SPAN_NOTICE("[src] disgorges [occupant] in a limp state, coated in pink, foul-smelling slime!"))
			go_out()
			return

		occupant.Paralyse(4)

		//Slowly get that clone healed and finished.
		occupant.adjustCloneLoss(-2 * heal_rate)

		//Premature clones may have brain damage.
		occupant.adjustBrainLoss(-(ceil(0.5*heal_rate)))

		//So clones don't die of oxyloss in a running pod.
		if(occupant.reagents.get_reagent_amount(/datum/reagent/inaprovaline) < 30)
			occupant.reagents.add_reagent(/datum/reagent/inaprovaline, 60)
		occupant.Sleeping(30)
		//Also heal some oxyloss ourselves because inaprovaline is so bad at preventing it!!
		occupant.adjustOxyLoss(-4)

		use_power_oneoff(7500) //This might need tweaking.
		return
	else if((!occupant) || (occupant.loc != src))
		occupant = null
		if(locked)
			locked = 0
		return

	return


//Used for new human mobs created by cloning/goleming/etc.
/mob/living/carbon/human/proc/set_cloned_appearance()
	facial_hair_style = "Shaved"
	if(dna.species == "Human") //no more xenos losing ears/tentacles
		head_hair_style = pick("Bedhead", "Bedhead 2", "Bedhead 3")
	worn_underwear.Cut()
	regenerate_icons()



//Let's unlock this early I guess.  Might be too early, needs tweaking.
/obj/machinery/clonepod/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/card/id)||istype(W, /obj/item/modular_computer/pda))
		if(!check_access(W))
			to_chat(user, "<span class='warning'>Access Denied.</span>")
			return
		if((!locked) || (isnull(occupant)))
			return
		if((occupant.health < -20) && (occupant.stat != 2))
			to_chat(user, "<span class='warning'>Access Refused.</span>")
			return
		else
			locked = 0
			to_chat(user, "System unlocked.")
	else if(isWrench(W))
		if(locked && (anchored || occupant))
			to_chat(user, "<span class='warning'>Can not do that while [src] is in use.</span>")
		else
			if(anchored)
				anchored = 0
				connected.pods -= src
				connected = null
			else
				anchored = 1
			if(anchored)
				user.visible_message("[user] secures [src] to the floor.", "You secure [src] to the floor.")
			else
				user.visible_message("[user] unsecures [src] from the floor.", "You unsecure [src] from the floor.")
	else if(istype(W, /obj/item/device/multitool))
		var/obj/item/device/multitool/M = W
		M.connecting = src
		to_chat(user, "<span class='notice'>You load connection data from [src] to [M].</span>")
		M.update_icon()
		return
	else if(istype(W, /obj/item/reagent_containers/food/snacks/meat))
		var/biomass_to_add = 20
		if(biomass + biomass_to_add > maximum_biomass)
			to_chat(user, SPAN_WARNING("[src] gurgles and belches, then spits [W] back at you! Seems like it's full."))
			return
		else
			to_chat(user, SPAN_NOTICE("[src] churns and gurgles happily as  [W] dissolves into a pinkish, foul-smelling goo. It regurgitates some onto you. Yuck."))
			biomass += biomass_to_add
			qdel(W)
	else
		..()

/obj/machinery/clonepod/emag_act(var/remaining_charges, var/mob/user)
	if(isnull(occupant))
		return
	to_chat(user, "You force an emergency ejection.")
	locked = 0
	go_out()
	return 1

//Put messages in the connected computer's temp var for display.
/obj/machinery/clonepod/proc/connected_message(var/message)
	if((isnull(connected)) || (!istype(connected, /obj/machinery/computer/cloning)))
		return 0
	if(!message)
		return 0

	connected.temp = "[name] : [message]"
	connected.updateUsrDialog()
	return 1

/obj/machinery/clonepod/verb/eject()
	set name = "Eject Cloner"
	set category = "Object"
	set src in oview(1)

	if(usr.stat != 0)
		return
	go_out()
	add_fingerprint(usr)
	return

/obj/machinery/clonepod/proc/go_out()
	if(locked)
		return

	if(mess) //Clean that mess and dump those gibs!
		mess = 0
		gibs(src.loc)
		update_icon()
		return

	if(!(occupant))
		return

	if(occupant.client)
		occupant.client.eye = occupant.client.mob
		occupant.client.perspective = MOB_PERSPECTIVE
	occupant.loc = src.loc
	eject_wait = 0 //If it's still set somehow.
	if(ishuman(occupant)) //Need to be safe.
		var/mob/living/carbon/human/patient = occupant
		if(!(patient.species.species_flags & SPECIES_FLAG_NO_SCAN)) //If, for some reason, someone makes a genetically-unalterable clone, let's not make them permanently disabled.
			domutcheck(occupant) //Waiting until they're out before possible transforming.
	occupant = null

	update_icon()
	return

// Returns the total amount of biomass reagent in all of the pod's stored containers
/obj/machinery/clonepod/proc/get_biomass()
	return biomass

// Removes [amount] biomass, spread across all containers. Doesn't have any check that you actually HAVE enough biomass, though.
/obj/machinery/clonepod/proc/remove_biomass(var/amount = CLONE_BIOMASS)		//Just in case it doesn't get passed a new amount, assume one clone
	biomass -= amount

// Empties all of the beakers from the cloning pod, used to refill it

/obj/machinery/clonepod/proc/malfunction()
	if(occupant)
		connected_message("Critical Error!")
		mess = 1
		update_icon()
		QDEL_IN(occupant, 5)
	return

/obj/machinery/clonepod/relaymove(mob/user as mob)
	if(user.stat)
		return
	go_out()
	return

/obj/machinery/clonepod/emp_act(severity)
	if(prob(100/severity))
		malfunction()
	..()

/obj/machinery/clonepod/ex_act(severity)
	switch(severity)
		if(1.0)
			for(var/atom/movable/A as mob|obj in src)
				A.loc = src.loc
				ex_act(severity)
			qdel(src)
			return
		if(2.0)
			if(prob(50))
				for(var/atom/movable/A as mob|obj in src)
					A.loc = src.loc
					ex_act(severity)
				qdel(src)
				return
		if(3.0)
			if(prob(25))
				for(var/atom/movable/A as mob|obj in src)
					A.loc = src.loc
					ex_act(severity)
				qdel(src)
				return
		else
	return

/obj/machinery/clonepod/on_update_icon()
	. = ..()
	icon_state = "pod_0"
	if(occupant && !(stat & NOPOWER))
		icon_state = "pod_1"
	else if(mess)
		icon_state = "pod_g"


/obj/machinery/clonepod/full/New()
	biomass = maximum_biomass
//Health Tracker Implant

/obj/item/implant/health
	name = "health implant"
	var/healthstring = ""

/obj/item/implant/health/proc/sensehealth()
	if(!implanted)
		return "ERROR"
	else
		if(isliving(implanted))
			var/mob/living/L = implanted
			healthstring = "[round(L.getOxyLoss())] - [round(L.getFireLoss())] - [round(L.getToxLoss())] - [round(L.getBruteLoss())]"
		if(!healthstring)
			healthstring = "ERROR"
		return healthstring

//Disk stuff.
//The return of data disks?? Just for transferring between genetics machine/cloning machine.
//TO-DO: Make the genetics machine accept them.
/obj/item/disk/data
	name = "Cloning Data Disk"
	icon = 'icons/obj/cloning.dmi'
	icon_state = "datadisk0" //Gosh I hope syndies don't mistake them for the nuke disk.
	item_state = "card-id"
	w_class = ITEM_SIZE_SMALL
	var/datum/dna2/record/buf = null
	var/read_only = 0 //Well,it's still a floppy disk

/obj/item/disk/data/proc/initializeDisk()
	buf = new
	buf.dna=new

/obj/item/disk/data/demo
	name = "data disk - 'God Emperor of Mankind'"
	read_only = 1

/obj/item/disk/data/demo/New()
	initializeDisk()
	buf.types=DNA2_BUF_UE|DNA2_BUF_UI
	//data = "066000033000000000AF00330660FF4DB002690"
	//data = "0C80C80C80C80C80C8000000000000161FBDDEF" - Farmer Jeff
	buf.dna.real_name="God Emperor of Mankind"
	buf.dna.unique_enzymes = md5(buf.dna.real_name)
	buf.dna.UI=list(0x066,0x000,0x033,0x000,0x000,0x000,0xAF0,0x033,0x066,0x0FF,0x4DB,0x002,0x690)
	//buf.dna.UI=list(0x0C8,0x0C8,0x0C8,0x0C8,0x0C8,0x0C8,0x000,0x000,0x000,0x000,0x161,0xFBD,0xDEF) // Farmer Jeff
	buf.dna.UpdateUI()

/obj/item/disk/data/monkey
	name = "data disk - 'Mr. Muggles'"
	read_only = 1

/obj/item/disk/data/demo/New()
	..()
	initializeDisk()
	buf.types=DNA2_BUF_SE
	var/list/new_SE=list(0x098,0x3E8,0x403,0x44C,0x39F,0x4B0,0x59D,0x514,0x5FC,0x578,0x5DC,0x640,0x6A4)
	for(var/i=new_SE.len;i<=DNA_SE_LENGTH;i++)
		new_SE += rand(1,1024)
	buf.dna.SE=new_SE
	buf.dna.SetSEValueRange(GLOB.MONKEYBLOCK,0xDAC, 0xFFF)

/obj/item/disk/data/New()
	..()
	var/diskcolor = pick(0,1,2)
	icon_state = "datadisk[diskcolor]"

/obj/item/disk/data/attack_self(mob/user as mob)
	read_only = !read_only
	to_chat(user, "You flip the write-protect tab to [read_only ? "protected" : "unprotected"].")

/obj/item/disk/data/examine(mob/user)
	..(user)
	to_chat(user, text("The write-protect tab is set to [read_only ? "protected" : "unprotected"]."))
	return

/*
 *	Diskette Box
 */

/obj/item/storage/box/disks
	name = "Diskette Box"
	icon_state = "disk_kit"

/obj/item/storage/box/disks/New()
	..()
	new /obj/item/disk/data(src)
	new /obj/item/disk/data(src)
	new /obj/item/disk/data(src)
	new /obj/item/disk/data(src)
	new /obj/item/disk/data(src)
	new /obj/item/disk/data(src)
	new /obj/item/disk/data(src)

/*
 *	Manual -- A big ol' manual.
 */
/obj/item/paper/Cloning
	name = "H-87 Техническое руководство по клонированию"
	info = {"<h4>Введение</h4>
	Поздравляем, ваше судно купило промышленное устройство клонирования!<br>
	Использовать H-87 так же просто как и проводить операцию на мозге! Просто вставьте гуманоида в сканер и нажмите на опцию "Создать новый профиль".<br>
	<b>Вот и всё!</b><br>
	<i>Заметьте, система не может просканировать не-органиков или малых приматов. Сканирование так же может провалиться в виду сильного повреждения мозга у субъекта.</i><br>
	<p>Профили клонирования могут быть просмотрены в меню профилей. Сканирование так же имплантирует дополнительный имплант монитора здоровья, который может быть просмотрен для каждого субъекта.
	Удаление профилей ограничено доступом \[Командного состава\].</p>
	<h4>Клонирование из профиля</h4>
Клонирование проходит так же просто, как и нажатие функции "Клонировать" в нижней части каждого файла-профиля.<br>
	В соответствии с соглашением о правах на частную жизнь, клонирование всё ещё живого экипажа заблокировано в H-87.<br>
	<br>
	<p>Предоставленный саркофаг клонирования создаст желаемого клона.  Стандартное время созревания клона(с использованием функции "быстрого клонирования") составляет примерно 90 секунд.
	Саркофаг клонирования может быть разблокирован доступом \[Медицинского состава\] после завершения первоначального созревания.</p><br>
	<i>Обратите внимание, что полученные клоны могут иметь небольшие дефекты физического развития в виду генетического дрейфа.</i><br>
	<h4>Управление профилями</h4>
	<p> H-87 (так же как и стандартное генетическоие оборудование на вашем судне) может принимать стандартные дискеты с данными.
	Данные дискеты используются для переноса генетической информации между машинами.
	Функция "сохранение/загрузка" станет доступна, если будет вставлен диск.</p><br>
	<i>Хорошая дискета - отличный способ противостоять вышеупомянотому генетическому дрейфу!</i><br>
	<br>
	<font size=1>Технология произведена под лицензией корпорации Thinktronic Systems, LTD.</font>"}

//SOME SCRAPS I GUESS
/* EMP grenade/spell effect
		if(istype(A, /obj/machinery/clonepod))
			A:malfunction()
*/
