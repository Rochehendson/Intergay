SUBSYSTEM_DEF(ticker)
	name = "Ticker"
	wait = 10
	priority = SS_PRIORITY_TICKER
	init_order = SS_INIT_TICKER
	flags = SS_NO_TICK_CHECK | SS_KEEP_TIMING
	runlevels = RUNLEVEL_LOBBY | RUNLEVELS_DEFAULT

	var/pregame_timeleft
	var/start_ASAP = FALSE          //the game will start as soon as possible, bypassing all pre-game nonsense
	var/list/gamemode_vote_results  //Will be a list, in order of preference, of form list(config_tag = number of votes).
	var/bypass_gamemode_vote = 0    //Intended for use with admin tools. Will avoid voting and ignore any results.

	var/master_mode = "extended"    //The underlying game mode (so "secret" or the voted mode). Saved to default back to previous round's mode in case the vote failed. This is a config_tag.
	var/datum/game_mode/mode        //The actual gamemode, if selected.
	var/round_progressing = 1       //Whether the lobby clock is ticking down.
	var/players_to_start = 15       // how much players we should have to start round

	var/list/bad_modes = list()     //Holds modes we tried to start and failed to.
	var/revotes_allowed = 0         //How many times a game mode revote might be attempted before giving up.

	var/end_game_state = END_GAME_NOT_OVER
	var/delay_end = 0               //Can be set true to postpone restart.
	var/delay_notified = 0          //Spam prevention.
	var/restart_timeout = 1 MINUTE

	var/list/minds = list()         //Minds of everyone in the game.
	var/list/antag_pool = list()
	var/looking_for_antags = 0

	var/secret_force_mode = "secret"

	///Set to TRUE when an admin forcefully ends the round.
	var/forced_end = FALSE

	var/static/list/mode_tags = list()

	var/static/list/mode_names = list()

	var/static/list/mode_cache = list()

	var/static/list/mode_probabilities = list()

	var/static/list/votable_modes = list()

	/// True when the game is over.
	var/static/game_over = FALSE


/datum/controller/subsystem/ticker/Initialize(start_uptime)
	pregame_timeleft = config.pre_game_time SECONDS
	build_mode_cache()
	to_world("<span class='info'><B>Welcome to the pre-game lobby!</B></span>")
	to_world("Please, setup your character and select ready. Game will start in [round(pregame_timeleft/10)] seconds")


/datum/controller/subsystem/ticker/fire(resumed, no_mc_tick)
	switch(GAME_STATE)
		if(RUNLEVEL_LOBBY)
			pregame_tick()
		if(RUNLEVEL_SETUP)
			setup_tick()
		if(RUNLEVEL_GAME)
			playing_tick()
		if(RUNLEVEL_POSTGAME)
			post_game_tick()


/datum/controller/subsystem/ticker/proc/build_mode_cache()
	mode_tags = list()
	mode_names = list()
	mode_cache = list()
	mode_probabilities = list()
	for (var/datum/game_mode/mode as anything in subtypesof(/datum/game_mode))
		var/tag = initial(mode.config_tag)
		if (!tag)
			continue
		mode_cache[tag] = (mode = new mode)
		if (tag in mode_tags)
			continue
		mode_tags += tag
		mode_names[tag] = mode.name
		mode_probabilities[tag] = 0
		if (mode.votable)
			votable_modes += tag
	votable_modes -= config.disallowed_modes
	for (var/key in config.probabilities)
		mode_probabilities[key] = config.probabilities[key]


/datum/controller/subsystem/ticker/proc/get_runnable_modes()
	var/list/lobby_players = lobby_players()
	var/list/result = list()
	for (var/tag in mode_cache)
		var/datum/game_mode/mode = mode_cache[tag]
		if (mode_probabilities[tag] > 0 && !mode.check_startable(lobby_players))
			result[tag] = mode_probabilities[tag]
	return result


/datum/controller/subsystem/ticker/proc/pick_mode(mode_name)
	if (!mode_name)
		return
	for (var/tag in SSticker.mode_cache)
		var/datum/game_mode/M = SSticker.mode_cache[tag]
		if (M.config_tag == mode_name)
			return M


