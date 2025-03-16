/datum/job/warden
	title = "Sheriff"
	department = "Security"
	department_flag = COM|SEC
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Captain, the First Mate and the Coordinator"
	economic_power = 8
	minimal_player_age = 14
	ideal_character_age = 35
	outfit_type = /decl/hierarchy/outfit/job/castelnau/reg/com/sheriff
	allowed_branches = list(/datum/mil_branch/reg)
	allowed_ranks = list(/datum/mil_rank/reg/com)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_HAULING	  = SKILL_ADEPT,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_ADEPT,
	                    SKILL_FORENSICS   = SKILL_ADEPT)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_FORENSICS   = SKILL_MAX)
	skill_points = 25

	access = list(
	access_castelnau_command,
	access_castelnau_bridge,
	access_castelnau_eva,

	access_castelnau_maint_tunnels,
	access_castelnau_external_airlocks,

	access_castelnau_security,
	access_castelnau_brig,
	access_castelnau_armory,
	access_castelnau_detective,
	access_castelnau_sheriff,

	access_castelnau_morgue,

	access_castelnau_perseus,
	access_castelnau_perseus_helm,

	access_castelnau_teleporter
	)

/datum/job/officer
	title = "Security Contractor"
	department = "Security"
	alt_titles = list() // This is a hack. Overriding a list var with null does not actually override it due to the particulars of dm list init. Do not "clean up" without testing.
	department_flag = SEC
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Sheriff"
	selection_color = "#9e2e2e"
	economic_power = 6
	minimal_player_age = 7
	ideal_character_age = 25

	skill_points = 20

	allowed_branches = list(
							/datum/mil_branch/mil,
							/datum/mil_branch/syndi)
	allowed_ranks = list(
						/datum/mil_rank/mil/lss = /decl/hierarchy/outfit/job/castelnau/lss/security,
						/datum/mil_rank/mil/iccg = /decl/hierarchy/outfit/job/castelnau/terran/security,
						/datum/mil_rank/syndi/army = /decl/hierarchy/outfit/job/castelnau/syndi/army/security,
						/datum/mil_rank/syndi/arbites = /decl/hierarchy/outfit/job/castelnau/syndi/arbites/security)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_HAULING     = SKILL_ADEPT,
	                    SKILL_WEAPONS     = SKILL_ADEPT,
	                    SKILL_FORENSICS   = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX)

	access = list(
	access_castelnau_eva,

	access_castelnau_maint_tunnels,
	access_castelnau_external_airlocks,

	access_castelnau_security,
	access_castelnau_brig
	)

/datum/job/specialist
	title = "Psi-Interrogator"
	department = "Security"
	department_flag = SEC
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Sheriff"
	selection_color = "#9e2e2e"
	economic_power = 6
	minimal_player_age = 7
	ideal_character_age = 25
	give_psionic_implant_on_join = FALSE
	skill_points = 20

	outfit_type = /decl/hierarchy/outfit/job/castelnau/sec/detective
	allowed_branches = list(/datum/mil_branch/other,
							/datum/mil_branch/syndi)
	allowed_ranks = list(/datum/mil_branch/syndi = /decl/hierarchy/outfit/job/castelnau/syndi/detective,
						/datum/mil_rank/other/free = /decl/hierarchy/outfit/job/castelnau/sec/detective)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_HAULING     = SKILL_ADEPT,
	                    SKILL_WEAPONS     = SKILL_BASIC,
	                    SKILL_FORENSICS   = SKILL_ADEPT)

	max_skill = list(   SKILL_COMBAT      = SKILL_EXPERT,
	                    SKILL_WEAPONS     = SKILL_EXPERT,
	                    SKILL_FORENSICS   = SKILL_MAX)
	access = list(
	access_castelnau_command,
	access_castelnau_bridge,
	access_castelnau_eva,

	access_castelnau_maint_tunnels,
	access_castelnau_external_airlocks,

	access_castelnau_brig,
	access_castelnau_detective,

	access_castelnau_morgue
	)

/datum/job/specialist/equip(var/mob/living/carbon/human/H)
	if(H.mind.role_alt_title == "Psi-Interrogator")
		psi_faculties = list("[PSI_COERCION]" = PSI_RANK_OPERANT)
	return ..()
