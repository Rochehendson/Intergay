/obj/item/remains/cadaab
	name = "head on a spike"
	icon = 'maps/away/cadaab/icons/objects.dmi'
	icon_state = "spikehead"

/obj/item/remains/cadaab/chest
	name = "remains"
	icon_state = "remains"

/obj/item/remains/cadaab/chesthead
	name = "remains"
	icon_state = "remains2"

/obj/structure/flora/tree/cadaab
	name = "tree"
	icon = 'maps/away/cadaab/icons/objects_48x48.dmi'
	icon_state = "tree"
	pixel_x = 0
	health_max = 50

/obj/structure/flora/tree/cadaab/on_death()
	qdel(src)

/obj/structure/flora/tree/cadaab/cacti
	name = "cactus"
	icon_state = "cacti"

/obj/structure/gravemarker/cadaab
	name = "grave stone"
	icon = 'maps/away/cadaab/icons/objects.dmi'
	icon_state = "gravestone"
	pixel_x = 0
	pixel_y = 0

/obj/structure/gravemarker/cadaab/alt
	icon_state = "gravestone2"

/obj/structure/pit/closed/cadaab
	name = "grave"
	icon = 'maps/away/cadaab/icons/objects.dmi'
	icon_state = "grave"


/obj/structure/steelfence
	name = "steel fence"
	desc = "A flimsy lattice of metal rods, with screws to secure it to the floor."
	icon = 'maps/away/cadaab/icons/objects.dmi'
	icon_state = "steelfence"
	atom_flags = ATOM_FLAG_CLIMBABLE
	anchored = TRUE
	density = TRUE
	plane = DECORATIONS_PLANE
	health_max = 30

/obj/structure/steelfence/attackby(obj/item/W as obj, mob/user as mob)
	if(isWirecutter(W))
		playsound(loc, 'sound/items/Wirecutter.ogg', 100, 1)
		new /obj/item/stack/material/rods(get_turf(src))
		qdel(src)
		return
	else
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		damage_health(W.force, W.damtype)
		..()

/obj/structure/steelfence/on_death()
	if(prob(60))
		new /obj/item/stack/material/rods(get_turf(src))

	qdel(src)

/obj/structure/steelfence/door
	name = "steel fence door"
	icon_state = "fencedoor"

/obj/structure/steelfence/door/Click(location, control, params)
	. = ..()
	if((usr.a_intent != I_HURT) && (src in view(1, usr)) && (istype(usr, /mob/living/carbon/human)) && (!usr.incapacitated()))
		usr.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		close_open()

/obj/structure/steelfence/door/Bumped(atom/AM)
	close_open()
	. = ..()

/obj/structure/steelfence/door/proc/close_open()
	if(icon_state == "fencedoor")
		icon_state = "fencedooropen"
		playsound(src, 'sound/effects/bos/fence_door.ogg', 50)
		density = FALSE
	else
		icon_state = "fencedoor"
		playsound(src, 'sound/effects/bos/fence_door.ogg', 50)
		density = TRUE


/obj/machinery/door/unpowered/simple/cadaab
	name = "steel fence door"
	icon = 'maps/away/cadaab/icons/objects.dmi'
	icon_state = "fencedoor"
	icon_base = "fencedoor"
	health_max = 30

/obj/structure/closet/tent
	name = "tent"
	desc = "A pretty big green tent."
	icon = 'maps/away/cadaab/icons/tent.dmi'
	open_sound = 'sound/effects/footstep/carpet5.ogg'
	close_sound = 'sound/effects/footstep/carpet5.ogg'
	setup = 0
	closet_appearance = null
	health_max = 10

/obj/structure/reagent_dispensers/fueltank/cadaab
	name = "gas station"
	desc = "There's probably still fuel left in it."
	icon = 'maps/away/cadaab/icons/objects.dmi'
	icon_state = "fuel"
	anchored = 1

