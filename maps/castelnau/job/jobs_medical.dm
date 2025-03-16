/datum/job/senior_doctor
	title = "Surgeon"
	department = "Medical"
	department_flag = MED

	minimal_player_age = 7
	ideal_character_age = 45
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Coordinator"
	selection_color = "#013d3b"
	economic_power = 6
	outfit_type = /decl/hierarchy/outfit/job/castelnau/reg/med/surgeon
	allowed_branches = list(/datum/mil_branch/reg)
	allowed_ranks = list(
		/datum/mil_rank/reg
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_MEDICAL     = SKILL_ADEPT,
	                    SKILL_ANATOMY     = SKILL_EXPERT,
	                    SKILL_CHEMISTRY   = SKILL_BASIC,
	                    SKILL_VIROLOGY    = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_VIROLOGY    = SKILL_MAX)
	skill_points = 26

	access = list(
	access_castelnau_command,
	access_castelnau_bridge,
	access_castelnau_eva,

	access_castelnau_maint_tunnels,
	access_castelnau_external_airlocks,

	access_castelnau_medical,
	access_castelnau_morgue,

	access_castelnau_teleporter
	)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors)

/datum/job/doctor
	title = "Doctor"
	department = "Medical"
	department_flag = MED
	selection_color = "#029b97"

	total_positions = 2
	spawn_positions = 2
	supervisors = "the Surgeon and the Coordinator"
	economic_power = 5
	ideal_character_age = 40
	alt_titles = list(
		"Paramedic",
		"Chemist")

	allowed_branches = list(
							/datum/mil_branch/mil,
							/datum/mil_branch/par,
							/datum/mil_branch/syndi)
	allowed_ranks = list(
						/datum/mil_rank/mil/lss = /decl/hierarchy/outfit/job/castelnau/lss/med,
						/datum/mil_rank/mil/iccg = /decl/hierarchy/outfit/job/castelnau/terran/med,
						/datum/mil_rank/par = /decl/hierarchy/outfit/job/castelnau/par/med/doctor,
						/datum/mil_rank/syndi = /decl/hierarchy/outfit/job/castelnau/syndi/med)
	min_skill = list(   SKILL_MEDICAL   = SKILL_BASIC,
		                SKILL_CHEMISTRY = SKILL_BASIC,
	                    SKILL_ANATOMY   = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_VIROLOGY    = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)
	access = list()

	software_on_spawn = list(/datum/computer_file/program/suit_sensors)
	skill_points = 22

	access = list(
	access_castelnau_eva,

	access_castelnau_maint_tunnels,
	access_castelnau_external_airlocks,

	access_castelnau_medical,
	access_castelnau_morgue
	)


/datum/job/redactor
	title = "Redactor"
	total_positions = 1
	department_flag = MED
	spawn_positions = 1
	economic_power = 4
	minimal_player_age = 0
	selection_color = "#029b97"
	supervisors = "the Surgeon and the Coordinator"
	give_psionic_implant_on_join = FALSE
//	outfit_type = /decl/hierarchy/outfit/job/torch/crew/medical/counselor

	allowed_branches = list(
							/datum/mil_branch/par,
							/datum/mil_branch/syndi,
							/datum/mil_branch/other)
	allowed_ranks = list(
						/datum/mil_rank/par = /decl/hierarchy/outfit/job/castelnau/par/med/doctor,
						/datum/mil_rank/other/free = /decl/hierarchy/outfit/job/castelnau/med/doctor,
						/datum/mil_rank/syndi = /decl/hierarchy/outfit/job/castelnau/syndi/med)
	skill_points = 30
	min_skill = list(
		SKILL_BUREAUCRACY = SKILL_BASIC,
		SKILL_MEDICAL     = SKILL_BASIC
	)
	max_skill = list(
		SKILL_MEDICAL     = SKILL_MAX
	)
	software_on_spawn = list(
		/datum/computer_file/program/suit_sensors,
		/datum/computer_file/program/camera_monitor
	)
	access = list(
	access_castelnau_eva,

	access_castelnau_maint_tunnels,
	access_castelnau_external_airlocks,

	access_castelnau_medical,
	access_castelnau_morgue
	)

/datum/job/redactor/equip(var/mob/living/carbon/human/H)
	psi_faculties = list("[PSI_REDACTION]" = PSI_RANK_GRANDMASTER)
	return ..()
