/datum/job/janitor
	title = "Janitor"
	department = "Service"
	department_flag = SRV

	total_positions = 1
	spawn_positions = 1
	selection_color = "#3caa57"
	supervisors = "the Captain, the First Mate and the Coordinator"
	ideal_character_age = 20
//	outfit_type = /decl/hierarchy/outfit/job/castelnau/crew/service/janitor
	allowed_branches = list(
							/datum/mil_branch/mil,
							/datum/mil_branch/par,
							/datum/mil_branch/other)
	allowed_ranks = list(
						/datum/mil_rank/mil/lss = /decl/hierarchy/outfit/job/castelnau/lss/service/janitor,
						/datum/mil_rank/mil/iccg = /decl/hierarchy/outfit/job/castelnau/terran/service/janitor,
						/datum/mil_rank/par = /decl/hierarchy/outfit/job/castelnau/par/service/janitor,
						/datum/mil_rank/other/free = /decl/hierarchy/outfit/job/castelnau/service/janitor)

	access = list(access_castelnau_janitor,
			      access_castelnau_maint_tunnels,
			      access_castelnau_perseus)


/datum/job/chef
	title = "Chef"
	department = "Service"
	department_flag = SRV
	total_positions = 1
	spawn_positions = 1
	selection_color = "#3caa57"
	supervisors = "the Captain, the First Mate and the Coordinator"
	alt_titles = list(
		"Cook",
		"Culinary Specialist"
		)
//	outfit_type = /decl/hierarchy/outfit/job/castelnau/crew/service/cook
	allowed_branches = list(
							/datum/mil_branch/mil,
							/datum/mil_branch/par,
							/datum/mil_branch/other)
	allowed_ranks = list(
						/datum/mil_rank/mil/lss = /decl/hierarchy/outfit/job/castelnau/lss/service/cook,
						/datum/mil_rank/mil/iccg = /decl/hierarchy/outfit/job/castelnau/terran/service/cook,
						/datum/mil_rank/par = /decl/hierarchy/outfit/job/castelnau/par/service/cook,
						/datum/mil_rank/other/free = /decl/hierarchy/outfit/job/castelnau/service/cook)
	min_skill = list(	SKILL_COOKING   = SKILL_ADEPT,
						SKILL_BOTANY    = SKILL_BASIC,
						SKILL_CHEMISTRY = SKILL_BASIC)

	access = list(access_castelnau_kitchen, access_castelnau_perseus)

/datum/job/bartender
	title = "Bartender"
	department = "Service"
	selection_color = "#3caa57"
	department_flag = SRV
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Captain, the First Mate and the Coordinator"
	ideal_character_age = 30
//	outfit_type = /decl/hierarchy/outfit/job/castelnau/crew/service/bartender
	allowed_branches = list(
							/datum/mil_branch/par,
							/datum/mil_branch/other)
	allowed_ranks = list(
						/datum/mil_rank/par = /decl/hierarchy/outfit/job/castelnau/par/service/bartender,
						/datum/mil_rank/other/free = /decl/hierarchy/outfit/job/castelnau/service/bartender)

	access = list(access_castelnau_bar, access_castelnau_perseus)

	min_skill = list(	SKILL_COOKING   = SKILL_BASIC,
						SKILL_BOTANY    = SKILL_BASIC,
						SKILL_CHEMISTRY = SKILL_BASIC)