/obj/machinery/vending/syndipass
	name = "\improper Exclusive for Syndi-Pass Owners"
	desc = "Vending machine with products exclusively for syndi-pass owners."
	product_slogans = "Fuck Nanotra-.. Oh, wait.'.;\
		Only the best for the best."
	vend_delay = 21
	icon = 'maps/away/cadaab/icons/objects.dmi'
	icon_state = "syndi"
	icon_vend = "syndi-vend"
	icon_deny = "syndi-deny"
	base_type = /obj/machinery/vending/syndipass
	req_access = list(access_castelnau_syndipass)
	products = list(
					/obj/item/storage/mre = 2,
					/obj/item/clothing/accessory/armor_plate/ceramic = 3,
					/obj/item/gun/energy/ionrifle/small = 1,
					/obj/item/gun/projectile/revolver/psirevolver = 2,
					/obj/item/ammo_magazine/speedloader/magnum/nullglass = 3,
					/obj/item/storage/toolbox/syndicate = 2,
					/obj/item/rcd = 2,
					/obj/item/rcd_ammo = 5,
					/obj/item/bodybag/cryobag = 2,
					/obj/item/storage/firstaid/light = 1,
					/obj/item/storage/firstaid/regular = 1,
					/obj/item/storage/firstaid/trauma = 1,
					/obj/item/storage/firstaid/fire = 1,
					/obj/item/storage/firstaid/toxin = 1,
					/obj/item/storage/firstaid/stab = 1,
					/obj/item/storage/firstaid/adv = 1,
					/obj/item/device/radio/intercept = 1,
					/obj/item/card/id/syndicate = 3,
					/obj/item/stack/telecrystal = 20)
	premium = list(/obj/item/storage/firstaid/combat = 1, /obj/item/gun/energy/plasmarifle = 1)

	prices = list(
					/obj/item/storage/mre = 300,
					/obj/item/clothing/accessory/armor_plate/ceramic = 1500,
					/obj/item/gun/energy/ionrifle/small = 2500,
					/obj/item/gun/projectile/revolver/psirevolver = 2000,
					/obj/item/ammo_magazine/speedloader/magnum/nullglass = 500,
					/obj/item/storage/toolbox/syndicate = 800,
					/obj/item/rcd = 1000,
					/obj/item/rcd_ammo = 300,
					/obj/item/bodybag/cryobag = 500,
					/obj/item/storage/firstaid/light = 200,
					/obj/item/storage/firstaid/regular = 500,
					/obj/item/storage/firstaid/trauma = 500,
					/obj/item/storage/firstaid/fire = 500,
					/obj/item/storage/firstaid/toxin = 500,
					/obj/item/storage/firstaid/stab = 800,
					/obj/item/storage/firstaid/adv = 1000,
					/obj/item/device/radio/intercept = 1000,
					/obj/item/card/id/syndicate = 3000,
					/obj/item/stack/telecrystal = 500,
					/obj/item/storage/firstaid/combat = 4000,
					/obj/item/gun/energy/plasmarifle = 5000)


/obj/structure/ads
	name = "IPCRUNNER 2320"
	desc = "They try to make you watch stupid movies even on the forgotten moon."
	icon = 'maps/away/cadaab/icons/objects.dmi'
	icon_state = "ipcrunner"
	anchored = TRUE
	density = TRUE
	health_max = 30
	plane = DECORATIONS_PLANE

/obj/structure/ads/attackby(obj/item/W as obj, mob/user as mob)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	damage_health(W.force, W.damtype)
	..()
/obj/structure/ads/on_death()
	qdel(src)

/obj/structure/ads/propaganda
	name = "Terran propaganda"
	icon_state = "tovarisch"
	desc = "'A TI ZAPISALSYA V DOBROVOLCI?'."

/obj/structure/ads/retro
	name = "CYBER KILLER RETRO advertising panel"
	icon_state = "retro"

/obj/effect/decal/weeks
	name = "status display"
	desc = "It says, 'Decontamination in two weeks.'"
	icon = 'maps/away/cadaab/icons/objects.dmi'
	icon_state = "2weeks"
	anchored = 1

/obj/effect/floor_decal/holecadaab
	name = "hole"
	icon = 'maps/away/cadaab/icons/turfs.dmi'
	icon_state = "holedecal"

/obj/effect/decal/cleanable/cadaab
	name = "graffiti"
	desc = "'BOOKER ZHIV'"
	icon = 'maps/away/cadaab/icons/objects.dmi'
	icon_state = "alive"
	anchored = 1

/obj/effect/decal/cleanable/cadaab/booker
	name = "graffiti"
	desc = "Our mighty Lord"
	icon_state = "booker"

