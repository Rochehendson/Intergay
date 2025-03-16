//OVERRIDES

/datum/dna/gene/basic/remotetalk
	activation_messages = list("You can feel everyone.")

/datum/dna/gene/basic/remotetalk/activate(mob/M, connected, flags)
	..(M, connected, flags)
	M.verbs += /mob/living/carbon/human/proc/psisay

//PURELY COSMETIC NEW PROC

/mob/living/carbon/human/proc/psisay()
	set name = "Telepathy"
	set category = "Psionics"

	if(stat!=CONSCIOUS)
		reset_view(0)
		remoteview_target = null
		return

	if(!(mRemotetalk in src.mutations))
		src.verbs -= /mob/living/carbon/human/proc/psisay
		return
	var/list/creatures = list()
	for(var/mob/living/carbon/h in world)
		creatures += h
	var/mob/target = input("Who is your target?") as null|anything in creatures
	if (isnull(target))
		return

	var/say = sanitize(input("What do you wish to say?"))
	if(mRemotetalk in target.mutations)
		target.show_message(SPAN_NOTICE("You hear [src.real_name]'s voice in your head: [say]"))
	else
		target.show_message(SPAN_NOTICE("You hear a voice that seems to echo around the room: [say]"))
	usr.show_message(SPAN_NOTICE("You sent a telepathic message to [target.real_name]: [say]"))
	log_say("[key_name(usr)] sent a telepathic message to [key_name(target)]: [say]")
	for(var/mob/observer/ghost/G in world)
		G.show_message("<i>Telepathic message from <b>[src]</b> to <b>[target]</b>: [say]</i>")