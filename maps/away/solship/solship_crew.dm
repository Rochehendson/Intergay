/obj/effect/submap_landmark/joinable_submap/solship
	name = "LPS Diablo"
	archetype = /decl/submap_archetype/solship

/decl/submap_archetype/solship
	descriptor = "LSS Patrol Ship"
	map = "Patrol Ship"
	crew_jobs = list(
		/datum/job/submap/solship,
		/datum/job/submap/solship/medic,
		/datum/job/submap/solship/engineer,
		/datum/job/submap/solship/captain
	)

/obj/effect/submap_landmark/spawnpoint/solship
	name = "Orbital Trooper"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/effect/submap_landmark/spawnpoint/solship/captain
	name = "Patrol Ship Captain"

/obj/effect/submap_landmark/spawnpoint/solship/medic
	name = "Patrol Ship Corpsman"

/obj/effect/submap_landmark/spawnpoint/solship/engineer
	name = "Patrol Ship Technician"

/* JOBS
 * =======
 */
/datum/job/submap/solship
	title = "Orbital Trooper"
	total_positions = 2
	outfit_type = /decl/hierarchy/outfit/job/solship/crew/fleet/troop
	supervisors = "captain"
	loadout_allowed = TRUE
	is_semi_antagonist = TRUE
	info = "Вы член орбитального десанта ЛСС. Скорее всего Вы только недавно прошли боевое крещение и для Вас это одна из первых миссий. \
			Из-за нехватки кадров Ваш отряд на время этой миссии управляется флотским капитаном. Хотя эта система под названием Мьёльнир кишит пиратами, в ней действуют наёмники, работающие на ЛСС и взявшие на себя их основной удар на планетах. \
			Обычная патрульная миссия, ещё и облегчённая наёмниками, в деятельность которых командование попросило не вмешиваться без веских причин. Ничто не сможет посрамить Вашу честь орбитального десантника."
	required_language = LANGUAGE_HUMAN_LORD
	whitelisted_species = list(SPECIES_HUMAN)

	branch = /datum/mil_branch/larmarine
	rank = /datum/mil_rank/larmarine/e3

	min_skill = list(SKILL_COMBAT  = SKILL_BASIC,
					 SKILL_WEAPONS = SKILL_BASIC,
					 SKILL_HAULING = SKILL_BASIC,
					 SKILL_MEDICAL = SKILL_BASIC,
					 SKILL_EVA = SKILL_BASIC)
	access = list(access_away_solship_main)

/datum/job/submap/solship/captain
	title = "Patrol Ship Captain"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/solship/crew/fleet/captain
	supervisors = "LSS Command"
	info = "Вы капитан патрульного корабля ЛСС. Для Вас это скорее всего не первая миссия такого толка. \
			Хотя эта система под названием Мьёльнир кишит пиратами, в ней действуют наёмники, работающие на ЛСС и взявшие на себя их основной удар на планетах. Командование попросило не вмешиваться в их дела без особых причин. \
			Типичная патрульная миссия - разве что под Ваше командование вдруг выдали отряд орбитального десанта(чёрт побери эту нехватку кадров). Осмотреть пару станций, проверить нет ли в системе других посетителей, кроме наёмников... И, конечно, внимательно следить за этими самыми наёмниками..."
	branch = /datum/mil_branch/larfleet
	rank = /datum/mil_rank/larfleet/o4
	min_skill = list(SKILL_COMBAT  = SKILL_BASIC,
					 SKILL_WEAPONS = SKILL_BASIC,
					 SKILL_HAULING = SKILL_BASIC,
					 SKILL_MEDICAL = SKILL_BASIC,
					 SKILL_EVA = SKILL_BASIC)
	access = list(access_away_solship_main, access_away_solship_eng, access_away_solship_captain, access_away_solship_med)

