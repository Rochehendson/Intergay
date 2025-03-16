/datum/job/chiefmerchant
	title = "Chief Merchant"
	department = "Auxiliary"
	department_flag = COM|SUP
	total_positions = 1
	spawn_positions = 1
	supervisors = "the invisible hand of the market"
	minimal_player_age = 14
	economic_power = 18
	selection_color = "#4f3e30"
	allowed_branches = list(
		/datum/mil_branch/ftu
	)
	allowed_ranks = list(
		/datum/mil_rank/ftu/qm
	)
	outfit_type = /decl/hierarchy/outfit/job/cheapskate/chief
	latejoin_at_spawnpoints = 1
	access = list()
	min_skill = list(   SKILL_FINANCE = SKILL_ADEPT,
						SKILL_PILOT	  = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)
	skill_points = 30

	access = list(
					access_castelnau_cheapskate_chief,

					access_castelnau_cheapskate_security,

					access_castelnau_cheapskate,
					access_castelnau_cheapskate_helm,

					access_castelnau_cheapskate_cargo,
					access_castelnau_cheapskate_shop,

					access_castelnau_bixie,
					access_castelnau_bixie_helm,

					access_castelnau_teleporter)



/datum/job/ftumerchant
	title = "Merchant"
	department = "Auxiliary"
	department_flag = SUP
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Chief Merchant"
	minimal_player_age = 7
	economic_power = 10
	selection_color = "#755c48"
	outfit_type = /decl/hierarchy/outfit/job/cheapskate/merchant
	allowed_branches = list(
		/datum/mil_branch/ftu
	)
	allowed_ranks = list(
		/datum/mil_rank/ftu
	)
	latejoin_at_spawnpoints = 1
	access = list()
	min_skill = list(   SKILL_FINANCE = SKILL_ADEPT,
						SKILL_PILOT	  = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)
	skill_points = 25

	access = list(
					access_castelnau_cheapskate,
					access_castelnau_cheapskate_helm,

					access_castelnau_cheapskate_shop,

					access_castelnau_bixie)

/datum/job/ftumerchant_security
	title = "FTU Security Guard"
	department = "Security"
	department_flag = SEC
	total_positions = 1
	spawn_positions = 1
	supervisors = "the FTU merchants"
	economic_power = 6
	selection_color = "#755c48"
	outfit_type = /decl/hierarchy/outfit/job/cheapskate/security
	allowed_branches = list(
		/datum/mil_branch/ftu
	)
	allowed_ranks = list(
		/datum/mil_rank/ftu/sec
	)
	latejoin_at_spawnpoints = 1
	access = list()
	min_skill = list(   SKILL_FINANCE = SKILL_ADEPT,
						SKILL_PILOT	  = SKILL_BASIC,
						SKILL_COMBAT      = SKILL_BASIC,
						SKILL_WEAPONS     = SKILL_BASIC,
	                    SKILL_HAULING     = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
						SKILL_COMBAT      = SKILL_EXPERT,
						SKILL_WEAPONS     = SKILL_EXPERT,
	                    SKILL_HAULING     = SKILL_MAX)
	skill_points = 24

	access = list(
					access_castelnau_cheapskate,
					access_castelnau_cheapskate_security,

					access_castelnau_bixie)