/datum/controller/subsystem/ticker/proc/pregame_tick()
	if(start_ASAP)
		start_now()
		return
	var/list/lobby = lobby_players()
	if(round_progressing && last_fire && length(lobby) >= players_to_start)
		pregame_timeleft -= world.time - last_fire
	if(pregame_timeleft <= 0)
		Master.SetRunLevel(RUNLEVEL_SETUP)
		return

	if(!bypass_gamemode_vote && (pregame_timeleft <= config.vote_autogamemode_timeleft SECONDS) && !gamemode_vote_results)
#ifndef UNIT_TEST
		if (!length(lobby))
			pregame_timeleft = config.vote_period + 60 SECONDS
			return
#endif
		if(!SSvote.active_vote)
			SSvote.initiate_vote(/datum/vote/gamemode, automatic = 1)

/datum/controller/subsystem/ticker/proc/setup_tick()
#ifndef UNIT_TEST
	if (!start_ASAP)
		var/list/ready = ready_players()
		if (!length(ready))
			pregame_timeleft = config.vote_period + 30 SECONDS
			gamemode_vote_results = null
			Master.SetRunLevel(RUNLEVEL_LOBBY)
			to_world("<b>No ready players.</b> Returning to pre-game lobby.")
			return
#endif

	switch(choose_gamemode())
		if(CHOOSE_GAMEMODE_SILENT_REDO)
			log_debug("Silently re-rolling game mode...")
			return
		if(CHOOSE_GAMEMODE_RETRY)
			pregame_timeleft = 30 SECONDS
			Master.SetRunLevel(RUNLEVEL_LOBBY)
			to_world("<B>Unable to choose playable game mode.</B> Reverting to pre-game lobby to try again.")
			return
		if(CHOOSE_GAMEMODE_REVOTE)
			revotes_allowed--
			pregame_timeleft = config.vote_period + 30 SECONDS
			gamemode_vote_results = null
			Master.SetRunLevel(RUNLEVEL_LOBBY)
			to_world("<B>Unable to choose playable game mode.</B> Reverting to pre-game lobby for a revote.")
			return
		if(CHOOSE_GAMEMODE_RESTART)
			to_world("<B>Unable to choose playable game mode.</B> Restarting world.")
			world.Reboot("Failure to select gamemode. Tried [english_list(bad_modes)].")
			return
	// This means we succeeded in picking a game mode.
	GLOB.using_map.setup_economy()
	Master.SetRunLevel(RUNLEVEL_GAME)

	create_characters() //Create player characters and transfer them
	collect_minds()
	equip_characters()
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(H.mind && !player_is_antag(H.mind, only_offstation_roles = 1))
			var/datum/job/job = SSjobs.get_by_title(H.mind.assigned_role)
			if(job && job.create_record)
				CreateModularRecord(H)

	callHook("roundstart")

	spawn(0)//Forking here so we dont have to wait for this to finish
		mode.post_setup() // Drafts antags who don't override jobs.
		to_world("<span class='info'><B>Enjoy the game!</B></span>")
		sound_to(world, sound(GLOB.using_map.welcome_sound))

		for (var/mob/new_player/player in GLOB.player_list)
			player.new_player_panel()

		generate_contracts(min(6 + round(minds.len / 5), 12)) //BoS
		addtimer(CALLBACK(src, PROC_REF(contract_tick)), 15 MINUTES)

	if(!GLOB.admins.len)
		send2adminirc("Round has started with no admins online.")

/datum/controller/subsystem/ticker/proc/playing_tick()
	mode.process()
	var/mode_finished = mode_finished()

	if(mode_finished && game_finished())
		Master.SetRunLevel(RUNLEVEL_POSTGAME)
		end_game_state = END_GAME_READY_TO_END
		INVOKE_ASYNC(src, PROC_REF(declare_completion))
		if(config.allow_map_switching && config.auto_map_vote && GLOB.all_maps.len > 1)
			SSvote.initiate_vote(/datum/vote/map/end_game, automatic = 1)

	else if(mode_finished && (end_game_state <= END_GAME_NOT_OVER))
		end_game_state = END_GAME_MODE_FINISH_DONE
		mode.cleanup()
		log_and_message_admins(": All antagonists are deceased or the gamemode has ended.") //Outputs as "Event: All antagonists are deceased or the gamemode has ended."
		SSvote.initiate_vote(/datum/vote/transfer, automatic = 1)

