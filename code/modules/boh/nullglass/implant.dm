/////////
// The entire package
/////////
/obj/item/implantcase/psyker
	name = "glass case - 'psi dampener'"
	imp = /obj/item/implant/psi_control

/obj/item/storage/box/psykerimplants
	name = "psi dampeners"
	desc = "Box of stuff used to implant psionic monitoring software."
	icon_state = "implant"
	item_state = "syringe_kit"
	startswith = list(/obj/item/implanter/psi = 1,
				/obj/item/implantcase/psyker = 6)