/decl/submap_archetype/cadaab
	descriptor = "Cadaab"
	map = "Cadaab"
	crew_jobs = list(
//		/datum/job/submap/barbar,
//		/datum/job/submap/barbar/lead,
		/datum/job/submap/bookerist,
		/datum/job/submap/constable,
		/datum/job/submap/deputy
	)

/obj/effect/submap_landmark/joinable_submap/cadaab
	name = "Cadaab"
	archetype = /decl/submap_archetype/cadaab
/*
/datum/job/submap/barbar
	title = "Tech-barbarian"
	total_positions = 2
	outfit_type = /decl/hierarchy/outfit/job/cadaab/barbar
	supervisors = "The Tech-barbarian Warlord and the Tech-barbarian Shaman"
	info = "Жестокие члены варварской цивилизации Кадааба восхваляют механизмы и силу, \
	постоянно находясь в поисках затерянной технологии и тех, у кого её можно отобрать. \
	Подчиняясь говорящему с духами машин Шаману, эти племенные отбросы должны отстоять землю Кадааба за собой, \
	принеся чужаков в жертву своим механических божествам."
	loadout_allowed = FALSE
	allowed_branches = list(/datum/mil_branch/other)
	allowed_ranks = list(/datum/mil_rank/other)
	required_language = LANGUAGE_HUMAN_LORD
	is_semi_antagonist = TRUE
	min_skill = list(   SKILL_DEVICES = SKILL_BASIC,
						SKILL_SCIENCE     = SKILL_ADEPT,
						SKILL_COMBAT      = SKILL_BASIC,
						SKILL_WEAPONS     = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
						SKILL_SCIENCE     = SKILL_MAX,
						SKILL_COMBAT      = SKILL_MAX,
						SKILL_WEAPONS     = SKILL_MAX)
	skill_points = 18

/datum/job/submap/barbar/lead
	title = "Tech-barbarian Shaman"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/cadaab/barbar/lead
	supervisors = "The Tech-barbarian Warlord"
	info = "После того, как вождь ушёл на восток в поисках священных артефактов, оставшихся после смерти железных богов, \
	власть над общиной перешла в руки к наделённому магией и просветлением старцу. \
	Обладая авторитетом и благословением синтетических духов, Шаман должен координировать рейдерский отряд, \
	чтобы дать отпор чужакам и разобрать их стальных птиц на священные болтики и заклёпочки."
	skill_points = 22

/datum/job/submap/barbar/lead/equip(var/mob/living/carbon/human/H)
	psi_faculties = list("[PSI_REDACTION]" = PSI_RANK_GRANDMASTER)
	return ..()
*/
/obj/item/clothing/under/techbarbarian
	name = "tech-barbarian clothes"
	desc = "Techno-barbarians have access to reverse engineering, but can't get normal clothes?"
	icon = 'maps/away/cadaab/icons/clothing_obj.dmi'
	item_icons = list(slot_w_uniform_str = 'maps/away/cadaab/icons/clothing_onmob.dmi')
	icon_state = "lbarbar"
	item_state = "lbarbar"
	worn_state = "lbarbar"
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
		)

/obj/item/clothing/under/techbarbarian/lead
	name = "tech-barbarian ceremoial clothes"
	icon_state = "barbar"
	item_state = "barbar"
	worn_state = "barbar"

/obj/item/clothing/head/techbarbarian
	name = "tech-barbarian cover"
	desc = "Techno-barbarians have access to reverse engineering, but can't get normal clothes?"
	icon = 'maps/away/cadaab/icons/clothing_obj.dmi'
	icon_state = "lbarbarhead"
	item_state = "lbarbarhead"
	item_icons = list(slot_head_str = 'maps/away/cadaab/icons/clothing_onmob.dmi')
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
		)

/obj/item/clothing/head/techbarbarian/lead
	name = "tech-barbarian ceremonial cover"
	icon_state = "barbarhead"
	item_state = "barbarhead"

/decl/hierarchy/outfit/job/cadaab/barbar
	name = "Tech-barbarian"
	l_ear = null
	r_ear = null
	uniform = /obj/item/clothing/under/techbarbarian
	head = 	/obj/item/clothing/head/techbarbarian
	shoes = /obj/item/clothing/shoes/sandal
	pda_type = null
	pda_slot = null
	id_types = list()