/datum/controller/subsystem/ticker/proc/post_game_tick()
	switch(end_game_state)
		if(END_GAME_AWAITING_MAP)
			return
		if(END_GAME_READY_TO_END)
			end_game_state = END_GAME_ENDING
			callHook("roundend")
			if (game_over)
				if(!delay_end)
					to_world("<span class='notice'><b>Rebooting due to destruction of [station_name()] in [restart_timeout/10] seconds</b></span>")

			else
				if(!delay_end)
					to_world("<span class='notice'><b>Restarting in [restart_timeout/10] seconds</b></span>")
			handle_tickets()
		if(END_GAME_ENDING)
			restart_timeout -= (world.time - last_fire)
			if(restart_timeout <= 0)
				world.Reboot()
			if(delay_end)
				notify_delay()
				end_game_state = END_GAME_DELAYED
		if(END_GAME_AWAITING_TICKETS)
			handle_tickets()
		if(END_GAME_DELAYED)
			if(!delay_end)
				end_game_state = END_GAME_ENDING
		else
			end_game_state = END_GAME_READY_TO_END
			log_error("Ticker arrived at round end in an unexpected endgame state.")


/datum/controller/subsystem/ticker/UpdateStat(time)
	if (PreventUpdateStat(time))
		return ..()
	switch (GAME_STATE)
		if (RUNLEVEL_LOBBY)
			..("[round_progressing ? "START: [round(pregame_timeleft / 10)]s" : "(PAUSED)"]")
		if (RUNLEVEL_SETUP)
			..("SETUP")
		if (RUNLEVEL_GAME)
			..("GAME")
		if (RUNLEVEL_POSTGAME)
			switch (end_game_state)
				if (END_GAME_NOT_OVER)
					..("ENDGAME ERROR")
				if (END_GAME_AWAITING_MAP)
					..("MAP VOTE")
				if (END_GAME_MODE_FINISH_DONE)
					..("MODE OVER, WAITING")
				if (END_GAME_READY_TO_END)
					..("ENDGAME PROCESSING")
				if (END_GAME_DELAYED)
					..("PAUSED")
				if (END_GAME_AWAITING_TICKETS)
					..("AWAITING TICKETS")
				if (END_GAME_ENDING)
					..("END IN [round(restart_timeout / 10)]s")
				else
					..()
		else
			..()


/datum/controller/subsystem/ticker/Recover()
	pregame_timeleft = SSticker.pregame_timeleft
	gamemode_vote_results = SSticker.gamemode_vote_results
	bypass_gamemode_vote = SSticker.bypass_gamemode_vote

	master_mode = SSticker.master_mode
	mode = SSticker.mode
	round_progressing = SSticker.round_progressing

	end_game_state = SSticker.end_game_state
	delay_end = SSticker.delay_end
	delay_notified = SSticker.delay_notified

	minds = SSticker.minds

/*
Helpers
*/

