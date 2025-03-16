/datum/job/captain
	title = "Captain"
	department = "Command"
	supervisors = "the Regulator High Command and the God (He didn't answer last time)"
	department_flag = COM
	head_position = 1
	minimal_player_age = 14
	economic_power = 15
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/castelnau/reg/com/captain
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	allowed_branches = list(/datum/mil_branch/reg)
	allowed_ranks = list(/datum/mil_rank/reg/com)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_ADEPT,
						SKILL_PILOT       = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)


	skill_points = 30


	access = list(
	access_castelnau_command,
	access_castelnau_captain,
	access_castelnau_comoffice,
	access_castelnau_bridge,
	access_castelnau_eva,
	access_castelnau_tcoms,
	access_castelnau_netdiag,
	access_castelnau_idmod,

	access_castelnau_engineering,
	access_castelnau_engine,
	access_castelnau_atmospherics,
	access_castelnau_thrusters,
	access_castelnau_englab,
	access_castelnau_maint_tunnels,
	access_castelnau_external_airlocks,

	access_castelnau_security,
	access_castelnau_brig,
	access_castelnau_armory,
	access_castelnau_sheriff,
	access_castelnau_detective,

	access_castelnau_medical,
	access_castelnau_morgue,

	access_castelnau_bixie,
	access_castelnau_bixie_helm,
	access_castelnau_perseus,
	access_castelnau_perseus_helm,
	access_castelnau_janitor,
	access_castelnau_bar,
	access_castelnau_kitchen,
	access_castelnau_hangar,
	access_castelnau_teleporter
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/reports)

/datum/job/captain/get_description_blurb()
	return "Вы занимаетесь координацией миссии."

/datum/job/hop
	title = "Coordinator"
	supervisors = "the Captain"
	department = "Command"
	department_flag = COM
	head_position = 1
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	minimal_player_age = 14
	economic_power = 8
	ideal_character_age = 45
	outfit_type = /decl/hierarchy/outfit/job/castelnau/reg/com/hop
	allowed_branches = list(/datum/mil_branch/reg)
	allowed_ranks = list(/datum/mil_rank/reg/com)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_ADEPT,
						SKILL_PILOT       = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)

	skill_points = 20

	access = list(
	access_castelnau_command,
	access_castelnau_comoffice,
	access_castelnau_bridge,
	access_castelnau_eva,
	access_castelnau_tcoms,
	access_castelnau_netdiag,
	access_castelnau_idmod,

	access_castelnau_engineering,
	access_castelnau_engine,
	access_castelnau_atmospherics,
	access_castelnau_thrusters,
	access_castelnau_englab,
	access_castelnau_maint_tunnels,
	access_castelnau_external_airlocks,

	access_castelnau_security,
	access_castelnau_brig,
	access_castelnau_armory,
	access_castelnau_detective,

	access_castelnau_medical,
	access_castelnau_morgue,

	access_castelnau_bixie,
	access_castelnau_bixie_helm,
	access_castelnau_perseus,
	access_castelnau_perseus_helm,
	access_castelnau_janitor,
	access_castelnau_bar,
	access_castelnau_kitchen,
	access_castelnau_hangar,
	access_castelnau_teleporter
	)

/datum/job/hop/get_description_blurb()
	return "Вы занимаетесь координацией отдельных задач и важных поручений, а также заменяете Капитана в его отсутствие и можете взять под управление Охрану, если нет Шерифа."


/datum/job/adjutant
	title = "Psi-Navigator"
	supervisors = "the Command"
	department = "Support"
	department_flag = SPT
	head_position = 1
	total_positions = 2
	spawn_positions = 2
	economic_power = 8
	outfit_type = /decl/hierarchy/outfit/job/castelnau/reg/com/adjutant
	selection_color = "#2f2f7f"
	allowed_branches = list(/datum/mil_branch/reg)
	allowed_ranks = list(/datum/mil_rank/reg/com)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_ADEPT,
						SKILL_PILOT       = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
						SKILL_COMBAT      = SKILL_NONE,
						SKILL_WEAPONS      = SKILL_NONE,
						SKILL_HAULING      = SKILL_NONE) //good at psionics, bad at usual combat
	give_psionic_implant_on_join = FALSE
	skill_points = 20

	access = list(
	access_castelnau_command,
	access_castelnau_bridge,
	access_castelnau_eva,
	access_castelnau_tcoms,

	access_castelnau_engineering,
	access_castelnau_maint_tunnels,
	access_castelnau_external_airlocks,

	access_castelnau_security,

	access_castelnau_medical,

	access_castelnau_bixie,
	access_castelnau_bixie_helm,
	access_castelnau_perseus,
	access_castelnau_perseus_helm,
	access_castelnau_janitor,
	access_castelnau_bar,
	access_castelnau_kitchen,
	access_castelnau_hangar,
	access_castelnau_teleporter
	)

