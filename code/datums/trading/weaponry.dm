/*
/datum/trader/ship/gunshop
	name = "Gun Shop Employee"
	name_language = TRADER_DEFAULT_NAME
	origin = "Gun Shop"
	possible_origins = list("Rooty Tootie's Point-n-Shooties", "Bang-Bang Shop", "Wild Wild West Shop", "Keleshnikov", "Hunting Depot", "Big Game Hunters")
	speech = list(TRADER_HAIL_GENERIC    = "Hello, hello! I hope you have your permit. Oh, who are we kidding, you're welcome anyway!",
				TRADER_HAIL_DENY         = "Store policy dictates that you can fuck off.",

				TRADER_TRADE_COMPLETE    = "Thanks for buying your guns from ORIGIN!",
				TRADER_NO_BLACKLISTED   = "We may deal in guns, but that doesn't mean we'll trade for illegal goods...",
				TRADER_NO_GOODS    = "Cash for guns, thats the deal.",
				TRADER_NOT_ENOUGH  = "Guns are expensive! Give us more if you REALLY want it.",
				TRADER_HOW_MUCH          = "Well, I'd love to give this little beauty to you for VALUE.",

				TRADER_COMPLEMENT_FAILURE   = "If we were in the same room right now, I'd probably punch you.",
				TRADER_COMPLEMENT_SUCCESS = "Ha! Good one!",
				TRADER_INSULT_GOOD       = "I expected better from you. I suppose in that, I was wrong.",
				TRADER_INSULT_BAD        = "If I had my gun I'd shoot you!"
				)

	possible_trading_items = list(/obj/item/gun/projectile/pistol/holdout    = TRADER_ALL,
								/obj/item/gun/projectile/pistol/military/alt    = TRADER_ALL,
								/obj/item/gun/projectile/pistol/magnum_pistol= TRADER_ALL,
								/obj/item/gun/projectile/pistol/sec         = TRADER_ALL,
								/obj/item/gun/projectile/heavysniper/boltaction	= TRADER_ALL,
								/obj/item/gun/projectile/pistol/sec/MK      = TRADER_BLACKLIST,
								/obj/item/gun/projectile/shotgun/pump= TRADER_SUBTYPES_ONLY,
								/obj/item/ammo_magazine                     = TRADER_SUBTYPES_ONLY,
								/obj/item/ammo_magazine/pistol/empty         = TRADER_BLACKLIST,
								/obj/item/ammo_magazine/mil_rifle/empty          = TRADER_BLACKLIST,
								/obj/item/ammo_magazine/gyrojet/empty           = TRADER_BLACKLIST,
								/obj/item/ammo_magazine/pistol/small/empty         = TRADER_BLACKLIST,
								/obj/item/ammo_magazine/pistol/empty         = TRADER_BLACKLIST,
								/obj/item/ammo_magazine/box/pistol/empty       = TRADER_BLACKLIST,
								/obj/item/ammo_magazine/box/machinegun/empty      = TRADER_BLACKLIST,
								/obj/item/ammo_magazine/machine_pistol/empty        = TRADER_BLACKLIST,
								/obj/item/ammo_magazine/smg_top/empty        = TRADER_BLACKLIST,
								/obj/item/ammo_magazine/magnum/empty           = TRADER_BLACKLIST,
								/obj/item/clothing/accessory/storage/holster        = TRADER_ALL)

/datum/trader/ship/egunshop
	name = "Energy Gun Shop Employee"
	name_language = TRADER_DEFAULT_NAME
	origin = "EGun Shop"
	possible_origins = list("The Emperor's Lasgun Shop", "Future Guns", "Solar Army", "Kiefer's Dependable Electric Arms", "Olympus Kingsport")
	speech = list(TRADER_HAIL_GENERIC    = "Welcome to the future of warfare! ORIGIN, your one-stop shop for energy weaponry!",
				TRADER_HAIL_DENY         = "I'm sorry, your communication channel has been blacklisted.",

				TRADER_TRADE_COMPLETE    = "Thank you, your purchase has been logged and you have automatically liked our Spacebook page.",
				TRADER_NO_BLACKLISTED   = "I'm sorry, is that a joke?",
				TRADER_NO_GOODS    = "We deal in cash.",
				TRADER_NOT_ENOUGH  = "State of the art weaponry costs more than that.",
				TRADER_HOW_MUCH          = "All our quality weapons are priceless, but I'd give that to you for VALUE.",

				TRADER_COMPLEMENT_FAILURE   = "If I was dumber I probably would have believed you.",
				TRADER_COMPLEMENT_SUCCESS = "Yes, I am very smart.",
				TRADER_INSULT_GOOD       = "Energy weapons are TWICE the gun kinetic guns are!",
				TRADER_INSULT_BAD        = "That's... very mean. I won't think twice about blacklisting your channel, so stop."
				)

	possible_trading_items = list(/obj/item/gun/energy/taser                      = TRADER_THIS_TYPE,
								/obj/item/gun/energy/stunrevolver                 = TRADER_THIS_TYPE,
								/obj/item/gun/energy/xray                         = TRADER_THIS_TYPE,
								/obj/item/gun/energy/laser                        = TRADER_THIS_TYPE,
								/obj/item/gun/energy/gun                          = TRADER_THIS_TYPE,
								/obj/item/cell/crap                               = TRADER_THIS_TYPE,
								/obj/item/cell/standard                           = TRADER_THIS_TYPE,
								/obj/item/cell/high                               = TRADER_THIS_TYPE,
								/obj/item/cell/super                              = TRADER_THIS_TYPE,
								/obj/item/cell/hyper                              = TRADER_THIS_TYPE,
								/obj/item/clothing/accessory/storage/holster             = TRADER_ALL)

/datum/trader/dogan
	name = "Dogan"
	origin = "Dogan's Gun Beacon"
	speech = list(TRADER_HAIL_GENERIC    = "Hello! This is an automatic recording of me, Mr. Dogan! I hope you like the... GUNS... I've got in store for you today.",
				TRADER_HAIL_DENY         = "I formally welcome you to... NOT... visit our store!",

				TRADER_TRADE_COMPLETE    = "Thank you for... PURCHASING... that quality... ITEM... from me!",
				TRADER_NO_BLACKLISTED   = "Thank you for... that quality... ILLEGAL OFFER THAT I WILL REFUSE... from me!",
				TRADER_NO_GOODS    = "Thank you for... that quality... OFFER THAT ISN'T MONEY THAT I WILL REFUSE... from me!",
				TRADER_NOT_ENOUGH  = "Thank you for... that quality... OFFER THAT IS NOT ENOUGH... from me!",
				TRADER_HOW_MUCH          = "Thank you for... ASKING ME ABOUT MY PRICES... that quality... ITEM is worth VALUE... from me!",

				TRADER_COMPLEMENT_FAILURE   = "Thank you for... that quality... COMPLIMENT... from me!",
				TRADER_COMPLEMENT_SUCCESS = "Thank you for... that quality... COMPLIMENT... from me!",
				TRADER_INSULT_GOOD       = "Thank you for... that quality... INSULT... from me!",
				TRADER_INSULT_BAD        = "Thank you for... that quality... INSULT... from me!"
				)
	compliment_increase = 0
	insult_drop = 0

	possible_trading_items = list(/obj/item/gun/projectile/pirate                = TRADER_THIS_TYPE,
								/obj/item/gun/projectile/pistol/sec/MK                  = TRADER_THIS_TYPE,
								/obj/item/gun/projectile/heavysniper/ant         = TRADER_THIS_TYPE,
								/obj/item/gun/energy/laser/dogan                 = TRADER_THIS_TYPE,
								/obj/item/gun/projectile/automatic/machine_pistol/usi  = TRADER_THIS_TYPE,
								/obj/item/clothing/accessory/storage/holster                    = TRADER_ALL)
/ NOBODY CALL BAY TRADERS /
/   BOS TRADERS BEGIN    */