/datum/controller/subsystem/ticker/proc/choose_gamemode()
	. = (revotes_allowed && !bypass_gamemode_vote) ? CHOOSE_GAMEMODE_REVOTE : CHOOSE_GAMEMODE_RESTART

	var/mode_to_try = master_mode //This is the config tag
	var/datum/game_mode/mode_datum

	//Decide on the mode to try.
	if(!bypass_gamemode_vote && gamemode_vote_results)
		gamemode_vote_results -= bad_modes
		if(length(gamemode_vote_results))
			mode_to_try = gamemode_vote_results[1]
			. = CHOOSE_GAMEMODE_RETRY //Worth it to try again at least once.
		else
			mode_to_try = "extended"

	if(!mode_to_try)
		log_debug("Could not find a valid game mode from config or vote results.")
		return
	if(mode_to_try in bad_modes)
		log_debug("Could not start game mode [mode_to_try] - Mode is listed in bad_modes.")
		return

	//Find the relevant datum, resolving secret in the process.
	var/list/base_runnable_modes = get_runnable_modes() //format: list(config_tag = weight)
	if (mode_to_try=="secret")
		var/list/runnable_modes = base_runnable_modes - bad_modes
		if(secret_force_mode != "secret") // Config option to force secret to be a specific mode.
			mode_datum = pick_mode(secret_force_mode)
		else if(!length(runnable_modes))  // Indicates major issues; will be handled on return.
			bad_modes += mode_to_try
			log_debug("Could not start game mode [mode_to_try] - No runnable modes available to start, or all options listed under bad modes.")
			return
		else
			mode_datum = pick_mode(pickweight(runnable_modes))
			if(length(runnable_modes) > 1) // More to pick if we fail; we won't tell anyone we failed unless we fail all possibilities, though.
				. = CHOOSE_GAMEMODE_SILENT_REDO
	else
		mode_datum = pick_mode(mode_to_try)
	if(!istype(mode_datum))
		bad_modes += mode_to_try
		log_debug("Could not find a valid game mode for [mode_to_try].")
		return

	//Deal with jobs and antags, check that we can actually run the mode.
	SSjobs.reset_occupations() // Clears all players' role assignments. Clean slate.
	mode_datum.create_antagonists() // Init operation on the mode; sets up antag datums and such.
	mode_datum.pre_setup() // Makes lists of viable candidates; performs candidate draft for job-override roles; stores the draft result both internally and on the draftee.
	SSjobs.divide_occupations(mode_datum) // Gives out jobs to everyone who was not selected to antag.
	var/list/lobby_players = SSticker.lobby_players()
	var/result = mode_datum.check_startable(lobby_players)
	if(result)
		mode_datum.fail_setup()
		SSjobs.reset_occupations()
		bad_modes += mode_datum.config_tag
		log_debug("Could not start game mode [mode_to_try] ([mode_datum.name]) - Failed to meet requirements - [result]")
		return

	//Declare victory, make an announcement.
	. = CHOOSE_GAMEMODE_SUCCESS
	mode = mode_datum
	master_mode = mode_to_try
	if(mode_to_try == "secret")
		to_world("<B>The current game mode is Secret!</B>")
		var/list/mode_names = list()
		for (var/mode_tag in base_runnable_modes)
			var/datum/game_mode/M = mode_cache[mode_tag]
			if(M)
				mode_names += M.name
		if (config.secret_hide_possibilities)
			message_admins("<B>Possibilities:</B> [english_list(mode_names)]")
		else
			to_world("<B>Possibilities:</B> [english_list(mode_names)]")
	else
		mode.announce()

/datum/controller/subsystem/ticker/proc/create_characters()
	for(var/mob/new_player/player in GLOB.player_list)
		if(player && player.ready && player.mind)
			if(player.mind.assigned_role=="AI")
				player.close_spawn_windows()
				player.AIize()
			else if(!player.mind.assigned_role)
				continue
			else
				if(player.create_character())
					qdel(player)

/datum/controller/subsystem/ticker/proc/lobby_players(list/players)
	if (!players)
		players = GLOB.player_list
	var/list/lobby_players = list()
	for (var/mob/new_player/player in players)
		if (!player.client)
			continue
		lobby_players += player
	return lobby_players


/datum/controller/subsystem/ticker/proc/ready_players(list/players)
	if (!players)
		players = lobby_players()
	var/list/ready_players = list()
	for (var/mob/new_player/player as anything in players)
		if (!player.ready)
			continue
		ready_players += player
	return ready_players


/datum/controller/subsystem/ticker/proc/collect_minds()
	for(var/mob/living/player in GLOB.player_list)
		if(player.mind)
			minds += player.mind

/datum/controller/subsystem/ticker/proc/generate_contracts(count) //BoS
	var/list/candidates = subtypesof(/datum/antag_contract)
	while(count--)
		while(candidates.len)
			var/contract_type = pick(candidates)
			var/datum/antag_contract/C = new contract_type
			if(!C.can_place())
				candidates -= contract_type
				qdel(C)
				continue
			C.place()
			if(C.unique)
				candidates -= contract_type
			break

/datum/controller/subsystem/ticker/proc/contract_tick() //Also BoS
	generate_contracts(1)
	addtimer(CALLBACK(src, PROC_REF(contract_tick)), 15 MINUTES)