/decl/hierarchy/outfit/job/cadaab/barbar/lead
	name = "Tech-barbarian Shaman"
	uniform = /obj/item/clothing/under/techbarbarian/lead
	head = 	/obj/item/clothing/head/techbarbarian/lead
/*
/obj/effect/submap_landmark/spawnpoint/cadaab_barbar
	name = "Tech-barbarian"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/effect/submap_landmark/spawnpoint/cadaab_barbarlead
	name = "Tech-barbarian Shaman"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE
*/

/datum/job/submap/bookerist
	title = "Lord-Protectorism Cultist"
	total_positions = 4
	outfit_type = /decl/hierarchy/outfit/job/cadaab/bookerist
	supervisors = "Lord-Protector Boris Booker"
	info = "Вы служите верой и правдой истинному лидеру Суверенной Лордании - Лорд-протектору Борису Букеру.\
	Хотя грязные терранские предатели и объявили его погибшим, вы в это не верите.\
	Докажите заблудшим лорданианцам и глупым терранцам, что единственный Бог - Борис Букер, а вы никакой не безумец попавший под влияние культа личности пропагандистского символа."
	loadout_allowed = FALSE
	allowed_branches = list(/datum/mil_branch/other)
	allowed_ranks = list(/datum/mil_rank/other)
	required_language = LANGUAGE_HUMAN_LORD
	is_semi_antagonist = TRUE
	min_skill = list(	SKILL_COMBAT      = SKILL_ADEPT,
						SKILL_WEAPONS     = SKILL_ADEPT)

	max_skill = list(	SKILL_COMBAT      = SKILL_MAX,
						SKILL_WEAPONS     = SKILL_MAX)

/decl/hierarchy/outfit/job/cadaab/bookerist
	name = OUTFIT_JOB_NAME("Bookerist")
	uniform = /obj/item/clothing/under/lordan/utility/fleet/combat
	head = /obj/item/clothing/head/beret/lordan/fleet
	mask = /obj/item/clothing/mask/gas/swat/booker
	shoes = /obj/item/clothing/shoes/lordan
	id_types = list()

/obj/effect/submap_landmark/spawnpoint/cadaab_bookerist
	name = "Lord-Protectorism Cultist"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/datum/job/submap/constable
	title = "Constable"
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/cadaab/constable
	supervisors = "Lordanian government, Comissary"
	info = "В обстановке неразберихи Вы и Ваш подчиненный следите за сохранением закона в этой проклятой пустыне.\
	Наемники, аборигены, да даже этот сопляк – каждый может оказаться террористом.\
	Безоговорочно помогайте Комиссару в уничтожении шпионов, расследуйте преступления, заставьте каждого преступника бояться Вас!"
	loadout_allowed = TRUE
	allowed_branches = list(/datum/mil_branch/other)
	allowed_ranks = list(/datum/mil_rank/other)
	required_language = LANGUAGE_HUMAN_LORD
	access = list(access_cadaab_constable, access_cadaab_prison)
	is_semi_antagonist = TRUE
	min_skill = list(	SKILL_COMBAT      = SKILL_BASIC,
						SKILL_WEAPONS     = SKILL_BASIC,
						SKILL_FORENSICS   = SKILL_ADEPT)

	max_skill = list(	SKILL_COMBAT      = SKILL_MAX,
						SKILL_WEAPONS     = SKILL_MAX,
						SKILL_FORENSICS   = SKILL_MAX)

/decl/hierarchy/outfit/job/cadaab/constable
	name = OUTFIT_JOB_NAME("Constable")
	uniform = /obj/item/clothing/under/syndicate/combat
	suit = /obj/item/clothing/suit/storage/par/pol
	head = /obj/item/clothing/head/cowboy_hat/constable
	shoes = /obj/item/clothing/shoes/dutyboots
	glasses = /obj/item/clothing/glasses/sunglasses
	id_types = list(/obj/item/card/id/constable)

/obj/item/clothing/head/cowboy_hat/constable
	name = "blue cowboy hat"
	desc = "Patrooling the Cadaab makes you wish for the nuclear winter."
	icon = 'maps/away/cadaab/icons/clothing_obj.dmi'
	icon_state = "constablehat"
	item_state = "constablehat"
	item_icons = list(slot_head_str = 'maps/away/cadaab/icons/clothing_onmob.dmi')
	body_parts_covered = 0

