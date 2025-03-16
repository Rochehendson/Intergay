/obj/item/gun/projectile/revolver/foundation
	name = "\improper Foundation revolver"
	icon = 'icons/obj/guns/foundation.dmi'
	icon_state = "foundation"
	desc = "The CF 'Troubleshooter', a compact plastic-composite weapon designed for concealed carry by Cuchulain Foundation field agents. Smells faintly of copper."
	ammo_type = /obj/item/ammo_casing/pistol/magnum/nullglass

/obj/item/gun/projectile/revolver/foundation/disrupts_psionics()
	return FALSE

//boh

/datum/reagent/jerraman
	name = "Jerraman"
	taste_description = "liquid starlight"
	description = "A rare and expensive drug used legally by professionals to awaken psionic latencies in those who possess them, dangerous in higher doses."
	reagent_state = LIQUID
	color = "#d0ff00"
	metabolism = 1
	overdose = 5

	var/global/list/dose_messages = list(
		"Your name is called. It is your time.",
		"It all runs together. It all mixes.",
		"You won't forget. Don't forget. Don't forget.",
		"Everything is ending. Everything is beginning."
	)

	var/global/list/overdose_messages = list(
		"THE SIGNAL THE SIGNAL THE SIGNAL THE SIGNAL",
		"IT CRIES IT CRIES IT WAITS IT CRIES",
		"NOT YOURS NOT YOURS NOT YOURS NOT YOURS",
		"IT RUNS IT RUNS IT RUNS IT RUNS",
		"THE BLOOD THE BLOOD THE BLOOD THE BLOOD",
		"GET IT OUT GET IT OUT GET IT OUT",
		"THE LIGHT THE DARK A STAR IN CHAINS"
	)

/datum/reagent/jerraman/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.add_chemical_effect(CE_THIRDEYE, 1)
	M.add_chemical_effect(CE_MIND, -2)
	M.make_dizzy(5)
	if(prob(30))
		to_chat(M, SPAN_WARNING("<font size = [rand(1,2)]>[pick(dose_messages)]</font>"))
	if(M.psi)
		M.psi.check_latency_trigger(100, "a Jerraman dose")

/datum/reagent/jerraman/overdose(var/mob/living/carbon/M, var/alien)
	..()
	to_chat(M, SPAN_DANGER("You feel like the voices are tearing you apart, you lose control over your body and mind, going into a berserk."))
	M.hallucination(50, 50)
	M.make_jittery(5)
	M.adjustBrainLoss(rand(5, 10))
	if(ishuman(M) && prob(20))
		var/mob/living/carbon/human/H = M
		H.seizure()
	if(prob(10))
		to_chat(M, SPAN_DANGER("<font size = [rand(3,4)]>[pick(overdose_messages)]</font>"))

/obj/item/storage/briefcase/foundation
	name = "\improper Foundation briefcase"
	desc = "A handsome black leather briefcase embossed with a stylized radio telescope."
	icon_state = "fbriefcase"
	item_state = "fbriefcase"

/obj/item/storage/briefcase/foundation/disrupts_psionics()
	return FALSE

/obj/item/storage/briefcase/foundation/revolver/New()
	..()
	new /obj/item/gun/projectile/revolver/foundation(src)
	new /obj/item/ammo_magazine/speedloader/magnum/nullglass(src)
	new /obj/item/ammo_magazine/speedloader/magnum/nullglass(src)
	new /obj/item/ammo_magazine/speedloader/magnum/nullglass(src)

/obj/item/storage/secure/briefcase/jerraman
	name = "secure vial carrier"
	icon = 'icons/obj/storage.dmi'
	icon_state = "fbriefcase"
	item_state = "fbriefcase"
	desc = "A large briefcase designed to carry vials of chemicals, with a digital locking system."
	startswith = list(/obj/item/reagent_containers/glass/beaker/vial/jerraman = 5, /obj/item/storage/box/syringes = 1)

/obj/item/storage/secure/briefcase/jerraman/disrupts_psionics()
	return FALSE

/obj/item/reagent_containers/glass/beaker/vial/jerraman/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/jerraman = 4)

/obj/item/material/coin/nullglass
	desc = "A coin made of nullglass, used by psions to keep their own powers in check."
	default_material = MATERIAL_NULLGLASS

/obj/item/material/cross/nullglass
	desc = "A cross made of nullglass, used by psions to keep their own powers in check."
	default_material = MATERIAL_NULLGLASS

/obj/item/storage/box/large/psinullers
	name = "psi dampening items"
	desc = "Psionic dampening items for willing psions to suppress their powers."
	icon_state = "largebox"
	w_class = ITEM_SIZE_LARGE
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_LARGEBOX_STORAGE
	startswith = list(/obj/item/material/coin/nullglass = 7, /obj/item/material/cross/nullglass = 7)

/obj/item/storage/box/large/psinullers/disrupts_psionics()
	return FALSE