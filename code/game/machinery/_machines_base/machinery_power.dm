/*
This is /obj/machinery level code to properly manage power usage from the area.
*/

// Note that we update the area even if the area is unpowered.
#define REPORT_POWER_CONSUMPTION_CHANGE(old_power, new_power)\
	if(old_power != new_power){\
		var/area/A = get_area(src);\
		if(A) A.power_use_change(old_power, new_power, power_channel)}

/**
 * Returns `TRUE` if the area has power on given channel (or doesn't require power), defaults to `power_channel`.
 * May also optionally specify an area, otherwise defaults to `loc.loc`.
 */
/obj/machinery/proc/powered(chan = POWER_CHAN, area/check_area = null)

	if(!loc)
		return FALSE

	//Don't do this. It allows machines that set use_power to 0 when off (many machines) to
	//be turned on again and used after a power failure because they never gain the NOPOWER flag.
	//if(!use_power)
	//	return 1

	if(!check_area)
		check_area = loc.loc		// make sure it's in an area
	if(!check_area || !isarea(check_area))
		return FALSE					// if not, then not powered
	if(chan == POWER_CHAN)
		chan = power_channel
	return check_area.powered(chan)			// return power status of the area

// called whenever the power settings of the containing area change
// by default, check equipment channel & set flag can override if needed
// This is NOT for when the machine's own status changes; update_use_power for that.
/obj/machinery/proc/power_change()
	if(stat_immune & NOPOWER)
		return FALSE
	var/oldstat = stat
	stat |= NOPOWER
	for(var/thing in power_components)
		var/obj/item/stock_parts/power/power = thing
		if((stat & NOPOWER) && power.can_provide_power(src))
			stat &= ~NOPOWER
		else
			power.not_needed(src)

	. = (stat != oldstat)
	if(.)
		queue_icon_update()

/// Returns the current power usage draw, based on the state of `use_power`.
/obj/machinery/proc/get_power_usage()
	switch(use_power)
		if(POWER_USE_IDLE)
			return idle_power_usage
		if(POWER_USE_ACTIVE)
			return active_power_usage
		else
			return 0

/**
 *  This will have this machine have its area eat this much power next tick, and not afterwards. Do not use for continued power draw.
 * `chan` can be one of the possible values for `power_channel`, or `POWER_CHAN` to use the machine's current configured power channel.
 */
/obj/machinery/proc/use_power_oneoff(amount, chan = POWER_CHAN)
	if(chan == POWER_CHAN)
		chan = power_channel
	. = amount
	for(var/thing in power_components)
		var/obj/item/stock_parts/power/power = thing
		var/used = power.use_power_oneoff(src, ., chan)
		. -= used
		if(. <= 0)
			return

// Same as `use_power_oneoff()`, but dry run; doesn't actually do it. Useful for pre-operation checks.
/obj/machinery/proc/can_use_power_oneoff(amount, chan = POWER_CHAN)
	if(chan == POWER_CHAN)
		chan = power_channel
	. = amount
	for(var/thing in power_components)
		var/obj/item/stock_parts/power/power = thing
		var/used = power.can_use_power_oneoff(src, ., chan)
		. -= used
		if(. <= 0)
			return

// Do not do power stuff in New/Initialize until after ..()
/obj/machinery/Initialize()
	REPORT_POWER_CONSUMPTION_CHANGE(0, get_power_usage())
	GLOB.moved_event.register(src, src, PROC_REF(update_power_on_move))
	power_init_complete = TRUE
	. = ..()

// Or in Destroy at all, but especially after the ..().
/obj/machinery/Destroy()
	GLOB.moved_event.unregister(src, src, PROC_REF(update_power_on_move))
	REPORT_POWER_CONSUMPTION_CHANGE(get_power_usage(), 0)
	. = ..()

/// Handles updating machinery power whenever the machine is moved. Calls `area_changed()` by default.
/obj/machinery/proc/update_power_on_move(atom/movable/mover, atom/old_loc, atom/new_loc)
	area_changed(get_area(old_loc), get_area(new_loc))

/// Handles machinery power updates if the area the machine is in changes. Called by `update_power_on_move()`.
/obj/machinery/proc/area_changed(area/old_area, area/new_area)
	if(old_area == new_area)
		return
	var/power = get_power_usage()
	if(!power)
		return // This is the most likely case anyway.

	if(old_area)
		old_area.power_use_change(power, 0, power_channel)
	if(new_area)
		new_area.power_use_change(0, power, power_channel)
	power_change() // Force check in case the old area was powered and the new one isn't or vice versa.

// The three procs below are the only allowed ways of modifying the corresponding variables.
/// Updates the `use_power` variable to the new value and updates the machine's area's power grid.
/obj/machinery/proc/update_use_power(new_use_power)
	if(!power_init_complete)
		use_power = new_use_power
		return // We'll be retallying anyway.
	if(use_power == new_use_power)
		return
	var/old_power = get_power_usage()
	use_power = new_use_power
	var/new_power = get_power_usage()
	REPORT_POWER_CONSUMPTION_CHANGE(old_power, new_power)

/// Updates the machine's `power_channel` to the new value and updates the machine's area's power grid.
/obj/machinery/proc/update_power_channel(new_channel)
	if(power_channel == new_channel)
		return
	if(!power_init_complete)
		power_channel = new_channel
		return
	var/power = get_power_usage()
	REPORT_POWER_CONSUMPTION_CHANGE(power, 0)
	power_channel = new_channel
	REPORT_POWER_CONSUMPTION_CHANGE(0, power)

/// Updates the machine's `*_power_usage` to the new value and updates the machine's current power consumption state if applicable.
/obj/machinery/proc/change_power_consumption(new_power_consumption, use_power_mode = POWER_USE_IDLE)
	var/old_power
	switch(use_power_mode)
		if(POWER_USE_IDLE)
			old_power = idle_power_usage
			idle_power_usage = new_power_consumption
		if(POWER_USE_ACTIVE)
			old_power = active_power_usage
			active_power_usage = new_power_consumption
		else
			return
	if(power_init_complete && (use_power_mode == use_power))
		REPORT_POWER_CONSUMPTION_CHANGE(old_power, new_power_consumption)

#undef REPORT_POWER_CONSUMPTION_CHANGE
