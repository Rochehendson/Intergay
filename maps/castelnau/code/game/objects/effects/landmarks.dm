/obj/effect/landmark/New()
	..()
	switch(name)
		if("JoinLateCryoPrometeus")
			GLOB.latejoin_cryo_prometeus += loc
			delete_me = 1
			return