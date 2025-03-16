/datum/map/castelnau
	default_assistant_title = "Off-Duty"

/datum/job/assistant
	title = "Off-Duty"
	total_positions = 0
	alt_titles = list("Assistant")
	spawn_positions = 0
	department = "Civilian"
	department_flag = CIV
	supervisors = "the Captain and the Coordinator"
	selection_color = "#515151"
	economic_power = 6
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/castelnau/par
	allowed_branches = list(
							/datum/mil_branch/par,
							/datum/mil_branch/syndi,
							/datum/mil_branch/other)
	allowed_ranks = list(
						/datum/mil_rank/par,
						/datum/mil_rank/syndi = /decl/hierarchy/outfit/job/castelnau/syndi,
						/datum/mil_rank/par/yak = /decl/hierarchy/outfit/job/castelnau/yak,
						/datum/mil_rank/other/free = /decl/hierarchy/outfit/job/castelnau)

	access = list(access_castelnau_perseus)

/datum/job/wanderer
	title = "Wanderer"
	total_positions = 6
	spawn_positions = 6
	supervisors = "your conscience"
	selection_color = "#515151"
	department = "Civilian"
	department_flag = CIV
	economic_power = 0
	skill_points = 25
	announced = FALSE
	create_record = 0
	latejoin_at_spawnpoints = 1
	outfit_type = /decl/hierarchy/outfit/job/castelnau/wanderer
	allowed_branches = list(/datum/mil_branch/other)
	allowed_ranks = list(/datum/mil_rank/other)
	give_psionic_implant_on_join = FALSE
	required_language = LANGUAGE_HUMAN_LORD

/datum/job/wanderer/get_description_blurb()
	return "Вы являетесь жителем или временным посетителем Кадааба. Ваша предыстория и мотивы ограничиваются лишь вашей фантазией"
