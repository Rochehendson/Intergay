/datum/map/castelnau

//JOBS
///////

	allowed_jobs = list(/datum/job/captain,/datum/job/hop,/datum/job/adjutant, /datum/job/outleader, /datum/job/emissary, /datum/job/commissary,
						/datum/job/warden, /datum/job/officer, /datum/job/specialist, /datum/job/outsec, /datum/job/raidlead, /datum/job/raidparty,
						/datum/job/senior_engineer, /datum/job/engineer, /datum/job/psiengineer, /datum/job/scientist, /datum/job/outeng,
						/datum/job/senior_doctor, /datum/job/doctor, /datum/job/redactor, /datum/job/outmed,
						/datum/job/chiefmerchant, /datum/job/ftumerchant, /datum/job/cargotech, /datum/job/ftumerchant_security, /datum/job/mining,
						/datum/job/pilot, /datum/job/chef, /datum/job/bartender, /datum/job/janitor,/datum/job/assistant,
						/datum/job/wanderer
						)

//ACCESS REGIONS - UPDATE EM LATER
///////

	access_modify_region = list(
		ACCESS_REGION_SECURITY = list(access_castelnau_idmod),
		ACCESS_REGION_MEDBAY = list(access_castelnau_idmod),
		ACCESS_REGION_RESEARCH = list(access_castelnau_idmod),
		ACCESS_REGION_ENGINEERING = list(access_castelnau_idmod),
		ACCESS_REGION_COMMAND = list(access_castelnau_idmod),
		ACCESS_REGION_GENERAL = list(access_castelnau_idmod),
		ACCESS_REGION_SUPPLY = list(access_castelnau_cheapskate),
		ACCESS_REGION_NT = list(access_castelnau_cheapskate),
	)


//SPECIES RESTRICTION
///////

/*no xeno psionics
most of the command roles are restricted for everyone except for humans and skrells
voxes are crew members and there's nothing you can do about it*/

	species_to_job_whitelist = list()

	species_to_job_blacklist = list(

	//SKRELL
		/datum/species/skrell = list(/datum/job/captain, /datum/job/adjutant, /datum/job/emissary, /datum/job/commissary,
		/datum/job/specialist,
		/datum/job/psiengineer,
		/datum/job/redactor),

	//UNATHI
		/datum/species/unathi = list(/datum/job/captain, /datum/job/hop, /datum/job/adjutant, /datum/job/outleader, /datum/job/emissary, /datum/job/commissary,
		/datum/job/warden, /datum/job/specialist,
		/datum/job/psiengineer,
		/datum/job/redactor),

	//YOSA
		/datum/species/unathi/yeosa = list(/datum/job/captain, /datum/job/hop, /datum/job/adjutant, /datum/job/outleader, /datum/job/emissary, /datum/job/commissary,
		/datum/job/warden, /datum/job/specialist,
		/datum/job/psiengineer,
		/datum/job/redactor),

	//IPC
		/datum/species/machine = list(/datum/job/captain, /datum/job/adjutant, /datum/job/commissary,
		/datum/job/specialist,
		/datum/job/psiengineer,
		/datum/job/redactor),

	//DIONA
		/datum/species/diona = list(/datum/job/captain, /datum/job/hop, /datum/job/adjutant, /datum/job/outleader, /datum/job/emissary, /datum/job/commissary,
		/datum/job/warden, /datum/job/officer, /datum/job/specialist, /datum/job/outsec, /datum/job/raidlead, /datum/job/raidparty,
		/datum/job/psiengineer,
		/datum/job/redactor,
		/datum/job/ftumerchant_security,),

	//ADHERENT
		/datum/species/adherent = list(/datum/job/captain, /datum/job/hop, /datum/job/adjutant, /datum/job/outleader, /datum/job/emissary, /datum/job/commissary,
		/datum/job/warden, /datum/job/officer, /datum/job/specialist, /datum/job/outsec, /datum/job/raidlead, /datum/job/raidparty,
		/datum/job/psiengineer,
		/datum/job/redactor,
		/datum/job/ftumerchant_security,),

	//SEPRENTID
		/datum/species/nabber = list(/datum/job/captain, /datum/job/hop, /datum/job/adjutant, /datum/job/outleader, /datum/job/emissary, /datum/job/commissary,
		/datum/job/warden, /datum/job/officer, /datum/job/specialist, /datum/job/outsec, /datum/job/raidlead, /datum/job/raidparty,
		/datum/job/psiengineer,
		/datum/job/redactor,
		/datum/job/ftumerchant_security,),
	//VOX
		/datum/species/vox = list(/datum/job/captain, /datum/job/hop, /datum/job/adjutant, /datum/job/outleader, /datum/job/emissary, /datum/job/commissary,
		/datum/job/warden, /datum/job/officer, /datum/job/specialist, /datum/job/outsec, /datum/job/raidlead, /datum/job/raidparty,
		/datum/job/psiengineer,
		/datum/job/redactor,
		/datum/job/ftumerchant_security,),

	)

// Some jobs for nabber grades defined here due to map-specific job datums.
/decl/cultural_info/culture/nabber/New()
	LAZYADD(valid_jobs, /datum/job/scientist)
	..()

/decl/cultural_info/culture/nabber/b/New()
	LAZYADD(valid_jobs, /datum/job/bartender)
	..()

/decl/cultural_info/culture/nabber/a/New()
	LAZYADD(valid_jobs, /datum/job/engineer)
	..()

/decl/cultural_info/culture/nabber/b/New()
	LAZYADD(valid_jobs, /datum/job/chef)
	..()

/decl/cultural_info/culture/nabber/b/New()
	LAZYADD(valid_jobs, /datum/job/bartender)
	..()

/decl/cultural_info/culture/nabber/a/New()
	LAZYADD(valid_jobs, /datum/job/scientist)
	..()

/decl/cultural_info/culture/nabber/a/plus/New()
	LAZYADD(valid_jobs, /datum/job/doctor)
	..()

/datum/job
	required_language = LANGUAGE_SPACER