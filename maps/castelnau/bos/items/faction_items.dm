/obj/random/loot/paroled
	name = "random loot"
	desc = "This is some random loot."
	icon = 'icons/obj/items.dmi'
	icon_state = "gift3"

/obj/random/loot/paroled/spawn_choices()
	return list(/obj/random/energy = 10,
				/obj/random/projectile = 10,
				/obj/random/voidhelmet = 10,
				/obj/random/voidsuit = 10,
				/obj/random/hardsuit = 10,
				/obj/item/clothing/mask/muzzle = 7,
				/obj/item/clothing/mask/gas/vox = 8,
				/obj/item/clothing/mask/gas/syndicate = 10,
				/obj/item/clothing/glasses/night = 3,
				/obj/item/clothing/glasses/thermal = 1,
				/obj/item/clothing/glasses/welding/superior = 7,
				/obj/item/clothing/head/collectable/petehat = 4,
				/obj/item/clothing/suit/storage/vest/merc = 3,
				/obj/item/clothing/suit/straight_jacket = 6,
				/obj/item/clothing/head/helmet/merc = 3,
				/obj/item/storage/box/monkeycubes = 5,
				/obj/item/storage/box/monkeycubes/neaeracubes = 4,
				/obj/item/storage/box/monkeycubes/stokcubes = 4,
				/obj/item/storage/box/monkeycubes/farwacubes = 4,
				/obj/item/storage/firstaid/surgery = 4,
				/obj/item/cell/infinite = 1,
				/obj/item/archaeological_find = 2,
				/obj/item/device/multitool/hacktool = 2,
				/obj/item/surgicaldrill = 7,
				/obj/item/circular_saw = 7,
				/obj/item/scalpel = 7,
				/obj/item/melee/baton/loaded = 9,
				/obj/item/device/radio/headset/syndicate = 6)

/obj/random/loot/paroled/barb
	name = "random tech-barb loot"

/obj/random/loot/paroled/barb/spawn_choices()
	return list(/obj/random/energy = 10,
				/obj/random/hardsuit = 10,
				/obj/item/clothing/mask/gas/syndicate = 10,
				/obj/item/clothing/glasses/night = 3,
				/obj/item/clothing/glasses/thermal = 1,
				/obj/item/clothing/glasses/welding/superior = 7,,
				/obj/item/storage/firstaid/combat = 4,
				/obj/item/cell/infinite = 1,
				/obj/item/device/multitool/hacktool = 2,
				/obj/item/melee/baton/loaded = 9)

///ALT-HIRED
////////////

/obj/item/clothingbag/paroled
	name = "clothing bag"
	desc = "Certainly not contraband"

/obj/item/clothingbag/paroled/Initialize()
	. = ..()
	new /obj/random/contraband(src)
	new /obj/random/loot/paroled(src)
	new /obj/random/loot/paroled(src)
	new /obj/random/cash(src)

///YAKUZA
////////////

/obj/item/clothingbag/yakuza
	name = "clothing bag"
	desc = "Certainly not contraband"

/obj/item/clothingbag/yakuza/Initialize()
	. = ..()
	new /obj/random/loot/paroled(src)
	new /obj/item/storage/box/kunai(src)
	new /obj/random/cash(src)
	new /obj/random/cash(src)
	new /obj/random/cash(src)

/obj/item/material/sword/katana/yakuza //stab-sword, but with more damage
	name = "scolopendras katana"
	desc = "Your tool of justice"
	icon = 'maps/castelnau/bos/icons/obj/items/weapons.dmi'
	item_icons = list(
		slot_l_hand_str = 'maps/castelnau/bos/icons/mob/items_lhand.dmi',
		slot_r_hand_str = 'maps/castelnau/bos/icons/mob/items_rhand.dmi'
		)
	slot_flags = null
	force = 20
	max_force = 10
	force_multiplier = 0.5
	armor_penetration = 5
	base_parry_chance = 45
	melee_accuracy_bonus = 30
	applies_material_colour = FALSE

/obj/item/storage/belt/holster/sheath/yakuza
	name = "katana sneath"
	icon = 'maps/castelnau/bos/icons/obj/items/weapons.dmi'
	item_icons = list(
		slot_back_str = 'maps/castelnau/bos/icons/mob/items_back.dmi',
		slot_belt_str = 'icons/mob/onmob/onmob_belt.dmi'
		)
	icon_state = "sheath"
	item_state = "sword"
	storage_slots = 1
	w_class = 6
	max_w_class = 6
	max_storage_space = 16 // Swords are bulky, needs this to not erorr.
	slot_flags = SLOT_BELT | SLOT_BACK
	sound_in = 'sound/effects/holster/sheathin.ogg'
	sound_out = 'sound/effects/holster/blade_unsheath.ogg'
	can_holster = list(/obj/item/material/sword/katana/yakuza)

/obj/item/storage/belt/holster/sheath/yakuza/New()
	..()
	new /obj/item/material/sword/katana/yakuza(src)

/obj/item/storage/box/kunai
	name = "kunai box"
	icon_state = "box"
	item_state = "syringe_kit"
	desc = "It has holes in it."
	startswith = list(
	/obj/item/material/knife/bos/kunai =6)

/obj/item/paper/yakuza
	name = "Yangui Scolopendras Codex"
	desc = "A brief overview of Scolopendras Codex."
	icon = 'icons/obj/paper.dmi'
	icon_state = "paper_talisman"
	info = {"
	<center>

<large><b>КОДЕКС

</b></large>
<hr>
<b>Безопасность Клана превыше всего.

Находи достойных последователей.

Не бойся смерти, рискуй.

Никогда не отказывайся от долга, если принял его на себя.

Помогай нуждающимся.

Слово Мастера - закон.

Щади сдавшихся противников.</center></b>
	"}


///TECH-BARBARIAN
////////////
/obj/item/clothingbag/barb
	name = "clothing bag"
	desc = "Certainly not contraband"

/obj/item/clothingbag/barb/Initialize()
	. = ..()
	new /obj/random/loot/paroled(src)
	new /obj/random/good_tools(src)
	new /obj/random/good_tools(src)
	new /obj/random/good_tools(src)
	new /obj/random/good_tools(src)

///SYNDICATE
////////////
/var/const/access_castelnau_syndipass = "ACCESS_CASTELNAU_SYNDIPASS"
/datum/access/castelnau/syndipass
	id = access_castelnau_syndipass
	desc = "Syndi-Pass"
	region = ACCESS_REGION_NONE

/obj/item/card/id/syndipass
	name = "Syndi-Pass"
	desc = "This card provides additional access to the syndicate equipment, be it some local shuttle or airdrops"
	registered_name = "Our beloved employee"
	assignment = "Syndi-pass Subscriber"
	access = list(access_castelnau_syndipass)
	color = COLOR_RED_GRAY
	detail_color = COLOR_GRAY40


/obj/item/clothing/suit/storage/toggle/lordan/service/fleet/po/gsc
	name = "GSC shinel"
	desc = "A Galactic Security Corps terran-styled shinel with red accents."