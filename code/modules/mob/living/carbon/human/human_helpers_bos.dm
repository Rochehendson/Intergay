// * Getters

/// Returns carbon character's culture
/mob/living/carbon/human/proc/get_culture()
	return client.prefs.cultural_info[TAG_CULTURE]


/// Returns carbon character's homeworld
/mob/living/carbon/human/proc/get_homeworld()
	return client.prefs.cultural_info[TAG_HOMEWORLD]


/// Returns carbon character's faction
/mob/living/carbon/human/proc/get_faction()
	return client.prefs.cultural_info[TAG_FACTION]


/// Returns carbon character's religion
/mob/living/carbon/human/proc/get_religion()
	return client.prefs.cultural_info[TAG_RELIGION]
