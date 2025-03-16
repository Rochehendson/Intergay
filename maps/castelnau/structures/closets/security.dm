/*
 * castelnau Security
 */

/decl/closet_appearance/secure_closet/castelnau/security
	extra_decals = list(
		"stripe_vertical_mid_full" = COLOR_NT_RED,
		"security" = COLOR_NT_RED
	)

/decl/closet_appearance/secure_closet/castelnau/security/forensics
	extra_decals = list(
		"stripe_vertical_mid_full" = COLOR_NT_RED,
		"forensics" = COLOR_NT_RED
	)

/decl/closet_appearance/secure_closet/castelnau/security/warden
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_NT_RED,
		"stripe_vertical_right_full" = COLOR_NT_RED,
		"security" = COLOR_NT_RED
	)

/decl/closet_appearance/secure_closet/castelnau/security/hos
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_NT_RED,
		"stripe_vertical_mid_full" = COLOR_CLOSET_GOLD,
		"stripe_vertical_right_full" = COLOR_NT_RED,
		"security" = COLOR_CLOSET_GOLD
	)

/obj/structure/closet/secure_closet/security_castelnau
	name = "security operative's locker"
	req_access = list(access_castelnau_brig)
	closet_appearance = /decl/closet_appearance/secure_closet/castelnau/security

/obj/structure/closet/secure_closet/security_castelnau/WillContain()
	return list(
		/obj/item/clothing/suit/armor/pcarrier/medium/security,
		/obj/item/clothing/head/helmet,
		/obj/item/device/radio/headset/headset_sec,
		/obj/item/device/radio/headset/headset_sec/alt,
		/obj/item/storage/belt/holster/security,
		/obj/item/device/flash,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/grenade/chem_grenade/teargas,
		/obj/item/melee/baton/loaded,
		/obj/item/taperoll/police,
		/obj/item/device/hailer,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/gunbox,
		/obj/item/gunbox/primary,
		/obj/item/device/megaphone,
		/obj/item/clothing/gloves/thick,
		/obj/item/device/holowarrant,
		/obj/item/device/flashlight/maglight,
		/obj/item/storage/belt/security,
		/obj/item/material/knife/folding/swiss,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/security, /obj/item/storage/backpack/satchel/sec)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag/sec, /obj/item/storage/backpack/messenger/sec))
	)


/obj/structure/closet/secure_closet/sheriff
	name = "sheriff's locker"
	req_access = list(access_castelnau_sheriff)
	closet_appearance = /decl/closet_appearance/secure_closet/castelnau/security/hos
	storage_capacity = 45

/obj/structure/closet/secure_closet/sheriff/WillContain()
	return list(
		/obj/item/clothing/suit/armor/pcarrier/medium/command/security,
		/obj/item/clothing/head/helmet,
		/obj/item/device/radio/headset/heads/hos,
		/obj/item/taperoll/police,
		/obj/item/handcuffs,
		/obj/item/storage/belt/holster/security,
		/obj/item/storage/belt/holster/general,
		/obj/item/device/flash,
		/obj/item/device/megaphone,
		/obj/item/melee/baton/loaded,
		/obj/item/gun/projectile/pistol/magnum_pistol/solar/loaded,
		/obj/item/gun/energy/taser,
		/obj/item/melee/telebaton,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/device/hailer,
		/obj/item/material/clipboard,
		/obj/item/folder/red,
		/obj/item/device/holowarrant,
		/obj/item/clothing/gloves/thick,
		/obj/item/device/flashlight/maglight,
		/obj/item/device/taperecorder,
		/obj/item/hand_labeler,
		/obj/item/material/knife/folding/swiss,
		/obj/item/sd_key,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/security, /obj/item/storage/backpack/satchel/sec)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag/sec, /obj/item/storage/backpack/messenger/sec))
	)


/obj/structure/closet/secure_closet/forensics_castelnau
	name = "investigator's locker"
	req_access = list(access_castelnau_detective)
	closet_appearance = /decl/closet_appearance/secure_closet/castelnau/security/forensics

/obj/structure/closet/secure_closet/forensics_castelnau/WillContain()
	return list(
		/obj/item/clothing/gloves/forensic,
		/obj/item/clothing/head/helmet,
		/obj/item/clothing/suit/armor/pcarrier/medium/security,
		/obj/item/gunbox,
		/obj/item/device/flash,
		/obj/item/melee/baton/loaded,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/taperoll/police,
		/obj/item/device/tape/random = 3,
		/obj/item/device/holowarrant,
		/obj/item/device/flashlight/maglight,
		/obj/item/storage/belt/holster/forensic,
		/obj/item/storage/belt/holster/security,
		/obj/item/storage/belt/security,
		/obj/item/clothing/gloves/thick,
		/obj/item/material/knife/folding/swiss,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/security, /obj/item/storage/backpack/satchel/sec)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag/sec, /obj/item/storage/backpack/messenger/sec))
	)


/obj/structure/closet/secure_closet/raidcap_castelnau
	name = "raid unit captain locker"
	req_access = list(access_castelnau_perseus_helm, access_castelnau_bridge)
	closet_appearance = /decl/closet_appearance/secure_closet/castelnau/security/hos

/obj/structure/closet/secure_closet/raidcap_castelnau/WillContain()
	return list(
		/obj/item/clothing/head/helmet,
		/obj/item/clothing/suit/armor/pcarrier/medium/security,
		/obj/item/clothing/accessory/storage/holster/thigh,
		/obj/item/gunbox/sidearm/infantry,
		/obj/item/device/radio,
		/obj/item/device/tape/random,
		/obj/item/device/gps,
		/obj/item/pinpointer/radio,
//		/obj/item/device/radio/beacon,
		/obj/item/taperoll/research,
		/obj/item/material/hatchet/machete/deluxe,
		/obj/item/storage/belt/holster/machete,
		/obj/item/device/spaceflare,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/device/taperecorder,
		/obj/item/device/scanner/gas,
		/obj/item/device/flash,
		/obj/item/device/binoculars,
		/obj/item/material/knife/folding/swiss,
		/obj/item/clothing/accessory/buddy_tag,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack, /obj/item/storage/backpack/satchel/grey)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag, /obj/item/storage/backpack/messenger)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)

/obj/structure/closet/secure_closet/raider_castelnau
	name = "raid unit locker"
	req_access = list(access_castelnau_perseus_helm)
	closet_appearance = /decl/closet_appearance/secure_closet/castelnau/security

/obj/structure/closet/secure_closet/raider_castelnau/WillContain()
	return list(
		/obj/item/clothing/head/helmet,
		/obj/item/clothing/suit/armor/pcarrier/medium/security,
		/obj/item/clothing/accessory/storage/holster/thigh,
		/obj/item/gunbox/sidearm/infantry,
		/obj/item/device/radio,
		/obj/item/device/gps,
		/obj/item/taperoll/research,
		/obj/item/storage/belt/holster/machete,
		/obj/item/device/spaceflare,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/device/scanner/gas,
		/obj/item/device/binoculars,
		/obj/item/clothing/accessory/buddy_tag,
		/obj/item/material/knife/folding/swiss,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack, /obj/item/storage/backpack/satchel/grey)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag, /obj/item/storage/backpack/messenger)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)
