/obj/item/book/manual/lordania_law
	name = "Lordanian Sovereign Systems Law"
	desc = "A brief overview of Sov Lordania Law."
	icon = 'icons/bos/obj/books.dmi'
	icon_state = "lordlaw"
	author = "Th"
	title = "Lordanian Sovereign Systems Law"

/obj/item/book/manual/lordania_law/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="wiki.bastionofslavs.space/index.php/Lordanian_Sovereign_Systems_Law" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/book/manual/solgov_law
	name = "Sol Central Government Law"
	desc = "A brief overview of SolGov Law."
	icon_state = "bookSolGovLaw"
	author = "The Sol Central Government"
	title = "Sol Central Government Law"

/obj/item/book/manual/solgov_law/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="https://bastion-of-hestia.com/wiki/Sol_Central_Government_Law" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}


/obj/item/book/manual/military_law
	name = "The Sol Code of Uniform Justice"
	desc = "A brief overview of military law."
	icon_state = "bookSolGovLaw"
	author = "The Sol Central Government"
	title = "The Sol Code of Uniform Justice"

/obj/item/book/manual/military_law/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="https://bastion-of-hestia.com/wiki/Sol_Code_of_Uniform_Justice" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}


/obj/item/book/manual/sol_sop
	name = "Standard Operating Procedure"
	desc = "SOP aboard the SGV Dagon."
	icon_state = "booksolregs"
	author = "The Sol Central Government"
	title = "Standard Operating Procedure"

/obj/item/book/manual/sol_sop/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="https://bastion-of-hestia.com/wiki/Standard_Operating_Procedures" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/folder/nt/rd