/obj/effect/decal/cleanable/cadaab/bio
	name = "biohazard graffiti"
	desc = "You probably shouldn't go here."
	icon_state = "bio"

/obj/effect/floor_decal/cadaab
	icon = 'maps/away/cadaab/icons/turfs.dmi'

/obj/effect/floor_decal/cadaab/grass_0
	name = "grass"
	icon_state = "grass0"

/obj/effect/floor_decal/cadaab/grass_1
	name = "grass"
	icon_state = "grass1"

/obj/effect/floor_decal/cadaab/grass_2
	name = "grass"
	icon_state = "grass2"

/obj/effect/floor_decal/cadaab/grass_3
	name = "grass"
	icon_state = "grass3"

/obj/effect/floor_decal/cadaab/grass_4
	name = "grass"
	icon_state = "grass4"

/obj/effect/floor_decal/cadaab/grass_5
	name = "grass"
	icon_state = "grass5"

/obj/effect/floor_decal/cadaab/grass_6
	name = "grass"
	icon_state = "grass6"

/obj/effect/floor_decal/cadaab/grass_7
	name = "grass"
	icon_state = "grass7"

/obj/effect/floor_decal/cadaab/grass_8
	name = "grass"
	icon_state = "grass8"

/obj/effect/floor_decal/cadaab/grass_9
	name = "grass"
	icon_state = "grass9"

/obj/effect/floor_decal/cadaab/grass_10
	name = "grass"
	icon_state = "grass10"

/obj/effect/floor_decal/cadaab/grass_11
	name = "grass"
	icon_state = "grass11"

/obj/effect/floor_decal/cadaab/grass_12
	name = "grass"
	icon_state = "grass12"

/obj/effect/floor_decal/cadaab/grass_13
	name = "grass"
	icon_state = "grass13"

/obj/effect/floor_decal/cadaab/grass_14
	name = "grass"
	icon_state = "grass14"

/obj/effect/floor_decal/cadaab/grass_15
	name = "grass"
	icon_state = "grass15"

/obj/random/cadaab_grass
	name = "random cadaab grass"
	desc = "This is a random cadaab grass."
	icon = 'maps/away/cadaab/icons/turfs.dmi'
	icon_state = "grass0"
	spawn_nothing_percentage = 5

/obj/random/cadaab_grass/spawn_choices()
	return list(/obj/effect/floor_decal/cadaab/grass_0,
				/obj/effect/floor_decal/cadaab/grass_1,
				/obj/effect/floor_decal/cadaab/grass_2,
				/obj/effect/floor_decal/cadaab/grass_3,
				/obj/effect/floor_decal/cadaab/grass_4,
				/obj/effect/floor_decal/cadaab/grass_5,
				/obj/effect/floor_decal/cadaab/grass_6,
				/obj/effect/floor_decal/cadaab/grass_7,
				/obj/effect/floor_decal/cadaab/grass_8,
				/obj/effect/floor_decal/cadaab/grass_9,
				/obj/effect/floor_decal/cadaab/grass_10,
				/obj/effect/floor_decal/cadaab/grass_11,
				/obj/effect/floor_decal/cadaab/grass_12,
				/obj/effect/floor_decal/cadaab/grass_13,
				/obj/effect/floor_decal/cadaab/grass_14,
				/obj/effect/floor_decal/cadaab/grass_15)

/obj/machinery/locked_console
	name = "console"
	desc = "Robust flight console. Control of this one is blocked remotely."
	icon = 'maps/away/cadaab/icons/objects.dmi'
	density = 1
	anchored = 1
	icon_state = "console"
	frame_type = /obj/machinery/constructable_frame/computerframe/deconstruct
	construct_state = /decl/machine_construction/default/panel_closed/computer

/obj/machinery/locked_console/attackby(obj/item/I, mob/user)
	if (isScrewdriver(I) || isWrench(I) || isCrowbar(I))
		return ..() // handled by construction
	if (user.a_intent != I_HURT)
		audible_message(SPAN_WARNING("Access denied under order of the High Regulator Command! Stated reason: Mission is not completed."))
		return ..()

/obj/machinery/telecomms/allinone/castelnau
	listening_freqs = list(PUB_FREQ, HAIL_FREQ, SEC_FREQ, MED_FREQ, SUP_FREQ, SRV_FREQ, COMM_FREQ)
