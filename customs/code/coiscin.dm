/obj/item/clothing/accessory/haori_coiscin
	name = "old haori"
	desc = "An old haori with an unknown symbol on its back."
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	icon_state = "voxcoat"
	inv_overlay = 'customs/icons/obj/custom_items_obj_inv_accessory.dmi'
	slot = ACCESSORY_SLOT_DECOR
	accessory_icons = list(slot_w_uniform_str = 'customs/icons/mob/custom_items_mob.dmi', slot_wear_suit_str = 'customs/icons/mob/custom_items_mob.dmi')

/obj/item/clothing/accessory/katana_coiscin
	name = "katana and tanto"
	desc = "A cracked katana and a tanto with glyphs of the Vox language, as a symbol of the once greatness of the Vox Empire."
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	icon_state = "katana"
	item_state = "katana"
	inv_overlay = 'customs/icons/obj/custom_items_obj_inv_accessory.dmi'
	force = 10
	slot = ACCESSORY_SLOT_DECOR
	accessory_icons = list(slot_w_uniform_str = 'customs/icons/mob/custom_items_mob.dmi', slot_wear_suit_str = 'customs/icons/mob/custom_items_mob.dmi')
	item_icons = list(
		slot_l_hand_str = 'customs/icons/mob/custom_items_lhand.dmi',
		slot_r_hand_str = 'customs/icons/mob/custom_items_rhand.dmi',
		)

/obj/item/clothing/under/coiscin
	name = "kimono"
	desc = "An old and already well-worn kimono, but the quality of the fabric is still amazing, and tactile sensations give a pleasant feeling to the owner of this thing. An incomprehensible symbol is visible on the back."
	icon_state = "kimono"
	worn_state = "kimono"
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	item_icons = list(slot_w_uniform_str = 'customs/icons/mob/custom_items_mob.dmi')
	species_restricted = list(SPECIES_VOX)
	sprite_sheets = list(
		SPECIES_VOX = 'customs/icons/mob/custom_items_mob.dmi')

/obj/item/clothing/head/helmet/biker/cross/coiscin
	name = "cross helmet"
	desc = "a cross motorcycle helmet, the package includes glasses and a can of Space Bull"
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	icon_state = "motohelmet"
	icon_state_open = "motohelmet_open"
	item_icons = list(slot_head_str = 'customs/icons/mob/custom_items_mob.dmi')
	item_flags = 0
	flags_inv = 0

/obj/item/music_player/boombox/coiscin
	name = "electric guitar"
	desc = "black electronic guitar with synthesizer module, on the back wall you can see the mark «From B.S. to Yaka»."
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	icon_state = "guitar"
	item_state = "guitar"
	tape = /obj/item/music_tape/custom/coiscin

	item_icons = list(
		slot_l_hand_str = 'customs/icons/mob/custom_items_lhand.dmi',
		slot_r_hand_str = 'customs/icons/mob/custom_items_rhand.dmi',
		slot_back_str = 'customs/icons/mob/custom_items_mob.dmi',
		)

	sprite_sheets = list(
		SPECIES_VOX = 'customs/icons/mob/custom_items_mob.dmi')

	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_LARGE

	throwforce = 10
	throw_speed = 2
	throw_range = 10
	force = 10


/obj/item/music_tape/custom/coiscin
	name = "draftbook page"
	desc = "A draft of a song with its words, notes, chords and other useful features for musicians."
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	icon_state = "page"
	w_class = ITEM_SIZE_TINY

/obj/item/music_tape/custom/coiscin/Initialize()
	. = ..()
	if(random_color)
		icon_state = "page"

/obj/item/notebook_coiscin
	name = "draftbook"
	desc = "A black notebook with inserted pages, an intimidating mask is depicted on the front side, and on the first page there is a small text in the vox dialect."
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	icon_state = "note"
	randpixel = 0
	throwforce = 1
	w_class = ITEM_SIZE_SMALL
	throw_speed = 3
	throw_range = 7
	layer = BELOW_OBJ_LAYER
	var/amount = 30					//How much paper is in the bin.

/obj/item/notebook_coiscin/attackby(obj/item/i as obj, mob/user as mob)
	if(istype(i, /obj/item/music_tape/custom/coiscin))
		if(!user.unEquip(i, src))
			return
		to_chat(user, "<span class='notice'>You put [i] in [src].</span>")
		amount++

/obj/item/notebook_coiscin/examine(mob/user, distance)
	. = ..()
	if(distance <= 1)
		if(amount)
			to_chat(user, "<span class='notice'>There " + (amount > 1 ? "are [amount] papers" : "is one paper") + " in the note.</span>")
		else
			to_chat(user, "<span class='notice'>There are no papers in the note.</span>")

