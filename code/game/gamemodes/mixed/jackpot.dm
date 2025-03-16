/datum/game_mode/jackpot
	name = "Traitor & Ninja & Changeling & Wizard"
	round_description = "The ship is full of antagonists. Crew, the new objective - survive."
	extended_round_description = "Jackpot! You got all your friends today - traitors, changelings, ninja and wisard."
	config_tag = "jackpot"
	required_players = 20
	required_enemies = 6
	end_on_antag_death = FALSE
	antag_tags = list(MODE_TRAITOR, MODE_CHANGELING, MODE_NINJA, MODE_WIZARD)
	require_all_templates = TRUE
