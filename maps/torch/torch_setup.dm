/datum/map/torch/setup_map()
	..()
	system_name = generate_system_name()
	minor_announcement = new(new_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45))

//original//
/datum/map/torch/get_map_info()
	. = list()
	. += "Добро пожаловать на борт этого прекрасного, величественного и недавно освобожденного от грязных, подлых и несчастных предателей Великой Лордании - ЛРК Антарес. "
	. += "Стоим мы в столь герметичном, чистом, практичном и удобном помещении лишь старанием нашего несравненно великого правителя - Лорд-Протектора Суверенных Систем Лордании Бориса Букера, а так же непомерно щедрой помощи наших трижды благословлённых соратников, ГКК."
	. += ""
	. += "Мы находимся на передовой, в любой момент трусливые твари из Ассоциации Патриотов Лордании, которые откинули братские узы ради проклятого ЦПСС, могут нанести подлый удар."
	. += "Куроподобные мрази, воксами именуемые, собирают свою мусорную империю, желая ввергнуть всё человечество в ещё более тёмные века."
	. += "Разноцветные амфибии, ОСС скреллов, обьявили войну Солу, и готовы в любой момент перекинуть и на нас свой взор."
	. += ""
	. += "Мир опасен, но не забывайте: Мы не просто на передовой наших границ, мы на передовой технического превосходства над трусливыми предателями благодаря нашим непревзойдённым ученым!"
	. += "На передовой защиты наших душ и душ наших близких благодаря самым обученным и снабженным морпехам!"
	. += "На передовой новых свершений для Суверенной Лордании, благодаря каждому из нас!"
	. += ""
	. += "А теперь вперёд, во славу Лордании!"
	return jointext(., "<br>")

//final_event//
/*
/datum/map/torch/get_map_info()
	. = list()
	. += "<b>Вы покидаете</b> борт этого прекрасного, величественного и давно освобожденного от грязных, подлых и несчастных предателей Великой Лордании - ЛРК Антарес."
	. += "Стоим мы на столь родной, но прогнившей Земле лишь старанием нашего несравненно великого правителя - Лорд-Протектора Бориса Букера, решишвего вести нас в финальный бой, а также непомерно щедрой помощи наших трижды благословлённых соратников, ГКК."
	. += ""
	. += "Мы находимся в самом центре пекла, трусливые твари из Ассоциации Патриотов Лордании проникли в наши ряды, а ЦПСС нагло продолжает слать волны самоубийц."
	. += "Пока начинался штурм Марса, верхушка правительства ЦПСС в страхе сбежала на Землю, и именно вы должны высадиться в окраине аркологии Боснии и уничтожить их раз и навсегда."
	. += ""
	. += "Мир опасен, но не забывайте: Мы не просто в самом центре Сола, мы в самом центре истории благодаря непревзойдённым терранским офицерам!"
	. += "На передовой защиты наших душ и душ наших близких благодаря самому обученному и снабжённому союзнику - ГКК!"
	. += "На передовой новых свершений для Суверенной Лордании, благодаря каждому из нас!"
	. += ""
	. += "Крысы спрятались в здании Суда, так будьте же им судьями!"
	return jointext(., "<br>")
*/

/datum/map/torch/send_welcome()
	var/obj/effect/overmap/visitable/torch = map_sectors["1"]
	var/welcome_text = "<center><br /><font size = 3><b>LRS Antares</b> просканировал систему</font><br>"
	welcome_text += "Отчёт сгенерирован [stationdate2text()] в [stationtime2text()]</center><br /><br />"
	welcome_text += "<hr>Текущая система:<br /><b>[torch ? system_name : "Unknown"]</b><br /><br>"

	var/list/space_things = list()

	welcome_text += "Текущие координаты:<br /><b>[torch.x]:[torch.y]</b><br /><br>"
	welcome_text += "Следующая система:<br /><b>[generate_system_name()]</b><br /><br>"
	welcome_text += "Лететь до Солнечной системы:<br /><b>[rand(15,45)] дней</b><br /><br>"
	welcome_text += "Времени с последнего визита в порт:<br /><b>[rand(60,180)] дней</b><br /><hr>"
	welcome_text += "Точки интереса:<br />"

	for(var/zlevel in map_sectors)
		var/obj/effect/overmap/visitable/O = map_sectors[zlevel]
		if(O.name == torch.name)
			continue
		if(istype(O, /obj/effect/overmap/visitable/ship/landable)) //Don't show shuttles
			continue
		if (O.hide_from_reports)
			continue
		space_things |= O

	var/list/distress_calls
	for(var/obj/effect/overmap/visitable/O in space_things)
		var/location_desc = " at present co-ordinates."
		if(O.loc != torch.loc)
			var/bearing = round(90 - Atan2(O.x - torch.x, O.y - torch.y),5) //fucking triangles how do they work
			if(bearing < 0)
				bearing += 360
			location_desc = ", на [bearing]."
		if(O.has_distress_beacon)
			LAZYADD(distress_calls, "[O.has_distress_beacon][location_desc]")
		welcome_text += "<li>\A <b>[O.name]</b>[location_desc]</li>"

	if(LAZYLEN(distress_calls))
		welcome_text += "<br><b>Сигналы бедствия:</b><br>[jointext(distress_calls, "<br>")]<br>"
	else
		welcome_text += "<br>Сигналы бедствия отсутствуют.<br />"
	welcome_text += "<hr>"

	post_comm_message("Показания сенсоров LRS Antares", welcome_text)
	minor_announcement.Announce(message = "Новое сообщение от [GLOB.using_map.company_name] доступно на консолях коммуникации.")