/obj/item/notebook_coiscin/MouseDrop(mob/user as mob)
	if((user == usr && (!( usr.restrained() ) && (!( usr.stat ) && (usr.contents.Find(src) || in_range(src, usr))))))
		if(!istype(usr, /mob/living/carbon/slime) && !istype(usr, /mob/living/simple_animal))
			if( !usr.get_active_hand() )		//if active hand is empty
				var/mob/living/carbon/human/H = user
				var/obj/item/organ/external/temp = H.organs_by_name[BP_R_HAND]

				if (H.hand)
					temp = H.organs_by_name[BP_L_HAND]
				if(temp && !temp.is_usable())
					to_chat(user, "<span class='notice'>You try to move your [temp.name], but cannot!</span>")
					return
	if(amount >= 1)
		amount--
		var/obj/item/music_tape/custom/coiscin/P
		P = new /obj/item/music_tape/custom/coiscin
		user.put_in_hands(P)
		to_chat(user, "<span class='notice'>You take [P] out of the [src].</span>")
	else
		to_chat(user, "<span class='notice'>[src] is empty!</span>")

	add_fingerprint(user)
	return
/obj/item/document_coiscin
	name = "document"
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	w_class = ITEM_SIZE_TINY
	attack_verb = list("whipped")
	hitsound = 'sound/weapons/towelwhip.ogg'
	var/info
	var/doc_type

/obj/item/document_coiscin/proc/show(mob/user as mob)
	var/output = "<html><head><title>document</title></head>"
	output += "<body style='overflow:hidden;margin:0;text-align:center'>"
	output += "<img src='[doc_type].png' style='-ms-interpolation-mode:nearest-neighbor' />"
	output += "</body></html>"
	show_browser(user, output, "window=book")
	onclose(user, "document")
	return

/obj/item/document_coiscin/examine(mob/user, distance)
	. = TRUE
	if(distance <= 1)
		show(user)
		to_chat(user, desc)
	else
		to_chat(user, SPAN_NOTICE("It is too far away."))

/obj/item/document_coiscin/attack_self(mob/user as mob)
	show(user)
	user.visible_message(
		SPAN_ITALIC("[user] opens and checks [src]."),
		SPAN_ITALIC("You open [src] and check for some main information."),
		SPAN_ITALIC("You hear the faint rustle of pages."),
		5
	)
	to_chat(user, info || SPAN_WARNING("[src] is completely blank!"))

/obj/item/document_coiscin/passport
	name = "ICCG passport"
	icon_state = "passport"
	desc = "A passport from the Independent Colonial Confederation of Gilgamesh."
	info = "\nName: Yakahakichaki-Tikiyahitika\nSpecies: IPC\nGender: M\nAge: 4\nPlace of Birth: Vega\nFingerprint: n/A"
	doc_type = "passport"

/obj/item/document_coiscin/workpass
	name = "workpass"
	icon_state = "workpass"
	desc = "Workpass issued to citizens of other states when officially employed on the territory or object of Lordania."
	info = "\nName: Yakahakichaki-Tikiyahitika\nMastered specialties: pilot, cook, information security technician, nurse, junior engineer, roboticist, lawyer, accountant, secretary\nValid until: 2351.23.06"
	doc_type = "workpass"

/obj/item/document_coiscin/lorvisa
	name = "Lordania visa"
	icon_state = "lorvisa"
	desc = "A visa issued by the Government of Lordania for the purpose of free movement on the territory of its state, or staying at its facilities."
	info = "\nName: Yakahakichaki-Tikiyahitika\nPassport number: 213-321-124\nPurpose: work\nDuration: 4 years\nDate: 2346.23.06"
	doc_type = "lordaniavisa"

/obj/item/mech_component/chassis/bike
	name = "motorcycle frame"
	desc = "The frame of the old bike, all serial numbers have long been lost and it is unclear what kind of Frankenstein is in front of you"
	on_mech_icon = 'customs/icons/mob/mech_bike_coiscin_custom.dmi'
	icon_state = "bike_body"
	pilot_coverage = 20
	max_damage = 30
	power_use = 0
	has_hardpoints = null
	climb_time = 5

/obj/item/mech_component/chassis/bike/prebuild()
	. = ..()
	m_armour = new /obj/item/robot_parts/robot_component/armour/exosuit(src)

/obj/item/mech_component/chassis/bike/Initialize()
	pilot_positions = list(
		list(
			"[NORTH]" = list("x" = 10,  "y" = 6),
			"[SOUTH]" = list("x" = 9,  "y" = 6),
			"[EAST]"  = list("x" = 10,  "y" = 6),
			"[WEST]"  = list("x" = 6,  "y" = 6)
		),
		list(
			"[NORTH]" = list("x" = 10,  "y" = 6),
			"[SOUTH]" = list("x" = 9,  "y" = 6),
			"[EAST]"  = list("x" = 1,  "y" = 6),
			"[WEST]"  = list("x" = 15,  "y" = 6)
		)
	)
	. = ..()

/obj/item/robot_parts/robot_component/armour/exosuit/bike
	name = "plastic for motorcycle"
	desc = "Nothing that could protect the engine from shooting or grenades, but flying stones, falls and branches can quite reflect themselves."
	armor = list("melee" = 30, "bullet" = 15, "laser" = 15, "energy" = 10, "bomb" = 20, "bio" = 100, "rad" = 10)
	origin_tech = list(TECH_MATERIAL = 1)

