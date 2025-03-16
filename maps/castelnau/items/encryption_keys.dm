/obj/item/device/encryptionkey/heads/castelnau_captain
	name = "captain's encryption key"
	icon_state = "cap_cypherkey"
//	channels = list("Regulators" =1, "Command" = 1, "Security" = 1, "Engineering" = 1, "Medical" = 1, "Service" = 1)
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "Medical" = 1, "Service" = 1)

/obj/item/device/encryptionkey/heads/castelnau_coordinator
	name = "coordinator's encryption key"
	icon_state = "hop_cypherkey"
//	channels = list("Regulators" =1, "Command" = 1, "Security" = 1, "Engineering" = 1, "Medical" = 1, "Service" = 1)
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "Medical" = 1, "Service" = 1)

/obj/item/device/encryptionkey/heads/castelnau_adjutant
	name = "bridge assistant's encryption key"
	icon_state = "hop_cypherkey"
//	channels = list("Regulators" =1, "Command" = 1, "Security" = 1, "Engineering" = 1, "Medical" = 1, "Service" = 1)
	channels = list("Command" = 1, "Engineering" = 1, "Medical" = 1, "Service" = 1)

/obj/item/device/encryptionkey/heads/castelnau_seniorengi
	name = "senior engineer's encryption key"
	icon_state = "ce_cypherkey"
	channels = list("Command" = 1, "Engineering" = 1)

/obj/item/device/encryptionkey/heads/castelnau_seniorengi/reg
	name = "regulators senior engineer's encryption key"
//	channels = list("Regulators" =1, "Command" = 1, "Engineering" = 1)
	channels = list("Command" = 1, "Engineering" = 1)

//dalshe idut ne glavi no mne uzhe pohui voobshe//

/obj/item/device/encryptionkey/heads/castelnau_engi
	name = "engineer's encryption key"
	icon_state = "eng_cypherkey"
	channels = list("Engineering" = 1)

/obj/item/device/encryptionkey/heads/castelnau_engi/syn
	name = "syndicate engineer's encryption key"
	icon_state = "syn_cypherkey"
	channels = list("Engineering" = 1)//, "Syndicate" =1)

/obj/item/device/encryptionkey/heads/castelnau_pilot
	name = "pilot's encryption key"
	icon_state = "cypherkey"
	channels = list("Common" = 1)

/obj/item/device/encryptionkey/heads/castelnau_pilot/syn
	name = "syndicate pilot's encryption key"
	icon_state = "syn_cypherkey"
//	channels = list("Syndicate" = 1)

/obj/item/device/encryptionkey/heads/castelnau_outlead
	name = "outpost leader's encryption key"
	icon_state = "srv_cypherkey"
//	channels = list("Regulators"=1, "Command" = 1)
	channels = list("Command" = 1)

/obj/item/device/encryptionkey/heads/castelnau_outeng
	name = "outpost engineer's encryption key"
	icon_state = "eng_cypherkey"
//	channels = list("Regulators"=1, "Engineering" = 1)
	channels = list("Engineering" = 1)

/obj/item/device/encryptionkey/heads/castelnau_outmed
	name = "outpost medic's encryption key"
	icon_state = "med_cypherkey"
//	channels = list("Regulators"=1, "Medical" = 1)
	channels = list("Medical" = 1)

/obj/item/device/encryptionkey/heads/castelnau_outsec
	name = "outpost security's encryption key"
	icon_state = "sec_cypherkey"
//	channels = list("Regulators"=1, "Security" = 1)
	channels = list("Security" = 1)

/obj/item/device/encryptionkey/heads/castelnau_surgeon
	name = "surgeon's encryption key"
	icon_state = "med_cypherkey"
//	channels = list("Regulators"=1, "Medical" = 1)
	channels = list("Medical" = 1)

/obj/item/device/encryptionkey/heads/castelnau_med
	name = "medical encryption key"
	icon_state = "med_cypherkey"
	channels = list("Medical" = 1)

/obj/item/device/encryptionkey/heads/castelnau_med/syn
	name = "syndicate medical encryption key"
	icon_state = "syn_cypherkey"
//	channels = list("Medical" = 1, "Syndicate" =1)
	channels = list("Medical" = 1)

/obj/item/device/encryptionkey/heads/castelnau_surgeon/reg
	name = "regulators surgeon's encryption key"
	icon_state = "med_cypherkey"
//	channels = list("Regulators"=1, "Medical" = 1)
	channels = list("Medical" = 1)

/obj/item/device/encryptionkey/heads/cheapskate_chief
	name = "chief merchant's encryption key"
	icon_state = "qm_cypherkey"
	channels = list("Command"=1, "Supply" = 1)

/obj/item/device/encryptionkey/heads/cheapskate_supply
	name = "supply encryption key"
	icon_state = "cargo_cypherkey"
	channels = list("Supply" = 1)

/obj/item/device/encryptionkey/heads/cheapskate_security
	name = "ftu security encryption key"
	icon_state = "cargo_cypherkey"
	channels = list("Supply" = 1, "Security"=1)

/obj/item/device/encryptionkey/heads/castelnau_sheriff
	name = "sheriff's encryption key"
	icon_state = "hos_cypherkey"
	channels = list("Command"=1, "Security" = 1)

/obj/item/device/encryptionkey/heads/castelnau_security
	name = "security encryption key"
	icon_state = "sec_cypherkey"
	channels = list("Security" = 1)

/obj/item/device/encryptionkey/heads/castelnau_security/syn
	name = "syndicate security encryption key"
	icon_state = "syn_cypherkey"
	channels = list("Security" = 1, "Syndicate" =1)

/obj/item/device/encryptionkey/heads/castelnau_service
	name = "service encryption key"
	icon_state = "srv_cypherkey"
	channels = list("Service"=1)

/obj/item/storage/box/radiokeys
	name = "box of radio encryption keys"
	desc = "A box full of assorted encryption keys."
	startswith = list(/obj/item/device/encryptionkey/headset_sec = 3,
					  /obj/item/device/encryptionkey/headset_med = 3,
					  /obj/item/device/encryptionkey/headset_cargo = 3)

/obj/item/storage/box/radiokeys/Initialize()
	. = ..()
	make_exact_fit()

/obj/item/device/encryptionkey/heads/castelnau_raidlead
	name = "raid unit leader encryption key"
	icon_state = "hos_cypherkey"
	channels = list("Command"=1, "Security" = 1)

/obj/item/device/encryptionkey/heads/castelnau_raidlead/syn
	name = "raid unit leader encryption key"
	icon_state = "syn_cypherkey"
	channels = list("Command"=1, "Security" = 1)

/obj/item/device/encryptionkey/heads/castelnau_raidparty
	name = "raid unit encryption key"
	icon_state = "hos_cypherkey"
	channels = list("Security" = 1)

/obj/item/device/encryptionkey/heads/castelnau_raidparty/syn
	name = "syndicate raid unit encryption key"
	icon_state = "syn_cypherkey"
	channels = list("Security" = 1)