/mob/living/simple_animal/passive/scorpion
	name = "scorpion"
	desc = "A cute tiny scorpion."
	icon = 'icons/bos/mob/scorpion.dmi'
	icon_state = "scorp"
	icon_living = "scorp"
	icon_dead = "scorp-dead"
	speak_emote = list("clicks")
	health = 5
	maxHealth = 5
	natural_weapon = /obj/item/natural_weapon/bite/weak
	response_help  = "pets"
	response_disarm = "shoos"
	response_harm   = "stomps on"
	holder_type = /obj/item/holder/small
	mob_size = MOB_MINISCULE
	possession_candidate = 1
	can_escape = TRUE
	pass_flags = PASS_FLAG_TABLE
	density = FALSE

	meat_amount = 1
	bone_amount = 1
	skin_amount = 1
	skin_material = MATERIAL_SKIN_LIZARD