/obj/item/mech_component/sensors/bike
	name = "dashboard"
	gender = PLURAL
	exosuit_desc_string = "dashboard removed from the new exosuit"
	desc = "A primitive set of sensors designed to work in tandem with most MKI Eyeball platforms."
	on_mech_icon = 'customs/icons/mob/mech_bike_coiscin_custom.dmi'
	icon_state = "bike_head"
	max_damage = 20
	power_use = 0
	has_hardpoints = list(HARDPOINT_HEAD)

/obj/item/mech_component/propulsion/bike
	name = "wheels with spikes"
	exosuit_desc_string = "old shabby wheels with randomly sticking spikes, such a wheel will not really cause damage to the enemy, but it looks cool and the grip is not bad"
	desc = "Old wheels removed from somewhere, you can't even imagine who else rides on wheeled vehicles, savages"
	on_mech_icon = 'customs/icons/mob/mech_bike_coiscin_custom.dmi'
	icon_state = "bike_legs"
	max_damage = 20
	move_delay = 0.5
	turn_delay = 2
	power_use = 10

/obj/item/mech_component/manipulators/bike
	name = "bike steering wheel"
	exosuit_desc_string = "the steering wheel is the most important thing in a motorcycle, it is connected to the guide wheel and the pilot directs it to the side.....why did you remember that"
	desc = "What do you want to know after seeing this? This is some kind of stick... horror...."
	on_mech_icon = 'customs/icons/mob/mech_bike_coiscin_custom.dmi'
	icon_state = "bike_arms"
	melee_damage = 0
	action_delay = 15
	max_damage = 15
	power_use = 10
	has_hardpoints = 0

/obj/item/mech_equipment/light/bike
	name = "headlight"
	desc = "it's just a headlight, an ordinary one..."
	icon_state = "biker_light"

/mob/living/exosuit/premade/bike
	name = "nomad's dirt bike"
	desc = "Transportation of the old world of humanity. A battered bike of Ash Dust - vox nomad, which expels the most repulsed deliveries. There are a lot of stickers and inscriptions on the shields and plastic, but alas, many of them have either lost color in the sun or worn out under the influence of adverse weather."
	wreckage_path = /obj/structure/mech_wreckage
	mech_turn_sound = 'customs/sound/bike_TU_engine.ogg'
	mech_step_sound = 'customs/sound/bike_MO_engine.ogg'
	mech_powerup_sound = 'customs/sound/bike_ST_engine.ogg'
	mech_shutdown_sound = 'customs/sound/bike_SH_engine.ogg'


/mob/living/exosuit/premade/bike/Initialize()
	if(!legs)
		legs = new /obj/item/mech_component/propulsion/bike(src)
	if(!head)
		head = new /obj/item/mech_component/sensors/bike(src)
	if(!body)
		body = new /obj/item/mech_component/chassis/bike(src)
	if(!arms)
		arms = new /obj/item/mech_component/manipulators/bike(src)
	. = ..()

/mob/living/exosuit/premade/bike/spawn_mech_equipment()
	install_system(new /obj/item/mech_equipment/light/bike(src), HARDPOINT_HEAD)

/mob/living/exosuit/premade/bike/attackby(var/obj/item/thing, var/mob/user)
    if(istype(thing, /obj/item/stack/material/phoron))
        if(body.cell.charge <= body.cell.maxcharge - 100)
            body.cell.charge = body.cell.charge + 100
            to_chat(user, "You add a little phoron to your fuel tank. Don't even think about smoking now!")
        else
            body.cell.charge = body.cell.maxcharge
            to_chat(user, "The tank is filled with a slide, no more phoron is needed.")
        var/obj/item/stack/material/phoron/fuel = thing
        fuel.use(1)
    . = ..()

/obj/item/coiscin/teleport
	name = "bike teleporter"
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	icon_state = "teleporter"

/obj/item/coiscin/teleport/attack_self(mob/user)
	new /mob/living/exosuit/premade/bike(get_turf(src))
	qdel(src)

/obj/item/clothingbag/coiscin
	name = "clothing bag"
	desc = "Roar's property"

/obj/item/clothingbag/coiscin/Initialize()
	. = ..()
	new /obj/item/document_coiscin/passport(src)
	new /obj/item/document_coiscin/lorvisa(src)
	new /obj/item/document_coiscin/workpass(src)
	new /obj/item/clothing/under/coiscin(src)
	new /obj/item/clothing/accessory/haori_coiscin(src)
	new /obj/item/clothing/accessory/katana_coiscin(src)
	new /obj/item/music_player/boombox/coiscin(src)
	new /obj/item/notebook_coiscin(src)
	new /obj/item/clothing/head/helmet/biker/cross/coiscin(src)
	new /obj/item/coiscin/teleport(src)
