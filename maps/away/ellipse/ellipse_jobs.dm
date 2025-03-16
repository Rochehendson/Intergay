/obj/effect/submap_landmark/joinable_submap/ellipse
	name = "Ellipse Ship"
	archetype = /decl/submap_archetype/ellipse

/decl/submap_archetype/ellipse
	descriptor = "Ellipse Ship"
	map = "Ellipse Ship"
	crew_jobs = list(
		/datum/job/submap/ellipse_operator
	)

/obj/effect/submap_landmark/spawnpoint/ellipse_operator
	name = "Operator"

/decl/hierarchy/outfit/job/ellipse/operator
	name = OUTFIT_JOB_NAME("Ellipse Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/ellipse/operator
	uniform = /obj/item/clothing/under/color/black
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types= list(/obj/item/card/id/ellipse)

/datum/job/submap/ellipse_operator
	title = "Operator"
	total_positions = 1
	info = "Your vessel is scouting through unknown space, working to map out any potential dangers, as well as potential allies. Also seek for any knowledge and artifacts."
	is_semi_antagonist = TRUE
	outfit_type = /decl/hierarchy/outfit/job/ellipse/operator
	whitelisted_species = list(SPECIES_IPC)
	loadout_allowed = TRUE
	min_skill = list(SKILL_EVA = SKILL_ADEPT,
					SKILL_PILOT = SKILL_ADEPT,
					SKILL_HAULING = SKILL_ADEPT,
					SKILL_COMBAT = SKILL_ADEPT,
					SKILL_WEAPONS = SKILL_ADEPT,
					SKILL_SCIENCE = SKILL_ADEPT)
	access = list(access_ellipse)