/datum/trader/heltek
	name = "HelTek Arms"
	origin = "HelTek Arms Beacon"
	speech = list(TRADER_HAIL_GENERIC    = "Greetings. This is an automated selling system of HelTek Arms. If you want buy... GUNS... We got in store for you today. Note: Due to your distance from us, the assortement is slightly limited...",
				TRADER_HAIL_DENY         = "I formally welcome you to... NOT... visit our store!",

				TRADER_TRADE_COMPLETE    = "Thank you for... PURCHASING... that quality... ITEM... from HelTek Arms!",
				TRADER_NO_BLACKLISTED   = "Thank you for... that quality... ILLEGAL OFFER THAT I WILL REFUSE... from HelTek Arms!",
				TRADER_NO_GOODS    = "Thank you for... that quality... OFFER THAT ISN'T MONEY THAT I WILL REFUSE... from HelTek Arms!",
				TRADER_NOT_ENOUGH  = "Thank you for... that quality... OFFER THAT IS NOT ENOUGH... from HelTek Arms!",
				TRADER_HOW_MUCH          = "Thank you for... ASKING ME ABOUT PRICES... that quality... ITEM is worth VALUE... from HelTek Arms!",

				TRADER_COMPLEMENT_FAILURE   = "Thank you for... that quality... COMPLIMENT... from HelTek Arms!",
				TRADER_COMPLEMENT_SUCCESS = "Thank you for... that quality... COMPLIMENT... from HelTek Arms!",
				TRADER_INSULT_GOOD       = "Thank you for... that quality... INSULT... from HelTek Arms!",
				TRADER_INSULT_BAD        = "Thank you for... that quality... INSULT... from HelTek Arms!"
				)
	compliment_increase = 0
	insult_drop = 0

	possible_trading_items = list(
								/obj/item/gun/projectile/pistol/sec/MK					= TRADER_THIS_TYPE,
								/obj/item/gun/energy/laser								= TRADER_THIS_TYPE,
								/obj/item/gun/projectile/shotgun/pump/combat			= TRADER_THIS_TYPE,
								/obj/item/gun/energy/taser								= TRADER_ALL,
								/obj/item/clothing/accessory/storage/holster			= TRADER_ALL,
								/obj/item/clothing/glasses/night						= TRADER_THIS_TYPE,
								/obj/item/clothing/head/helmet/ballistic				= TRADER_THIS_TYPE,
								/obj/item/clothing/head/helmet/ablative					= TRADER_THIS_TYPE,
								/obj/item/clothing/suit/armor/vest						= TRADER_THIS_TYPE,
								/obj/item/clothing/suit/armor/bulletproof				= TRADER_THIS_TYPE,
								/obj/item/clothing/suit/armor/laserproof				= TRADER_THIS_TYPE,
								/obj/item/clothing/accessory/armor_plate/ceramic		= TRADER_THIS_TYPE,
								/obj/item/clothing/accessory/armor_plate/medium			= TRADER_THIS_TYPE,
								/obj/item/clothing/accessory/armor_plate				= TRADER_THIS_TYPE,
								/obj/item/shield/riot									= TRADER_THIS_TYPE,
								/obj/item/barrier										= TRADER_THIS_TYPE,
								/obj/item/handcuffs										= TRADER_THIS_TYPE,
								/obj/item/storage/box/ammo/shotgunammo/full				= TRADER_THIS_TYPE
								)


