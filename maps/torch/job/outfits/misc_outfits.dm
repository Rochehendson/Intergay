/decl/hierarchy/outfit/job/torch/passenger/passenger
	name = OUTFIT_JOB_NAME("Passenger - Torch")
	uniform = /obj/item/clothing/under/color/grey
	l_ear = /obj/item/device/radio/headset
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda
	id_types= list(/obj/item/card/id/torch/passenger)

/decl/hierarchy/outfit/job/torch/passenger/passenger/psychologist
	name = OUTFIT_JOB_NAME("Passenger - Psychologist")
	uniform = /obj/item/clothing/under/rank/psych/turtleneck
	shoes = /obj/item/clothing/shoes/laceup

/decl/hierarchy/outfit/job/torch/passenger/passenger/journalist
	name = OUTFIT_JOB_NAME("Journalist - Torch")
	backpack_contents = list(/obj/item/device/camera/tvcamera = 1,
	/obj/item/clothing/accessory/badge/press = 1)

/decl/hierarchy/outfit/job/torch/passenger/passenger/investor
	name = OUTFIT_JOB_NAME("Investor - Torch")

/decl/hierarchy/outfit/job/torch/passenger/passenger/investor/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/storage/secure/briefcase/money/case = new(H.loc)
	H.put_in_hands(case)

/decl/hierarchy/outfit/job/torch/merchant
	name = OUTFIT_JOB_NAME("Merchant - Torch")
	uniform = /obj/item/clothing/under/color/black
	l_ear = null
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda
	id_types= list(/obj/item/card/id/torch/merchant)

/decl/hierarchy/outfit/job/torch/ert
	name = OUTFIT_JOB_NAME("ERT - Torch")
	uniform = /obj/item/clothing/under/lordan/utility/tan
	head = /obj/item/clothing/head/soft/lordan/tan
	gloves = /obj/item/clothing/gloves/thick/duty/lordan
	id_types= list(/obj/item/card/id/centcom/ERT)
	pda_type = /obj/item/modular_computer/pda/ert
	l_ear = /obj/item/device/radio/headset/ert
	shoes = /obj/item/clothing/shoes/lordan

/decl/hierarchy/outfit/job/torch/ert/leader
	name = OUTFIT_JOB_NAME("ERT Leader - Torch")
	uniform = /obj/item/clothing/under/lordan/utility/tan/command

/decl/hierarchy/outfit/job/torch/stowaway
	name = OUTFIT_JOB_NAME("Stowaway - Torch")
	pda_type = null
	l_ear = null
	l_pocket = /obj/item/wrench
	r_pocket = /obj/item/crowbar/prybar
	id = null

/decl/hierarchy/outfit/job/torch/stowaway/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/card/id/torch/stowaway/ID = new(H.loc)
	H.equip_to_slot_or_store_or_drop(ID, id_slot)