/datum/job/submap/solship/medic
	title = "Patrol Ship Corpsman"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/solship/crew/fleet/medic
	supervisors = "captain"
	info = "Вы медик патрульного корабля ЛСС. Для Вас это скорее всего не первая миссия такого толка. \
			Хотя эта система под названием Мьёльнир кишит пиратами, в ней действуют наёмники, работающие на ЛСС и взявшие на себя их основной удар на планетах. Командование попросило не вмешиваться в их дела без особых причин. \
			Типичная патрульная миссия - разве что к Вам на корабль засадили отряд орбитального десанта, сдав их под командование Вашего капитана. Что может пойти не так?"
	branch = /datum/mil_branch/larfleet
	rank = /datum/mil_rank/larfleet/e4
	min_skill = list(SKILL_COMBAT  = SKILL_BASIC,
					 SKILL_WEAPONS = SKILL_BASIC,
					 SKILL_HAULING = SKILL_ADEPT,
					 SKILL_MEDICAL = SKILL_EXPERT,
					 SKILL_ANATOMY = SKILL_BASIC,
					 SKILL_CHEMISTRY = SKILL_BASIC,
					 SKILL_EVA = SKILL_BASIC)
	access = list(access_away_solship_main, access_away_solship_med)

/datum/job/submap/solship/engineer
	title = "Patrol Ship Technician"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/solship/crew/fleet/engineer
	info = "Вы инженер патрульного корабля ЛСС. Для Вас это скорее всего не первая миссия такого толка. \
			Хотя эта система под названием Мьёльнир кишит пиратами, в ней действуют наёмники, работающие на ЛСС и взявшие на себя их основной удар на планетах. Командование попросило не вмешиваться в их дела без особых причин. \
			Типичная патрульная миссия - разве что к Вам на корабль засадили отряд орбитального десанта, сдав их под командование Вашего капитана. Что может пойти не так? "
	branch = /datum/mil_branch/larfleet
	rank = /datum/mil_rank/larfleet/e4
	min_skill = list(SKILL_COMBAT  = SKILL_BASIC,
					 SKILL_WEAPONS = SKILL_BASIC,
					 SKILL_HAULING = SKILL_ADEPT,
					 SKILL_MEDICAL = SKILL_BASIC,
					 SKILL_EVA = SKILL_ADEPT,
					 SKILL_CONSTRUCTION = SKILL_ADEPT,
					 SKILL_ELECTRICAL = SKILL_ADEPT,
					 SKILL_ATMOS  = SKILL_BASIC,
					 SKILL_ENGINES = SKILL_ADEPT,
					 SKILL_DEVICES = SKILL_BASIC)
	access = list(access_away_solship_main, access_away_solship_eng)

/*Give military branches
/datum/job/submap/solship/equip(mob/living/carbon/human/H, alt_title, datum/mil_branch/branch, datum/mil_rank/grade)
	. = ..()
	var/obj/item/card/id/id = locate(/obj/item/card/id) in H.contents
	id.handle_set_var(id, var_value = pick(allowed_branches))
	id.handle_set_var(id, var_value = pick(allowed_ranks))*/

/* ACCESS
 * =======
 */

/var/const/access_away_solship_main= "SOL_MAIN_ACCESS"
/var/const/access_away_solship_eng = "SOL_ENGINEERING_ACCESS"
/var/const/access_away_solship_captain = "SOL_CAPTAIN_ACCESS"
/var/const/access_away_solship_med = "SOL_MEDIC_ACCESS"

/datum/access/access_away_solship_main
	id = access_away_solship_main
	desc = "Patrol Ship Main Access"
	region = ACCESS_REGION_NONE

/datum/access/access_away_solship_eng
	id = access_away_solship_eng
	desc = "Patrol Ship Engineering Access"
	region = ACCESS_REGION_NONE

/datum/access/access_away_solship_captain
	id = access_away_solship_captain
	desc = "Patrol Ship Captain Access"
	region = ACCESS_REGION_NONE

/datum/access/access_away_solship_med
	id = access_away_solship_med
	desc = "Patrol Ship Medical Access"
	region = ACCESS_REGION_NONE
