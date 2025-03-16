/obj/item/gun/projectile/rocket
	name = "HRL-42 Hammer" //boh
	desc = "HRL-42 or simply Hammer is a aptly named rocket-launcher commonly seen amongst frontier fighters and terrorists due to it's cheap and reusable nature." //boh
	icon = 'icons/boh/obj/guns/launchers64.dmi'
	icon_state = "recoilless"
	item_state = "recoilless"

	w_class = ITEM_SIZE_HUGE
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 5)
	throw_speed = 2
	throw_range = 10
	force = 5.0

	caliber = CALIBER_ROCKET
	handle_casings = CLEAR_CASINGS
	obj_flags =  OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BACK
	combustion = 1
	max_shells = 1
	one_hand_penalty = 10
	ammo_type = /obj/item/ammo_casing/rocket
	starts_loaded = 1
	load_sound = 'sound/weapons/guns/interaction/rpg_reload.ogg'
	var/windup = 5

/obj/item/gun/projectile/rocket/afterattack(atom/A, mob/living/user, adjacent, params) // RPGs snowflake this due to windup, okay? Else ancient baycode gets angry and starts erroring.
	if(adjacent) return //A is adjacent, is the user, or is on the user's person

	if(!user.aiming)
		user.aiming = new(user)

	if(windup > 0)
		if(do_after(user, windup)) // Do the windup.
			Fire(A,user,params)
	else
		Fire(A,user,params) //Otherwise, fire normally.

/obj/item/gun/projectile/rocket/unload_ammo(mob/user, var/allow_dump=1)
	if(!istype(src, /obj/item/gun/projectile/rocket/oneuse))
		icon_state = "recoilless-empty"
		item_state = "recoilless-empty"
		. = ..()

/obj/item/gun/projectile/rocket/load_ammo(var/obj/item/A, mob/user)
	if((!istype(src, /obj/item/gun/projectile/rocket/oneuse)) && (do_after(usr, 2 SECONDS, src, DO_SHOW_PROGRESS | DO_BAR_OVER_USER | DO_USER_SAME_HAND)))
		icon_state = "recoilless"
		item_state = "recoilless"
		. = ..()

/obj/item/gun/projectile/rocket/handle_post_fire(mob/user, atom/target)
	..()
	log_and_message_admins("fired a rocket from a rocket projectile ([src.name]) at [target].")
	if(!istype(src, /obj/item/gun/projectile/rocket/oneuse))
		icon_state = "recoilless-empty"
		item_state = "recoilless-empty"



// Disposable RPG

/obj/item/gun/projectile/rocket/oneuse // One time use RPGs.
	name = "LRL-19 Spear"
	desc = "A disposable use rocket launcher, better known as an 'Spear' well known around human space, used by many people and many folk to blow things sky high. It cannot be unloaded or reloaded without specialized tools and is meant to be disposed once used."
	icon_state = "disposable_marine"
	item_state = "disposable_marine"

	var/folded = 1
	ammo_type = /obj/item/ammo_casing/oneuse_rocket

// Stops us from unloading it.
/obj/item/gun/projectile/rocket/oneuse/unload_ammo(mob/user, allow_dump = 1)
	to_chat(user, "<span class='warning'>You cannot unload this type of weapon!</span>")

//Unfolds/folds the RPG.
/obj/item/gun/projectile/rocket/oneuse/attack_self(mob/user)
	if(folded)
		playsound(src.loc,'sound/weapons/guns/interaction/rpgoneuse_deploying.ogg',80, 0)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
		if(do_after(usr, 30, src))
			usr.visible_message("<span class='notice'>\The [usr] extends [src].</span>", "<span class='notice'>You deploy the [src]</span>")
			folded = FALSE
			icon_state = "disposable_marine"
	else
		playsound(src.loc,'sound/weapons/guns/interaction/rpgoneuse_deploying.ogg',80, 0)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
		if(do_after(usr, 30, src))
			usr.visible_message("<span class='notice'>\The [usr] folds the [src].</span>", "<span class='notice'>You fold the [src]</span>")
			folded = TRUE
			icon_state = "disposable_marine_deployed"

// Tells the player to deploy it, dummy.
/obj/item/gun/projectile/rocket/oneuse/special_check(mob/user)
	if(folded)
		to_chat(user, "You can't fire this in this state! Deploy it!")
		return 0
	else
		return 1