/datum/job/submap/deputy
	title = "Deputy"
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/cadaab/deputy
	supervisors = "Constable, Lordanian government, Comissary"
	info = "Вы помогаете Констеблю и Комиссару расследовать преступления, снимать отпечатки и ловить преступников.\
	Носите выпивку Констеблю, учитесь у 'лучшего криминалиста на этой гребаной планете'™️, допрашивайте злых ребят."
	loadout_allowed = TRUE
	allowed_branches = list(/datum/mil_branch/other)
	allowed_ranks = list(/datum/mil_rank/other)
	required_language = LANGUAGE_HUMAN_LORD
	is_semi_antagonist = TRUE
	access = list(access_cadaab_prison)
	min_skill = list(	SKILL_COMBAT      = SKILL_BASIC,
						SKILL_WEAPONS     = SKILL_BASIC,
						SKILL_FORENSICS   = SKILL_BASIC)

	max_skill = list(	SKILL_COMBAT      = SKILL_MAX,
						SKILL_WEAPONS     = SKILL_MAX,
						SKILL_FORENSICS   = SKILL_MAX)

/decl/hierarchy/outfit/job/cadaab/deputy
	name = OUTFIT_JOB_NAME("Deputy")
	uniform = /obj/item/clothing/under/syndicate/combat
	suit = /obj/item/clothing/suit/storage/par/pol
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/deputy)

/obj/effect/submap_landmark/spawnpoint/cadaab_constable
	name = "Constable"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/effect/submap_landmark/spawnpoint/cadaab_deputy
	name = "Deputy"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/var/const/access_cadaab_prison = "ACCESS_CADAAB_PRISON"
/datum/access/castelnau/cadaab_prison
	id = access_cadaab_prison
	desc = "Cadaab Prison Cells"
	region = ACCESS_REGION_GENERAL
	access_type = ACCESS_TYPE_NONE

/var/const/access_cadaab_constable = "ACCESS_CADAAB_CONSTABLE"
/datum/access/castelnau/cadaab_constable
	id = access_cadaab_constable
	desc = "Cadaab Constable"
	region = ACCESS_REGION_GENERAL
	access_type = ACCESS_TYPE_NONE


/obj/item/card/id/constable
	desc = "An identification card issued to the Cadaab Police Department."
	job_access_type = /datum/job/submap/constable
	color = COLOR_OFF_WHITE
	detail_color = COLOR_MAROON
	military_branch = "Cadaab Police Department"
	military_rank = "Senior"

/obj/item/card/id/deputy
	desc = "An identification card issued to the Cadaab Police Department."
	job_access_type = /datum/job/submap/deputy
	color = COLOR_OFF_WHITE
	detail_color = COLOR_MAROON
	military_branch = "Cadaab Police Department"
	military_rank = "Junior"

/obj/structure/closet/secure_closet/deputy
	name = "deputy's locker"
	req_access = list(access_cadaab_prison)

/obj/structure/closet/secure_closet/deputy/WillContain()
	return list(
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/device/radio/headset,
		/obj/item/storage/belt/general,
		/obj/item/storage/belt/holster/general,
		/obj/item/melee/telebaton,
		/obj/item/device/flash,
		/obj/item/device/megaphone,
		/obj/item/material/clipboard,
		/obj/item/device/holowarrant,
		/obj/item/folder/blue,
		/obj/item/material/knife/folding/swiss,
		/obj/item/gunbox,
		/obj/item/gun/energy/stunrevolver,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack, /obj/item/storage/backpack/satchel/grey)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag, /obj/item/storage/backpack/messenger))
	)

/obj/structure/closet/secure_closet/constable
	name = "constable's locker"
	req_access = list(access_cadaab_constable)

/obj/structure/closet/secure_closet/constable/WillContain()
	return list(
		/obj/item/device/radio/headset,
		/obj/item/storage/belt/holster/security,
		/obj/item/device/flash,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/grenade/chem_grenade/teargas,
		/obj/item/melee/baton/loaded,
		/obj/item/taperoll/police,
		/obj/item/device/hailer,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/gunbox,
		/obj/item/device/megaphone,
		/obj/item/clothing/gloves/thick,
		/obj/item/device/holowarrant,
		/obj/item/device/flashlight/maglight,
		/obj/item/storage/belt/security,
		/obj/item/material/knife/folding/swiss,
		/obj/item/gun/energy/stunrevolver,
		/obj/item/gun/energy/stunrevolver/rifle,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/security, /obj/item/storage/backpack/satchel/sec)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag/sec, /obj/item/storage/backpack/messenger/sec))
	)