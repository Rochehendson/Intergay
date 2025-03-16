/datum/map/castelnau // setting the map to use this list
	security_state = /decl/security_state/default/castelnaudept

//castelnau map alert levels. Refer to security_state.dm.
/decl/security_state/default/castelnaudept
	all_security_levels = list(/decl/security_level/default/castelnaudept/code_green, /decl/security_level/default/castelnaudept/code_violet, /decl/security_level/default/castelnaudept/code_orange, /decl/security_level/default/castelnaudept/code_blue, /decl/security_level/default/castelnaudept/code_red, /decl/security_level/default/code_delta)

/decl/security_level/default/castelnaudept
	icon = 'maps/castelnau/icons/security_state.dmi'

/decl/security_level/default/castelnaudept/code_green
	name = "Протокол: Длань"
	icon = 'icons/misc/security_state.dmi'

	light_max_bright = 0.25
	light_inner_range = 0.1
	light_outer_range = 1
	light_color_alarm = COLOR_GREEN
	light_color_status_display = COLOR_GREEN

	overlay_alarm = "alarm_green"
	overlay_status_display = "status_display_green"

	var/static/datum/announcement/priority/security/security_announcement_green = new(do_log = 0, do_newscast = 1, new_sound = sound('sound/misc/notice2.ogg'))

/decl/security_level/default/castelnaudept/code_green/switching_down_to()
	security_announcement_green.Announce("Угрозы для миссии отсутствуют, активирован протокол 'Длань'. Всем членам миссии необходимо вернуться в штатный режим работы.")
	notify_station()

/decl/security_level/default/castelnaudept/code_violet
	name = "Протокол: Скальпель"

	light_max_bright = 0.5
	light_inner_range = 1
	light_outer_range = 2
	light_color_alarm = COLOR_VIOLET
	light_color_status_display = COLOR_VIOLET

	overlay_alarm = "alarm_violet"
	overlay_status_display = "status_display_violet"

	up_description = "В зоне действия миссии обнаружен опасный микроорганизм. От членов миссии требуется соблюдать все необходимые санитарные норма. Корабль ВТС 'Скряга' должен произвести отстыковку."
	down_description = "Микроорганизм был уничтожен или изолирован. Члены миссии могут продолжать работу в штатном режиме."

/decl/security_level/default/castelnaudept/code_orange
	name = "Протокол: Меч"

	light_max_bright = 0.5
	light_inner_range = 1
	light_outer_range = 2
	light_color_alarm = COLOR_ORANGE
	light_color_status_display = COLOR_ORANGE
	overlay_alarm = "alarm_orange"
	overlay_status_display = "status_display_orange"

	up_description = "Активирован протокол 'Меч'. Членам миссии разрешается приступить к массовому освоению близлежащих земель и беспорядочному уничтожению всех противников."
	down_description = "Протокол 'Меч' деактивирован. Все члены миссии должны вернуться на территорию аванпоста или Кастельнау."


/decl/security_level/default/castelnaudept/code_blue
	name = "Протокол: Кинжал"
	icon = 'icons/misc/security_state.dmi'

	light_max_bright = 0.5
	light_inner_range = 1
	light_outer_range = 2
	light_color_alarm = COLOR_BLUE
	light_color_status_display = COLOR_BLUE
	overlay_alarm = "alarm_blue"
	overlay_status_display = "status_display_blue"

	up_description = "В зоне действия миссии обнаружена потенциальная угроза для хода миссии. Членам миссии рекомендуется соблюдать осторожность. Полномочия службы безопасности расширены."
	down_description = "Угроза для миссии вышла из статуса критической, но продолжает существовать. Полномочия службы безопасности понижены."

/decl/security_level/default/castelnaudept/code_red
	name = "Протокол: Щит"
	icon = 'icons/misc/security_state.dmi'

	light_max_bright = 0.75
	light_inner_range = 1
	light_outer_range = 3
	light_color_alarm = COLOR_RED
	light_color_status_display = COLOR_RED
	overlay_alarm = "alarm_red"
	overlay_status_display = "status_display_red"

	var/static/datum/announcement/priority/security/security_announcement_red = new(do_log = 0, do_newscast = 1, new_sound = sound('sound/misc/redalert1.ogg'))

/decl/security_level/default/castelnaudept/code_red/switching_up_to()
	security_announcement_red.Announce("Обнаружена критическая угроза для хода миссии. Служба безопасности получает максимальные полномочия до её устранения.")
	notify_station()
	GLOB.using_map.unbolt_saferooms()

/decl/security_level/default/castelnaudept/code_red/switching_down_to()
	security_announcement_red.Announce("Ракетные базы Нова-Кубы деактивированы, угроза уничтожения корабля более не релевантна.")
	notify_station()
