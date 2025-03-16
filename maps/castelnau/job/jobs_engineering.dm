/datum/job/senior_engineer
	title = "Senior Engineer"
	department = "Engineering"
	department_flag = ENG
	supervisors = "the Captain, the First Mate and the Coordinator"
	selection_color = "#5b4d20"

	total_positions = 1
	spawn_positions = 1
	economic_power = 6
	minimal_player_age = 7
	ideal_character_age = 34
	allowed_branches = list(/datum/mil_branch/reg,
							/datum/mil_branch/mil)
	allowed_ranks = list(/datum/mil_rank/reg = /decl/hierarchy/outfit/job/castelnau/reg/senior_eng,
						/datum/mil_rank/mil/lss = /decl/hierarchy/outfit/job/castelnau/lss/senior_eng,
						/datum/mil_rank/mil/iccg = /decl/hierarchy/outfit/job/castelnau/terran/senior_eng)

	skill_points = 24
	min_skill = list(   SKILL_COMPUTER     = SKILL_BASIC,
						SKILL_BUREAUCRACY  = SKILL_BASIC,
	                    SKILL_EVA          = SKILL_ADEPT,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT,
	                    SKILL_ELECTRICAL   = SKILL_ADEPT,
	                    SKILL_ATMOS        = SKILL_BASIC,
	                    SKILL_ENGINES      = SKILL_ADEPT)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
						SKILL_COMPUTER     = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)

	access = list(
	access_castelnau_bridge,
	access_castelnau_eva,
	access_castelnau_tcoms,
	access_castelnau_netdiag,

	access_castelnau_engineering,
	access_castelnau_engine,
	access_castelnau_atmospherics,
	access_castelnau_thrusters,
	access_castelnau_englab,
	access_castelnau_seneng,
	access_castelnau_maint_tunnels,
	access_castelnau_external_airlocks,
	access_atmospherics,
	access_engine_equip,

	access_castelnau_teleporter
	)

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/shields_monitor)

/datum/job/engineer
	title = "Engineer"
	department = "Engineering"
	department_flag = ENG
	supervisors = "the Senior Engineer"
	selection_color = "#978035"

	total_positions = 2
	spawn_positions = 2
	ideal_character_age = 25
	economic_power = 4

	alt_titles = list(
		"Electrician",
		"Atmospheric Technician",
		"Engineering Trainee")

	allowed_branches = list(
							/datum/mil_branch/mil,
							/datum/mil_branch/par,
							/datum/mil_branch/syndi)
	allowed_ranks = list(
						/datum/mil_rank/mil/lss = /decl/hierarchy/outfit/job/castelnau/lss/eng,
						/datum/mil_rank/mil/iccg = /decl/hierarchy/outfit/job/castelnau/terran/eng,
						/datum/mil_rank/par = /decl/hierarchy/outfit/job/castelnau/par/eng,
						/datum/mil_rank/par/yak = /decl/hierarchy/outfit/job/castelnau/yak/eng,
						/datum/mil_rank/par/barb = /decl/hierarchy/outfit/job/castelnau/barb/eng,
						/datum/mil_rank/syndi = /decl/hierarchy/outfit/job/castelnau/syndi/eng)

	skill_points = 20
	min_skill = list(   SKILL_COMPUTER     = SKILL_BASIC,
	                    SKILL_EVA          = SKILL_ADEPT,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT,
	                    SKILL_ELECTRICAL   = SKILL_BASIC,
	                    SKILL_ATMOS        = SKILL_BASIC,
	                    SKILL_ENGINES      = SKILL_BASIC)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_COMPUTER	   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)


	access = list(
	access_castelnau_eva,

	access_castelnau_engineering,
	access_castelnau_engine,
	access_castelnau_thrusters,
	access_castelnau_maint_tunnels,
	access_castelnau_atmospherics,
	access_castelnau_external_airlocks,
	access_atmospherics,
	access_engine_equip
	)

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/shields_monitor)
/datum/job/psiengineer
	title = "Psi-Engineer"
	department = "Engineering"
	department_flag = ENG
	supervisors = "the Senior Engineer"
	selection_color = "#978035"

	total_positions = 1
	spawn_positions = 1
	ideal_character_age = 25
	economic_power = 4
	give_psionic_implant_on_join = FALSE

//	outfit_type = /decl/hierarchy/outfit/job/castelnau/crew/engineering/engineer
	allowed_branches = list(
							/datum/mil_branch/par, /datum/mil_branch/syndi)
	allowed_ranks = list(
						/datum/mil_rank/par = /decl/hierarchy/outfit/job/castelnau/par/eng/psi,
						/datum/mil_rank/par/barb = /decl/hierarchy/outfit/job/castelnau/barb/eng/psi,
						/datum/mil_rank/syndi = /decl/hierarchy/outfit/job/castelnau/syndi/eng)

	skill_points = 20
	min_skill = list(   SKILL_COMPUTER     = SKILL_BASIC,
	                    SKILL_EVA          = SKILL_ADEPT,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT,
	                    SKILL_ELECTRICAL   = SKILL_BASIC,
	                    SKILL_ATMOS        = SKILL_BASIC,
	                    SKILL_ENGINES      = SKILL_BASIC)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_COMPUTER	   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)


	access = list(
	access_castelnau_eva,

	access_castelnau_engineering,
	access_castelnau_engine,
	access_castelnau_thrusters,
	access_castelnau_maint_tunnels,
	access_castelnau_atmospherics,
	access_castelnau_external_airlocks,
	access_atmospherics,
	access_engine_equip
	)

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/shields_monitor)

/datum/job/psiengineer/equip(var/mob/living/carbon/human/H)
	if(H.mind.role_alt_title == "Psi-Engineer")
		psi_faculties = list("[PSI_PSYCHOKINESIS]" = PSI_RANK_OPERANT)
	return ..()

/datum/job/scientist
	title = "Reverse Engineer"
	department = "Engineering"
	department_flag = ENG
	total_positions = 2
	spawn_positions = 2
	minimal_player_age = 7
	supervisors = "the Senior Engineer"
	alt_titles = list(
		"Biomechanical Engineer")
	economic_power = 4
	ideal_character_age = 45
	selection_color = "#978035"
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_DEVICES     = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_ADEPT)

	max_skill = list(   SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)

//	outfit_type = /decl/hierarchy/outfit/job/castelnau/crew/research/scientist
	allowed_branches = list(
							/datum/mil_branch/mil,
							/datum/mil_branch/par,
							/datum/mil_branch/syndi)
	allowed_ranks = list(
						/datum/mil_rank/mil/lss = /decl/hierarchy/outfit/job/castelnau/lss/eng/rev,
						/datum/mil_rank/mil/iccg = /decl/hierarchy/outfit/job/castelnau/terran/eng/rev,
						/datum/mil_rank/par = /decl/hierarchy/outfit/job/castelnau/par/eng/rev,
						/datum/mil_rank/par/barb = /decl/hierarchy/outfit/job/castelnau/barb/eng/rev,
						/datum/mil_rank/syndi = /decl/hierarchy/outfit/job/castelnau/syndi/eng/rev)

	access = list(
	access_castelnau_eva,

	access_castelnau_engineering,
	access_castelnau_englab,
	access_castelnau_maint_tunnels,
	access_castelnau_external_airlocks
	)

	skill_points = 25
