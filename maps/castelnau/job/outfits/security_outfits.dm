/decl/hierarchy/outfit/job/castelnau/crew/security
	hierarchy_type = /decl/hierarchy/outfit/job/castelnau/crew/security
	l_ear = /obj/item/device/radio/headset/headset_sec
	pda_type = /obj/item/modular_computer/pda/security
	pda_slot = slot_l_store
	shoes = /obj/item/clothing/shoes/jackboots
	uniform = /obj/item/clothing/under/camo

/decl/hierarchy/outfit/job/castelnau/crew/security/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

/decl/hierarchy/outfit/job/castelnau/crew/security/warden
	name = OUTFIT_JOB_NAME("Warden - Castelnau")
	id_types = list(/obj/item/card/id/castelnau/crew/security/warden)

/decl/hierarchy/outfit/job/castelnau/crew/security/officer
	name = OUTFIT_JOB_NAME("Security Officer - Castelnau")
	id_types = list(/obj/item/card/id/castelnau/crew/security)