/datum/controller/subsystem/ticker/proc/equip_characters()
	var/captainless=1
	for(var/mob/living/carbon/human/player in GLOB.player_list)
		if(player && player.mind && player.mind.assigned_role)
			if(player.mind.assigned_role == "Captain")
				captainless=0
			if(!player_is_antag(player.mind, only_offstation_roles = 1))
				SSjobs.equip_rank(player, player.mind.assigned_role, 0)
				SScustomitems.equip_custom_items(player)
	if(captainless)
		for(var/mob/M in GLOB.player_list)
			if(!istype(M,/mob/new_player))
				to_chat(M, "Captainship not forced on anyone.")

/datum/controller/subsystem/ticker/proc/attempt_late_antag_spawn(var/list/antag_choices)
	var/datum/antagonist/antag = antag_choices[1]
	while(antag_choices.len && antag)
		var/needs_ghost = antag.flags & (ANTAG_OVERRIDE_JOB | ANTAG_OVERRIDE_MOB)
		if (needs_ghost)
			looking_for_antags = 1
			antag_pool.Cut()
			to_world("<b>A ghost is needed to spawn \a [antag.role_text].</b>\nGhosts may enter the antag pool by making sure their [antag.role_text] preference is set to high, then using the toggle-add-antag-candidacy verb. You have 3 minutes to enter the pool.")

			sleep(3 MINUTES)
			looking_for_antags = 0
			antag.update_current_antag_max(mode)
			antag.build_candidate_list(mode, needs_ghost)
			for(var/datum/mind/candidate in antag.candidates)
				if(!(candidate in antag_pool))
					antag.candidates -= candidate
					log_debug("[candidate.key] was not in the antag pool and could not be selected.")
		else
			antag.update_current_antag_max(mode)
			antag.build_candidate_list(mode, needs_ghost)
			for(var/datum/mind/candidate in antag.candidates)
				if(isghostmind(candidate))
					antag.candidates -= candidate
					log_debug("[candidate.key] is a ghost and can not be selected.")
		if(length(antag.candidates) >= antag.initial_spawn_req)
			antag.attempt_spawn()
			antag.finalize_spawn()
			additional_antag_types.Add(antag.id)
			return 1
		else
			if(antag.initial_spawn_req > 1)
				to_world("Failed to find enough [antag.role_text_plural].")

			else
				to_world("Failed to find a [antag.role_text].")

			antag_choices -= antag
			if(length(antag_choices))
				antag = antag_choices[1]
				if(antag)
					to_world("Attempting to spawn [antag.role_text_plural].")
	return 0

/datum/controller/subsystem/ticker/proc/game_finished()
	if (forced_end)
		return TRUE

	if(mode.explosion_in_progress)
		return 0
	if(config.continous_rounds)
		return evacuation_controller.round_over() || mode.station_was_nuked
	else
		return mode.check_finished() || (evacuation_controller.round_over() && evacuation_controller.emergency_evacuation) || game_over

/datum/controller/subsystem/ticker/proc/mode_finished()
	if (forced_end)
		return TRUE

	if(config.continous_rounds)
		return mode.check_finished()
	else
		return game_finished()

/datum/controller/subsystem/ticker/proc/notify_delay()
	if(!delay_notified)
		to_world("<span class='notice'><b>An admin has delayed the round end</b></span>")
	delay_notified = 1

/datum/controller/subsystem/ticker/proc/handle_tickets()
	for(var/datum/ticket/ticket in tickets)
		if(ticket.is_active())
			if(!delay_notified)
				message_staff("<span class='warning'><b>Automatically delaying restart due to active tickets.</b></span>")
			notify_delay()
			end_game_state = END_GAME_AWAITING_TICKETS
			return
	message_staff("<span class='warning'><b>No active tickets remaining, restarting in [restart_timeout/10] seconds if an admin has not delayed the round end.</b></span>")
	end_game_state = END_GAME_ENDING

