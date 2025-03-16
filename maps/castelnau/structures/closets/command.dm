/decl/closet_appearance/secure_closet/castelnau/command
	extra_decals = list(
		"stripe_vertical_mid_full" = COLOR_CLOSET_GOLD
	)

/obj/structure/closet/secure_closet/castelnau_adjutant
	name = "P-Navigator's locker"
	req_access = list(access_castelnau_bridge)
	closet_appearance = /decl/closet_appearance/secure_closet/castelnau/command

/obj/structure/closet/secure_closet/castelnau_adjutant/WillContain()
	return list(
		/obj/item/device/radio,
		/obj/item/pen,
		/obj/item/device/tape/random,
		/obj/item/device/taperecorder,
		/obj/item/device/flash,
		/obj/item/device/megaphone,
		/obj/item/material/clipboard,
		/obj/item/folder/blue,
		/obj/item/modular_computer/tablet/lease/preset/command,
		/obj/item/storage/belt/general,
		/obj/item/material/knife/folding/swiss,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack, /obj/item/storage/backpack/satchel/grey)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag, /obj/item/storage/backpack/messenger)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)

/obj/structure/closet/secure_closet/commissary
	name = "commissary's locker"
	closet_appearance = /decl/closet_appearance/secure_closet/castelnau/command
	req_access = list(access_castelnau_commissary)

/obj/structure/closet/secure_closet/commissary/WillContain()
	return list(
		/obj/item/gun/projectile/pistol/broomstick,
		/obj/item/ammo_magazine/speedloader/hpclip,
		/obj/item/ammo_magazine/speedloader/hpclip,
		/obj/item/ammo_magazine/speedloader/hpclip,
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

/obj/structure/closet/secure_closet/emissary
	name = "emissary's locker"
	closet_appearance = /decl/closet_appearance/secure_closet/castelnau/command
	req_access = list(access_castelnau_emissary)

/obj/structure/closet/secure_closet/emissary/WillContain()
	return list(
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/storage/belt/general,
		/obj/item/melee/telebaton,
		/obj/item/device/flash,
		/obj/item/gun/energy/confuseray,
		/obj/item/device/megaphone,
		/obj/item/storage/box/headset,
		/obj/item/storage/box/radiokeys,
		/obj/item/storage/box/large/ids,
		/obj/item/storage/box/PDAs,
		/obj/item/material/clipboard,
		/obj/item/device/holowarrant,
		/obj/item/folder/blue,
		/obj/item/material/knife/folding/swiss,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/command)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag/com))
	)
