/datum/gear/eyes/science/New()
	allowed_roles = RESEARCH_ROLES | EXPLORATION_ROLES
	..()

/datum/gear/eyes/security
	allowed_roles = SECURITY_ROLES

/datum/gear/eyes/medical
	allowed_roles = MEDICAL_ROLES

/datum/gear/eyes/meson
	allowed_roles = list(
		/datum/job/chief_engineer,
		/datum/job/senior_engineer,
		/datum/job/engineer,
		/datum/job/mining,
		/datum/job/scientist_assistant,
		/datum/job/pathfinder,
		/datum/job/explorer,
		/datum/job/scientist,
		/datum/job/rd
	)

/datum/gear/eyes/material
	allowed_roles = list(
		/datum/job/chief_engineer,
		/datum/job/senior_engineer,
		/datum/job/engineer,
		/datum/job/mining,
		/datum/job/scientist_assistant,
		/datum/job/pathfinder,
		/datum/job/explorer
	)