/datum/trader/ship/inaks_guns
	name = "Weapons Workshop"
	origin = "Inax Jungle"
	speech = list(TRADER_HAIL_GENERIC    = "You are talking with the best weapons workshop in the world - I create best guns, all from natural materials!",
				TRADER_HAIL_DENY         = "I have better things to do than talk to you, like killing a giant hedgehog.",

				TRADER_TRADE_COMPLETE    = "Finally someone understood the power of handmade weapon.",
				TRADER_NO_BLACKLISTED   = "I think hedgehogs can smell it.",
				TRADER_NO_GOODS    = "Only money. Or with what you think I hold my campfire?",
				TRADER_NOT_ENOUGH  = "Too litle here... Even for me.",
				TRADER_HOW_MUCH          = "Ehm... I dont remeber many numbers, let it be VALUE.",

				TRADER_COMPLEMENT_FAILURE   = "I dont understand your words.",
				TRADER_COMPLEMENT_SUCCESS = "Wait... my weapon did not explode in your hands?! Wow!",
				TRADER_INSULT_GOOD       = "I say you - handmade weapon is the best weapon!",
				TRADER_INSULT_BAD        = "Seek for humaneater hedgehog under your pillow. "
				)
	compliment_increase = 5
	insult_drop = 5
	margin = 1.1
	price_rng = 5

	possible_trading_items = list(
								/obj/item/gun/projectile/pirate							= TRADER_THIS_TYPE,
								/obj/item/gun/energy/laser/dogan						= TRADER_THIS_TYPE,
								/obj/item/gun/launcher/pneumatic						= TRADER_ALL,
								/obj/item/gun/launcher/crossbow							= TRADER_THIS_TYPE,
								/obj/item/gun/projectile/automatic/machine_pistol/usi	= TRADER_THIS_TYPE,
								/obj/item/gun/projectile/shotgun/doublebarrel/sawn		= TRADER_THIS_TYPE,
								/obj/item/gun/projectile/heavysniper/boltaction			= TRADER_THIS_TYPE,
								/obj/item/gun/projectile/sniper/garand					= TRADER_THIS_TYPE,
								/obj/item/gun/projectile/automatic/sec_smg				= TRADER_THIS_TYPE,
								/obj/item/gun/projectile/automatic/battlerifle			= TRADER_THIS_TYPE,
								/obj/item/material/twohanded/spear						= TRADER_THIS_TYPE,
								/obj/item/material/harpoon								= TRADER_THIS_TYPE,
								/obj/item/ammo_magazine/mil_rifle						= TRADER_THIS_TYPE,
								/obj/item/ammo_magazine/iclipr							= TRADER_THIS_TYPE,
								/obj/item/ammo_casing/rifle								= TRADER_THIS_TYPE,
								/obj/item/ammo_magazine/smg_top/frangible				= TRADER_THIS_TYPE,
								/obj/item/arrow 										= TRADER_THIS_TYPE,
								/obj/item/beartrap 										= TRADER_THIS_TYPE
								)


