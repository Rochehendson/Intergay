/datum/admins/proc/toggleobservers()
	set category = "Server"
	set desc="Players can't join as a ghost."
	set name="Toggle observers"
	if(!check_rights(R_SERVER))
		return

	config.observers_allowed = !config.observers_allowed

	if(GAME_STATE > RUNLEVEL_LOBBY)
		for(var/mob/new_player/player in GLOB.player_list)
			player.new_player_panel()

	to_world("<B>Игроки [config.observers_allowed ? "отныне могут" : "больше не могут"] заходить за призраков из лобби.</b>")
	log_and_message_admins("toggled observers game entering [config.observers_allowed ? "" : "dis"]allowed.")