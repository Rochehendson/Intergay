/datum/event/supply_pod
	announceWhen = 5

/datum/event/supply_pod/announce()
	command_announcement.Announce("В окрестностях аванпоста на Кадаабе было зафиксировано падение дроп-пода неизвестной принадлежности и происхождения. Мы рекомендуем вам как можно скорее обнаружить его и завладеть его содержимым.", zlevels = affecting_z)

/datum/event/supply_pod/start()
	var/drop_type = pick(supply_drop_random_loot_types())
	var/drop_x = rand(10, 90)
	var/drop_y = rand(10, 90)
	var/drop_z = 11 //Z level of Caddab(probably?)
	new /datum/random_map/droppod/supply(null, drop_x, drop_y, drop_z, supplied_drop = drop_type)
