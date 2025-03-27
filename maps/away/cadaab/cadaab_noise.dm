/turf/unsimulated/wall/cadaab
	name = "distant noise"
	desc = "In these days, electrical noise follows people everywhere. Not always intelligible, but always unstoppable. It is like radio interference. It seems to intensify as it approaches the boundary of known space. Sometimes you can make out words in the noise. A strange whisper that makes no sense."
	icon = 'maps/away/cadaab/icons/turfs.dmi'
	icon_state = "noise1"
	density = TRUE
	layer = ABOVE_HUMAN_LAYER
	opacity = 1
	blocks_air = 1

/turf/simulated/wall/cadaab/Initialize()
	.=..()
	icon_state = "noise[rand(1,3)]"


/obj/machinery/noisetv //wip
	name = "transmission center"
	desc = "A device assembled from parts found on Cadaab, waiting to receive a transmission."
	icon = 'maps/away/cadaab/icons/objects.dmi'
	icon_state = "tvnoise"
	anchored = TRUE
	density = TRUE
	var/on = FALSE
	construct_state = /decl/machine_construction/default/panel_closed

/obj/machinery/noisetv/on_update_icon()
	if(on)
		icon_state = "[initial(icon_state)]-on"
	else
		icon_state = "[initial(icon_state)]"

/obj/machinery/noisetv/proc/playnoise()
	playsound(src, pick('sound/ambience/bos/noise.ogg', 'sound/ambience/bos/noise2.ogg','sound/ambience/bos/noise3.ogg'), 50)
	if(prob(10))
		var/phrase_1 = pick("A victorious day", "The Day of Mourning", "Great event", "The-e-e-e-e", "A new decision has been made", "A measure of necessity")
		var/phrase_2 = pick("Boris Booker", "Gensek Goodman", "Lord-Regent", "Lord-Protector", "Hub Council", "Syndicate Dirrectors", "Alliance of Humanity High Consulate", "Frau Marta")
		var/phrase_3 = pick("Name it Fiolet Danger", "Danger of rebuilding vox Empire", "Status of Mirania", "Last tajaras", "Strange fleet Ellipse", "Not repeat the era of Silence", "New warlord", "Recover of the Patriots", "Strange signals from deep space")
		visible_message(SPAN_NOTICE("Noise-covered voices come from the [src]: '[phrase_1]... [phrase_2]... [phrase_3]'"))
	if(on)
		addtimer(CALLBACK(src, PROC_REF(playnoise)), 5 SECONDS)

/obj/machinery/noisetv/proc/endnoise()
	on = !on
	if(on)
		audible_message(SPAN_WARNING("[src] makes a terrible noise! You don't think it will go away until the broadcast is over."))
		update_icon()
		set_light(1, 1, 1, l_color = "#cdcbd6")
		addtimer(CALLBACK(src, PROC_REF(endnoise)), 2 MINUTES)
		playnoise()
	else
		audible_message(SPAN_WARNING("Everything went quiet."))
		playsound(src, null, 0)
		set_light(0, 0, 0)
		update_icon()

/obj/machinery/noisetv/bigger
	icon_state = "tvnoise2"

/obj/machinery/noisetv/old
	name = "old TV"
	desc = "An old TV. You doubt that it still works."
	icon_state = "tvnoise3"
