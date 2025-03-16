/datum/event/psi_wave
	startWhen		= 5
	announceWhen	= 80

/datum/event/psi_wave/announce()
	command_announcement.Announce("В системе Мьёльнир был зафиксирован большой скачок пси-энергии. Мы подозреваем, что на вашем корабле могли появиться новые псионики. Рекомендуем обнаружить их и зарегестрировать как можно быстрее, для уменьшения опасности их для себя и экипажа.", zlevels = affecting_z)

/datum/event/psi_wave/start()
	for(var/mob/living/carbon/human/H in shuffle(GLOB.living_mob_list_))
		if((H.species.name == SPECIES_HUMAN) && (prob(20)))
			to_chat(H, SPAN_NOTICE("Suddenly, you feel a invisible wave that go through your brain. In one moment, you expirience a thousands of emotion, hear a millions voice of different people. You blink, and all of this disappear. But still, you feal yourself as a absoluteley new man."))
			H.set_psi_rank(PSI_REDACTION, rand(1, 3), defer_update = TRUE)
			H.set_psi_rank(PSI_COERCION, rand(1, 3), defer_update = TRUE)
			H.set_psi_rank(PSI_PSYCHOKINESIS, rand(1, 3), defer_update = TRUE)
			H.set_psi_rank(PSI_ENERGISTICS, rand(1, 3), defer_update = TRUE)
			H.psi.update(TRUE)
			log_and_message_admins("[H] get a psi power due a psi wave event.", location=H.loc)

		if(H.species.name == SPECIES_ADHERENT)
			to_chat(H, SPAN_WARNING("Suddenly, you feel a terrible invisible wave that go through you. The crystals inside you starting vibrate, and you understand... Bluespace. How fast and unexpected this starts, with same fast this ends."))