/obj/item/paper/liason_note
	name = "note"
	info = {"
	<i>Here's your back-out plan.<br>
	H.B.</i>
	"}

/obj/item/folder/envelope/captain
	desc = "A thick envelope. The LSSF crest is stamped in the corner."

/obj/item/folder/envelope/captain/Initialize()
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/item/folder/envelope/captain/LateInitialize()
	..()
	var/memo = {"
	<tt><center><b><font color='red'>СЕКРЕТНО - КОДОВОЕ СЛОВО: АНТАРЕС</font></b>
	<h3>КОМАНДОВАНИЕ ФЛСС</h3>
	<sovlogo>
	</center>
	<b>ОТ:</b> АДМ Дэниэла Швартовского<br>
	<b>КОМУ:</b> Командующему Офицеру ЛРК Антарес<br>
	<b>ТЕМА:</b> Действующие указания<br>
	<hr>
	Капитан.<br>
	Решением военного совета Новелионского военного округа, Вы назначаетесь Командующим Офицером ЛРС «Антарес» - разведывательного корвета класса Мако.
	С момента заступления на должность, Вы несете всю ответственность за судно, его экипаж и своих подчиненных.
	Ваша основная обязанность - контролировать выполнение Миссии ЛРС «Антарес», а также убедиться, что судно безопасно вернется в порт ЛСС по окончании Миссии.
	Миссия ЛРС «Антарес» включает в себя следующие цели:

	-<b>Сбор сведений</b> о военных объектах противника в регионе
	-Организация и проведение специальных <b>диверсионных операций</b>, направленных на снижение военного, экономического, или научного потенциала противника
	-Подготовка <b>плацдарма</b> для расширения зоны влияния ЛСС в регионе
	-Изучение <b>объектов</b> и <b>артефактов</b>, способных дать ЛСС военное, экономическое, или научное преимущество над противником
	<hr>
	Требуется посетить следующие системы:
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[GLOB.using_map.system_name]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<br>
	<b>Слава Суверенной Лордании!</b>
	<i>АДМ Швартовский.</i></tt>
	<i>This paper has been stamped with the stamp of LSSF Command.</i>
	"}
	new/obj/item/paper(src, memo, "Standing Orders")
//	new/obj/item/paper/umbra(src)

/obj/item/folder/envelope/rep
	desc = "A thick envelope. The LSS crest is stamped in the corner, along with 'TOP SECRET - HUSH'."

/obj/item/folder/envelope/rep/Initialize()
	. = ..()
	new/obj/item/paper/umbra(src)

/obj/item/paper/umbra
	name = "ПРОТОКОЛ МОЛЧАНИЕ"
	info = {"
	<tt><center><b><font color='red'>СОВЕРШЕННО СЕКРЕТНО - КОДОВЫЕ СЛОВА: АНТАРЕС МОЛЧАНИЕ</font></b>
	<h3>КАНЦЕЛЯРИЯ ГЕНЕРАЛЬНОГО СЕКРЕТАРЯ МИНИСТЕРСТВА ОБОРОНЫ.</h3>
	<sovlogo>
	</center>
	<b>ОТ:</b> Дэрил Андерсон, Специальный помощник генерального секретаря<br>
	<b>ДЛЯ:</b> Командующий Офицер ЛРС Антарес<br>
	<b>CC:</b> Специальный Представитель от Гильгамешской Колониальной Конфедерации на борту ЛРК Антарес<br>
	<b>ТЕМА:</b> протокол МОЛЧАНИЕ<br>
	<hr>
	Это небольшое дополнение к Стандартным Операционным Процедурам. В отличии от остальной части СОПа, вопрос выполнения данного протокола не оставлен на усмотрение командующему офицеру и является обязательным к исполнению. Как бы непривычно это не смотрелось, мы посчитали, что данный протокол необходим для бесперебойного выполнения Миссии.<br>
	Процедура может быть запущена только через передачу сообщения от Лорданианского Коммандования через защищенный канал. Отправитель может не представить себя, однако у Вас не должно возникнуть проблем с опознаванием источника передачи. По-крайней мере, я на это надеюсь.
	<br>
	Сигналом для начала протокола является последовательность кодовых слов 'ВСЕМ ДОБРОЙ НОЧИ'. Вам не нужно отправлять подтверждение о получении сообщения.
	<li>IЛюбой информации о находках и разведданных, полученных в процессе Миссии, должен быть присвоин статус секретной и жизненно важной для безопасности Лордании. Любое упоминание данной информации должно скрываться за словами 'протокол МОЛЧАНИЕ'.
	Разрешено предоставлять экипажу на борту ЛРС Антарес информацию о протоколе МОЛЧАНИЕ по мере необходимости.</li>
	Любой вызывающие подозрения член персонала, получивший доступ к протоколу МОЛЧАНИЕ должен быть защищен и безопасно доставлен в конечный порт, после чего передан в руки КВД.
	<li>Любые девайсы, способные принимать или передавать информацию на межзвездном расстоянии должны быть конфискованы из частного пользования.</li>
	<li>Игнорируйте любые системы, оставшиеся в планах Миссии. Заместо этого возьмите курс в систему Новелион, орбиту Леона. .</li>
	<br>
	Хоть это и звучит странно, я уверяю, что все это простые меры предосторожности. Просто держите памятку при себе и продолжайте ежедневные обязанности.
	<i>С уважением, Дэрил.</i></tt>
	<i>This paper has been stamped with the stamp of Office of the General Secretary of LSSF.</i>
	"}

/////////
// Inf
/////////
/obj/item/paper/inf
	name = "note"
	info = {"
	<i>Эй, не нужно выносить свои костюмы и пушки за пределы этой комнаты, если вы не собираетесь на высадку.
	<hr>
	Это пиздец как пугает людей. Серьёзно. Не надо.<br>
	Если я ещё кого-то поймаю на камерах, то одним отстранением вы не обойдётесь. Это единственное и последнее предупреждение.<br>
	Запирайте своё снаряжение, делайте свою работу.<br>
	С любовью, Стивен из бухгалтерии.</i>
	"}

/obj/item/paper/inf/dock
	info = {"
	<i>Шлюз Аквиллы снова не работает, а вам срочно нужно захуярить жуков? Не проблема - я договорился по секрету установить второй контроллер прямо на этот стол.<br>
	Если процесс шлюзования сдох, то жмём кнопку <b>"Override"</b> и форсируем оба шлюза.<br>
	С любовью, Стивен из бухгалтерии.</i>
	"}

/obj/item/paper/giftsh
	name = "gift shop note"
	info = {"
	Блять, это не сувенирная лавка, а склад "бери-хватай". Кому мы вообще должны продавать всё это? Пассажирам?<br>
	Все пассажиры - шпионы ЛРА, на кой хрен им футболки с флагом Суверенной Лордании покупать?<br>
	Кто-то ещё и постоянно створки открывает, все блины так рано или поздно расхватают.<br>
	"}


/obj/item/paper/smertniki
	name = "Heart of Evil"
	info = {"
<center>2346-12-04</center>

<center><sovlogo></center>
<hr>
<b>ПОСТАНОВЛЕНИЕ / ПРИКАЗ:</b> ЛОРДА -----КОНТР-АДМИРАЛА ФЛОТА ЛОРДАНИАНСКИХ СУВЕРЕННЫХ СИСТЕМ<br>

<b>КОМУ</b>: СЭРУ СТИВЕНУ  -----МЛАДШЕМУ СЕКРЕТАРЮ ШТАБА ВОЕННОГО ИМПЕРСКОГО КОМИТЕТА<br>

<b>ПРЕДМЕТ</b>: КУРИРОВАНИЕ ОПЕРАЦИИ ФЛОТСКОЙ РАЗВЕДКИ<br>

<b>КОДОВОЕ ИМЯ</b>: СЕРДЦЕ ЗЛА<br>
<br>
Я, КОНТР-АДМИРАЛ ФЛОТА ЛОРДАНИАНСКИХ СУВЕРЕННЫХ СИСТЕМ - -----, СОВМЕСТНО РАЗРАБОТАВ С ОПЕРАТИВНЫМ ШТАБОМ ВОЕННОГО ИМПЕРСКОГО КОМИТЕТА ПЛАН ГРЯДУЩЕЙ ОПЕРАЦИИ ПО РАЗРУШЕНИЮ СИЛ ЦПСС ИЗНУТРИ, НАЗНАЧАЮ СЛЕДУЮЩИЕ СУДА И ИХ ЭКИПАЖ В СОСТАВ СПЕЦИАЛЬНОГО РАЗВЕДЫВАТЕЛЬНОГО ОТРЯДА ФЛОТА ЛОРДАНИАНСКИХ СУВЕРЕННЫХ СИСТЕМ:<br>

 -----, -----, -----,ЛРК "Антарес", -----, -----<br>

ПРИНИМАЯ ВО ВНИМАНИЕ ТОТ ФАКТ, ЧТО  ----- С БОЛЬШОЙ ВЕРОЯТНОСТЬЮ ЗАКОНЧИТСЯ ГЕРОИЧЕСКОЙ СМЕРТЬЮ БОЛЬШЕЙ ЧАСТИ ЕЁ УЧАСТНИКОВ, А ТАКЖЕ, И ТО, ЧТО ПОСТАНОВЛЕНИЕ НИКОИМ ОБРАЗОМ НЕ НАРУШАЕТ ЗАКОНОДАТЕЛЬСТВ СУВЕРЕННОЙ ЛОРДАНИИ, ОФИЦИАЛЬНО НАЗНАЧАЮ ВАС ОТВЕТСТВЕННЫМ ЗА КООРДИНАЦИЮ И КУРИРОВАНИЕ ОПЕРАЦИИ "СЕРДЦЕ ЗЛА", ПОДДЕРЖАНИЕ СВЯЗИ МЕЖДУ ОТРЯДОМ И ЛОРДАНИЕЙ И ОБЕСПЕЧЕНИЕ ТОТАЛЬНОЙ СЕКРЕТНОСТИ О НАМЕРЕНИЯХ ----- ДО ПРИБЫТИЯ В СОЛНЕЧНУЮ СИСТЕМУ, ДАЮ УЧАСТВУЮЩИМ В МИССИИ ВСЕ НЕОБХОДИМЫЕ ПОЛНОМОЧИЯ В РАМКАХ ВООРУЖЕННЫХ СИЛ И ЗАКОНОДАТЕЛЬСТВА ЛСС.<br>

КОМПЬЮТЕРНАЯ СИМУЛЯЦИЯ, ПРОВЕДЁННАЯ НАШИМИ ТОВАРИЩАМИ ИЗ ГКК, ВЫЯВИЛА ШАНС В 96.4% УНИЧТОЖЕНИЯ КОРАБЛЯ, ЧТО АКТИВИРУЕТ  -----. В ХОДЕ ОБСУЖДЕНИЯ БЫЛО РЕШЕНО ПОВЕСИТЬ НА ЛРК "АНТАРЕС" ТЯЖЁЛУЮ НОШУ ПО АКТИВАЦИИ  -----. ГОТОВЬТЕСЬ.<br>

<center>ПОСТАНОВЛЕНИЕ ВСТУПАЕТ В СИЛУ НЕМЕДЛЕННО.​</center><br>
<i>This paper has been stamped with the stamp of Office of the General Secretary of LSSF.</i>
	"}

/obj/item/paper/warhammer
	name = "SCG Bureau of Agriculture"
	info = {"
<center><solcrest></center><br>
<center><b>Бюро Сельского Хозяйства<br>
Центрального Правительства Солнечной Системы</b></center><br>
<center><b>ПОСТАНОВЛЕНИЕ / ПРИКАЗ:</b></center><br>
<hr>
Я, председатель Бюро Сельского Хозяйства ПСС - Шелдон Варкрай, руководствуясь внутренними регламентами, ежемесячными продовольственным отчётами, уставом Бюро Сельского Хозяйства ПСС и Солнечной Ассамблеи, законодательств ПСС,<br>

<b><center>ПРИКАЗЫВАЮ</center></b><br>
-Начать переработку плоти, костей, внутренностей, хрящей, органов и требухи поверженных сынов Отечества<br>
-Заменить продовольственный рацион спресованными брикетами из трупной муки, брусками переработанных пищевых волокон, сублимированными пищевыми личинками<br>
-Выдать административному составу и военным т.н. "карточки рациона" на 20 дней; инженерам, медикам, рабочим стратегически важных предприятий на 10 дней; обеспечить больных дистрофией, детей до 7 лет, стариков продовольственными припасами на 5 дней<br>

<center>Не подведите нас.​</center><br>
<i>This paper has been stamped with the stamp of Office of the Sol Central Government Bureau of Agriculture.</i>
	"}