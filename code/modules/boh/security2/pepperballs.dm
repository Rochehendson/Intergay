/////////
// pistol pepperball gang
/////////

//casing
/obj/item/ammo_casing/pistol/rubber/pepperball
	name = "pepperball casing"
	projectile_type = /obj/item/projectile/bullet/pistol/pepperball

//magazine
/obj/item/ammo_magazine/pistol/double/pepperball
	name = "pepperball magazine"
	ammo_type = /obj/item/ammo_casing/pistol/rubber/pepperball

//box
/obj/item/storage/box/ammo/pepperball
	name = "pepperball magazines"
	startswith = list(/obj/item/ammo_magazine/pistol/double/pepperball = 2)

/obj/item/storage/box/ammo/pepperball/full
	name = "heavy box of pepperball magazines"
	startswith = list(/obj/item/ammo_magazine/pistol/double/pepperball = 7)

/////////
/*
Courtesy of Mazian.
They've given me the go ahead to rip their code from Citadel, and place it here.
Thanks a bunch! :n
*/
/////////

/obj/item/projectile/bullet/pistol/pepperball
	name = "pepperball"
	damage = 0
	agony = 0
	embed = 0
	sharp = 0
	nodamage = 1
	fire_sound = 'sound/weapons/gunshot/fastspike.ogg'

/obj/item/projectile/bullet/pistol/pepperball/on_hit(var/atom/target, var/blocked = 0, var/alien)
	..()
	var/eyes_covered = 0
	var/mouth_covered = 0

	var/head_covered = 0
	var/arms_covered = 0
	var/legs_covered = 0
	var/hands_covered = 0
	var/feet_covered = 0
	var/chest_covered = 0
	var/groin_covered = 0

	var/obj/item/safe_thing = null

	var/effective_strength = 5
	if(!istype(target, /mob/living/carbon/human))
		return
	if(alien == IS_SKRELL)	//Larger eyes means bigger targets.
		effective_strength = 8

	if(alien == IS_DIONA)
		effective_strength = 4
	var/mob/living/carbon/human/M = target
	if(istype(target, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		if(!H.can_feel_pain())
			return
		if(H.head)
			if(H.head.body_parts_covered & EYES)
				eyes_covered = 1
				safe_thing = H.head
			if((H.head.body_parts_covered & FACE) && !(H.head.item_flags & ITEM_FLAG_FLEXIBLEMATERIAL))
				mouth_covered = 1
				safe_thing = H.head
		if(H.wear_mask)
			if(!eyes_covered && H.wear_mask.body_parts_covered & EYES)
				eyes_covered = 1
				safe_thing = H.wear_mask
			if(!mouth_covered && (H.wear_mask.body_parts_covered & FACE) && !(H.wear_mask.item_flags & ITEM_FLAG_FLEXIBLEMATERIAL))
				mouth_covered = 1
				safe_thing = H.wear_mask
		if(H.glasses && H.glasses.body_parts_covered & EYES)
			if(!eyes_covered)
				eyes_covered = 1
				if(!safe_thing)
					safe_thing = H.glasses
	if(eyes_covered && mouth_covered)
		to_chat(M, "<span class='warning'>Your [safe_thing] protects you from the pepperball!</span>")
		if(alien != IS_SLIME)
			return
	else if(eyes_covered)
		to_chat(M, "<span class='warning'>Your [safe_thing] protects you from most of the pepperball!</span>")
		to_chat(M, "<span class='warning'>Oh god, it burns!</span>")
		M.eye_blurry = max(M.eye_blurry, effective_strength * 3)
		M.eye_blind = max(M.eye_blind, effective_strength)
		M.apply_effect(6 * effective_strength, DAMAGE_PAIN, 0)
		if(alien != IS_SLIME)
			return
	else if(mouth_covered) // Mouth cover is better than eye cover
		to_chat(M, "<span class='warning'>Your [safe_thing] protects your face from the pepperball!</span>")
		M.eye_blurry = max(M.eye_blurry, effective_strength)
		if(alien != IS_SLIME)
			return
	else// Oh dear :D
		to_chat(M, "<span class='warning'>Your eyes are affected by the pepperball!</span>")
		to_chat(M, "<span class='warning'>Oh god, it burns!</span>")
		M.eye_blurry = max(M.eye_blurry, effective_strength * 5)
		M.eye_blind = max(M.eye_blind, effective_strength)
		M.apply_effect(6 * effective_strength, DAMAGE_PAIN, 0)
		if(alien != IS_SLIME)
			return
	if(alien == IS_SLIME)
		if(!head_covered)
			if(prob(33))
				to_chat(M, "<span class='warning'>The exposed flesh on your head burns!</span>")
			M.apply_effect(5 * effective_strength, DAMAGE_PAIN, 0)
		if(!chest_covered)
			if(prob(33))
				to_chat(M, "<span class='warning'>The exposed flesh on your chest burns!</span>")
			M.apply_effect(5 * effective_strength, DAMAGE_PAIN, 0)
		if(!groin_covered && prob(75))
			if(prob(33))
				to_chat(M, "<span class='warning'>The exposed flesh on your groin burns!</span>")
			M.apply_effect(3 * effective_strength, DAMAGE_PAIN, 0)
		if(!arms_covered && prob(45))
			if(prob(33))
				to_chat(M, "<span class='warning'>The exposed flesh on your arms burns!</span>")
			M.apply_effect(3 * effective_strength, DAMAGE_PAIN, 0)
		if(!legs_covered && prob(45))
			if(prob(33))
				to_chat(M, "<span class='warning'>The exposed flesh on your legs burns!</span>")
			M.apply_effect(3 * effective_strength, DAMAGE_PAIN, 0)
		if(!hands_covered && prob(20))
			if(prob(33))
				to_chat(M, "<span class='warning'>The exposed flesh on your hands burns!</span>")
			M.apply_effect(effective_strength / 2, DAMAGE_PAIN, 0)
		if(!feet_covered && prob(20))
			if(prob(33))
				to_chat(M, "<span class='warning'>The exposed flesh on your feet burns!</span>")
			M.apply_effect(effective_strength / 2, DAMAGE_PAIN, 0)