/datum/trader/ship/syndicate_guns
	name = "Syndicate"
	origin = "Syndicate Weapon Bussines Ship"
	speech = list(TRADER_HAIL_GENERIC    = "Welcome to the world of victorious capitalism! Any weapon for your money.",
				TRADER_HAIL_DENY         = "I'm sorry, your communication channel has been blacklisted.",

				TRADER_TRADE_COMPLETE    = "Thank you, your purchase has been logged and you have automatically liked our Syndibook page.",
				TRADER_NO_BLACKLISTED   = "I'm sorry, is that a joke?",
				TRADER_NO_GOODS    = "We deal in cash.",
				TRADER_NOT_ENOUGH  = "State of the art weaponry costs more than that.",
				TRADER_HOW_MUCH          = "All our quality weapons are priceless, but I'd give that to you for VALUE.",

				TRADER_COMPLEMENT_FAILURE   = "If I was dumber I probably would have believed you.",
				TRADER_COMPLEMENT_SUCCESS = "Yes, I am very smart.",
				TRADER_INSULT_GOOD       = "What did you just say? 'SolGov did nothing wrong'?!",
				TRADER_INSULT_BAD        = "That's... very mean. I won't think twice about blacklisting your channel, so stop."
	)
	compliment_increase = 5
	insult_drop = 5

	possible_trading_items = list(
								/obj/item/gun/energy/k342								= TRADER_THIS_TYPE,
								/obj/item/gun/energy/pulse_rifle						= TRADER_THIS_TYPE,
								/obj/item/gun/energy/crossbow							= TRADER_THIS_TYPE,
								/obj/item/gun/projectile/automatic/corpo				= TRADER_THIS_TYPE,
								/obj/item/gun/projectile/automatic/pdw					= TRADER_THIS_TYPE,
								/obj/item/gun/projectile/automatic/amrcarabine			= TRADER_THIS_TYPE,
								/obj/item/gun/projectile/automatic/merc_smg				= TRADER_THIS_TYPE,
								/obj/item/gun/projectile/automatic/assault_rifle		= TRADER_THIS_TYPE,
								/obj/item/gun/projectile/automatic/bullpup_rifle		= TRADER_THIS_TYPE,
								/obj/item/gun/projectile/automatic/l6_saw				= TRADER_THIS_TYPE,
								/obj/item/grenade/spawnergrenade/viscerator				= TRADER_THIS_TYPE,
								/obj/item/ammo_magazine/corpo							= TRADER_THIS_TYPE,
								/obj/item/ammo_magazine/amr								= TRADER_THIS_TYPE,
								/obj/item/ammo_magazine/pdw								= TRADER_THIS_TYPE,
								/obj/item/ammo_magazine/rifle							= TRADER_THIS_TYPE,
								/obj/item/ammo_magazine/smg								= TRADER_THIS_TYPE,
								/obj/item/ammo_magazine/box/machinegun					= TRADER_THIS_TYPE,
								/obj/item/shield/riot/metal								= TRADER_THIS_TYPE,
								/obj/item/shield/energy									= TRADER_THIS_TYPE,
								/obj/item/clothing/accessory/armor_plate/sneaky			= TRADER_THIS_TYPE
								)


