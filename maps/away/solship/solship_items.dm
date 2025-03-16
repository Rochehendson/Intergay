/* CARDS
 * ========
 */

/obj/item/card/id/solship
	desc = "An identification card issued to LSS crewmembers."
	icon_state = "base"
	color = "#666666"
	access = list(access_away_solship_main)

/obj/item/card/id/solship/engineer
	desc = "An identification card issued to LSS crewmembers."
	access = list(access_away_solship_main, access_away_solship_eng, access_engine_equip)

/obj/item/card/id/solship/medic
	desc = "An identification card issued to LSS crewmembers."
	access = list(access_away_solship_main, access_away_solship_med)

/obj/item/card/id/solship/captain
	desc = "An identification card issued to LSS crewmembers."
	access = list(access_away_solship_main, access_away_solship_eng, access_away_solship_med, access_away_solship_captain)
	military_branch = /datum/mil_branch/larfleet
	military_rank = /datum/mil_rank/larfleet/o4

/* RADIOHEADS
 * ========
 */

/obj/item/device/radio/headset/gunship
	name = "patrol team radio headset"
	desc = "The headset of the patrol team member."
	icon_state = "com_headset"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/gunship

/obj/item/device/encryptionkey/gunship
	name = "\improper patrol radio encryption key"
	icon_state = "cargo_cypherkey"
	channels = list("Response Team" = 1)

/* CLOTHING
 * ========
 */
/*
/obj/item/clothing/under/solgov/utility/fleet/command/captain
	accessories = list(/obj/item/clothing/accessory/solgov/department/command/fleet, /obj/item/clothing/accessory/solgov/specialty/pilot, /obj/item/clothing/accessory/solgov/rank/fleet/officer/o4, /obj/item/clothing/accessory/solgov/fleet_patch/fifth)

/obj/item/clothing/under/solgov/utility/fleet/engineering/away_solship
	accessories = list(/obj/item/clothing/accessory/solgov/department/engineering/fleet, /obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e5, /obj/item/clothing/accessory/solgov/fleet_patch/fifth)

/obj/item/clothing/under/solgov/utility/fleet/medical/away_solship
	accessories = list(/obj/item/clothing/accessory/solgov/department/medical/fleet, /obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e5, /obj/item/clothing/accessory/solgov/fleet_patch/fifth)

/obj/item/clothing/under/solgov/utility/fleet/away_solship
	accessories = list(/obj/item/clothing/accessory/solgov/department/command/fleet, /obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e4, /obj/item/clothing/accessory/solgov/fleet_patch/fifth)
= No more Sol = */

/obj/item/clothing/under/lordan/utility/green/lss_ship_marine
	accessories = list(/obj/item/clothing/accessory/lordan/rank/marine/enlisted/e3, /obj/item/clothing/accessory/badge/lordan/tags/marine)

/obj/item/clothing/under/lordan/utility/fleet/lss_ship_medick
	accessories = list(/obj/item/clothing/accessory/lordan/rank/fleet/enlisted/e4, /obj/item/clothing/accessory/lordan/department/medical/fleet)

/obj/item/clothing/under/lordan/utility/fleet/lss_ship_engineer
	accessories = list(/obj/item/clothing/accessory/lordan/rank/fleet/enlisted/e4, /obj/item/clothing/accessory/lordan/department/engineering/fleet)

/obj/item/clothing/suit/storage/toggle/lordan/service/fleet/officer/lss_ship_lead
	accessories = list(/obj/item/clothing/accessory/lordan/rank/fleet/officer/o4, /obj/item/clothing/accessory/lordan/department/command/fleet)

/* MISC
 * ========
 */
/obj/item/paper/lordinf
	name = "command briefing"
	language = LANGUAGE_HUMAN_LORD
	info = {"
<center><sovlogo>
<b>Центральное командование пограничных войск ЛСС</b></center>
<hr>
Ваш корабль направлен на патрулирование системы Мьёльнир. Напомним вам, что в ней, на спутнике планеты Инакс, работают нанятные правительством наёмники - регуляторы.
Для вас лучше всего будет не вмешиваться в их дела, только если их не уличат в антилорданианской деятельности. Пусть эти отбросы проливают свою кровь за нас.
Основной целью патруля является поиск и устранения ксеноугроз в секторе, а также защита внепланетной собственности ЛСС.
<br>
Мы надеемся, что лорданианский патрульный корабль Диабло, его экипаж и орбитальный десант готовы справиться с сложностями Мьёльнира.
Диабло переоборудован из захваченного у ЦПСС корабля. Пришло время очистить его имя свершениями во славу Лордании.
<hr>
<i>This paper has been stamped with the stamp of LSS Central Command.</i>
"}

/obj/item/rig/military/sol
	name = "SCG hardsuit control module"
	desc = "A sleek and dangerous hardsuit for active combat."
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_AP,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SMALL,
		rad = ARMOR_RAD_MINOR
		)

/decl/hierarchy/outfit/sol_military
	name = "SOL military solder"

	uniform = /obj/item/clothing/under/solgov/utility/fleet
	head = /obj/item/clothing/head/solgov/utility/fleet
	shoes = /obj/item/clothing/shoes/dutyboots
	l_ear = /obj/item/device/radio/headset/gunship
	back = /obj/item/rig/military/sol

	id_types= list(/obj/item/card/id/solship)
	id_slot = slot_wear_id

	id_pda_assignment = "Soldier"

/obj/effect/landmark/corpse/sol_military
	name = "SOL military solder"
	corpse_outfits = list(/decl/hierarchy/outfit/sol_military)
	spawn_flags = CORPSE_SPAWNER_NO_RANDOMIZATION