/datum/controller/subsystem/ticker/proc/declare_completion()
	to_world("<br><br><br><H1>A round of [mode.name] has ended!</H1>")
	for(var/client/C)
		if(!C.credits)
			C.RollCredits()

	GLOB.using_map.roundend_player_status()

	to_world("<br>")

	for(var/mob/living/silicon/ai/aiPlayer in SSmobs.mob_list)
		var/show_ai_key = aiPlayer.get_preference_value(/datum/client_preference/show_ckey_credits) == GLOB.PREF_SHOW
		to_world("<b>[aiPlayer.name][show_ai_key ? " (played by [aiPlayer.key])" : ""]'s laws at the [aiPlayer.stat == 2 ? "time of their deactivation" : "end of round"] were:</b>")
		aiPlayer.show_laws(1)

		if (aiPlayer.connected_robots.len)
			var/minions = "<b>[aiPlayer.name]'s loyal minions were:</b>"
			for(var/mob/living/silicon/robot/robo in aiPlayer.connected_robots)
				var/show_robot_key = robo.get_preference_value(/datum/client_preference/show_ckey_credits) == GLOB.PREF_SHOW
				minions += " [robo.name][show_robot_key ? "(played by: [robo.key])" : ""][robo.stat ? " (deactivated)" : ""],"
			to_world(minions)

	var/dronecount = 0

	for (var/mob/living/silicon/robot/robo in SSmobs.mob_list)

		if(istype(robo,/mob/living/silicon/robot/drone))
			dronecount++
			continue

		if (!robo.connected_ai)
			var/show_robot_key = robo.get_preference_value(/datum/client_preference/show_ckey_credits) == GLOB.PREF_SHOW
			to_world("<b>[robo.name][show_robot_key ? " (played by [robo.key])" : ""]'s individual laws at the [robo.stat == 2 ? "time of their deactivation" : "end of round"] were:</b>")

			if(robo) //How the hell do we lose robo between here and the world messages directly above this?
				robo.laws.show_laws(world)

	if(dronecount)
		to_world("<b>There [dronecount>1 ? "were" : "was"] [dronecount] industrious maintenance [dronecount>1 ? "drones" : "drone"] at the end of this round.</b>")

	if(all_money_accounts.len)
		var/datum/money_account/max_profit = all_money_accounts[1]
		var/datum/money_account/max_loss = all_money_accounts[1]
		for(var/datum/money_account/D in all_money_accounts)
			if(D == vendor_account) //yes we know you get lots of money
				continue
			var/saldo = D.get_balance()
			if(saldo >= max_profit.get_balance())
				max_profit = D
			if(saldo <= max_loss.get_balance())
				max_loss = D
		to_world("<b>[max_profit.owner_name]</b> received most <font color='green'><B>PROFIT</B></font> today, with net profit of <b>[GLOB.using_map.local_currency_name_short][max_profit.get_balance()]</b>.")
		to_world("On the other hand, <b>[max_loss.owner_name]</b> had most <font color='red'><B>LOSS</B></font>, with total loss of <b>[GLOB.using_map.local_currency_name_short][max_loss.get_balance()]</b>.")

	mode.declare_completion()//To declare normal completion.

	//Ask the event manager to print round end information
	SSevent.RoundEnd()

	//Print a list of antagonists to the server log
	var/list/total_antagonists = list()
	//Look into all mobs in world, dead or alive
	for(var/datum/mind/Mind in minds)
		var/temprole = Mind.special_role
		if(temprole)							//if they are an antagonist of some sort.
			if(temprole in total_antagonists)	//If the role exists already, add the name to it
				total_antagonists[temprole] += ", [Mind.name]([Mind.key])"
			else
				total_antagonists.Add(temprole) //If the role doesnt exist in the list, create it and add the mob
				total_antagonists[temprole] += ": [Mind.name]([Mind.key])"

	//Now print them all into the log!
	log_game("Antagonists at round end were...")
	for(var/i in total_antagonists)
		log_game("[i]s[total_antagonists[i]].")

/datum/controller/subsystem/ticker/proc/start_now(mob/user)
	if(!(GAME_STATE == RUNLEVEL_LOBBY))
		return
	if(istype(SSvote.active_vote, /datum/vote/gamemode))
		SSvote.cancel_vote(user)
		bypass_gamemode_vote = 1
	Master.SetRunLevel(RUNLEVEL_SETUP)
	return 1