/datum/trader/ship/kaboom
	name = "Unknown Primitive Signature"
	origin = "Kadaab Deserts"
	trade_flags = TRADER_MONEY|TRADER_GOODS|TRADER_WANTED_ONLY|TRADER_WANTED_ALL
	want_multiplier = 1
	speech = list(TRADER_HAIL_GENERIC		= "Ka-boom? Funny paper give you, we give you ka-boom.",
				TRADER_HAIL_DENY			= "No ka-boom for space demons.",

				TRADER_TRADE_COMPLETE		= "Make more kaboom with ka-boom.",
				TRADER_FOUND_UNWANTED		= "This not funny and not meal - we not need.",
				TRADER_WHAT_WANT			= "Ohm, we want eat meal. And drink wata. We not drink wata for... Orgh, many suns.",
				TRADER_NOT_ENOUGH			= "More paper!!",
				TRADER_HOW_MUCH				= "Orgh... One, two... VALUE.",

				TRADER_COMPLEMENT_FAILURE	= "You stoopid.",
				TRADER_COMPLEMENT_SUCCESS	= "Great ka-boom!",
				TRADER_INSULT_GOOD			= "My ka-boom is good, you bad space demon!!!",
				TRADER_INSULT_BAD			= "Erght... What?"
	)
	compliment_increase = 5
	insult_drop = 5

	wanted_items  = list(
						/obj/item/reagent_containers/food								= TRADER_ALL
						)

	possible_trading_items = list(
								/obj/item/gun/launcher/grenade							= TRADER_THIS_TYPE,
								/obj/item/gun/projectile/rocket/oneuse					= TRADER_THIS_TYPE,
								/obj/item/gun/projectile/rocket							= TRADER_THIS_TYPE,
								/obj/item/ammo_casing/rocket							= TRADER_THIS_TYPE,
								/obj/item/ammo_casing/rocket							= TRADER_SUBTYPES_ONLY,
								/obj/item/grenade/fake									= TRADER_THIS_TYPE,
								/obj/item/grenade/anti_photon							= TRADER_THIS_TYPE,
								/obj/item/grenade/empgrenade							= TRADER_THIS_TYPE,
								/obj/item/grenade/frag									= TRADER_THIS_TYPE
								)