/datum/job/adjutant/get_description_blurb()
	return " Вы содействуете командованию, выполняете мелкое координирование и своевременную передачу сообщений.\
	Вы являетесь сильнейшим псиоником на борту, но совершенно бесполезны в дальнем и ближнем бою.\
	Ваша способность к телепатии позволяет мгновенно передавать приказы командования издалека."

/datum/job/adjutant/equip(var/mob/living/carbon/human/H)
	if(H.mind.role_alt_title == "Psi-Navigator")
		psi_faculties = list("[PSI_COERCION]" = PSI_RANK_MASTER, "[PSI_REDACTION]" = PSI_RANK_OPERANT, "[PSI_PSYCHOKINESIS]" = PSI_RANK_OPERANT, "[PSI_ENERGISTICS]" = PSI_RANK_OPERANT)
		H.mutations.Add(mRemotetalk)
		H.verbs += /mob/living/carbon/human/proc/psisay

	var/obj/item/organ/external/E = pick(H.organs)
	if(!BP_IS_ROBOTIC(E))
		E.mutate()
		E.limb_flags |= ORGAN_FLAG_DEFORMED
		E.status |= ORGAN_DISFIGURED
		E.status |= ORGAN_MUTATED
	return ..()

/datum/job/emissary
	title = "Emissary"
	supervisors = "the Alliance Command"
	department = "Command"
	department_flag = COM
	head_position = 1
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 21
	economic_power = 8
	latejoin_at_spawnpoints = 1
	outfit_type = /decl/hierarchy/outfit/job/castelnau/gov/com/emissary
	selection_color = "#304582"
	allowed_branches = list(/datum/mil_branch/gov)
	allowed_ranks = list(/datum/mil_rank/gov)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_ADEPT)

	skill_points = 25

	access = list(
	access_castelnau_command,
	access_castelnau_emissary,
	access_castelnau_bridge,
	access_castelnau_eva,
	access_castelnau_tcoms,

	access_castelnau_engineering,
	access_castelnau_maint_tunnels,
	access_castelnau_external_airlocks,

	access_castelnau_security,

	access_castelnau_medical,

	access_castelnau_bixie,
	access_castelnau_bixie_helm,
	access_castelnau_perseus,
	access_castelnau_perseus_helm,
	access_castelnau_janitor,
	access_castelnau_bar,
	access_castelnau_kitchen,
	access_castelnau_hangar,
	access_castelnau_teleporter
	)

/datum/job/captain/get_description_blurb()
	return "Вы наблюдаете за тем, чтобы Лунная Конвенция работала, а интересы Альянса не нарушались.\
	Используйте свою неприкосновенность по полной."

/datum/job/commissary
	title = "Commissary"
	department = "Support"
	department_flag = SPT
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Galactic Security Corps"
	selection_color = "#304582"
	economic_power = 8
	minimal_player_age = 21
	latejoin_at_spawnpoints = 1
	outfit_type = /decl/hierarchy/outfit/job/castelnau/gov/com/commissary
	allowed_branches = list(
		/datum/mil_branch/gov
	)
	allowed_ranks = list(
		/datum/mil_rank/gov/kgb
	)
	min_skill = list(   SKILL_EVA        = SKILL_BASIC,
	                    SKILL_COMBAT     = SKILL_BASIC,
	                    SKILL_WEAPONS    = SKILL_ADEPT)

	max_skill = list(   SKILL_COMBAT       = SKILL_MAX,
	                    SKILL_WEAPONS      = SKILL_MAX,
	                    SKILL_PILOT        = SKILL_MAX,
	                    SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX)
	skill_points = 24


	access = list(
	access_castelnau_command,
	access_castelnau_commissary,
	access_castelnau_bridge,
	access_castelnau_eva,
	access_castelnau_tcoms,

	access_castelnau_engineering,
	access_castelnau_maint_tunnels,
	access_castelnau_external_airlocks,

	access_castelnau_security,

	access_castelnau_medical,

	access_castelnau_bixie,
	access_castelnau_bixie_helm,
	access_castelnau_perseus,
	access_castelnau_perseus_helm,
	access_castelnau_janitor,
	access_castelnau_bar,
	access_castelnau_kitchen,
	access_castelnau_hangar,
	access_castelnau_teleporter
	)

	software_on_spawn = list(/datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/commissary/get_description_blurb()
	return "Вы занимаетесь поддержанием морального духа лорданиан, подавлением антилорданианских настроений.\
	 Не стесняйтесь доставать свой маузер, если какой-то отброс с улицы посчитал себя важнее вас."
