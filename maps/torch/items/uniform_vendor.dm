/obj/machinery/uniform_vendor
	name = "uniform vendor"
	desc= "A uniform vendor for utility, service, and dress uniforms."
	icon = 'icons/bos/obj/vending.dmi'
	icon_state = "uniform"
	layer = BELOW_OBJ_LAYER
	anchored = 1
	density = 1

	// Power
	use_power = 1
	idle_power_usage = 10
	var/vend_power_usage = 150 //actuators and stuff

	var/obj/item/card/id/ID
	var/list/uniforms = list()
	var/list/selected_outfit = list()
	var/global/list/issued_items = list()

/obj/machinery/uniform_vendor/on_update_icon()
	if(stat & BROKEN)
		icon_state = "[initial(icon_state)]-broken"
	else if(!(stat & NOPOWER))
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]-off"

/obj/machinery/uniform_vendor/interface_interact(mob/user)
	interact(user)
	return TRUE

/obj/machinery/uniform_vendor/interact(mob/user)
	var/dat = list()
	dat += "User ID: <a href='byond://?src=\ref[src];ID=1'>[ID ? "[ID.registered_name], [ID.military_rank], [ID.military_branch]" : "--------"]</a>"
	dat += "<hr>"
	if(!ID)
		dat += "Insert your ID card to proceed."
	else
		var/datum/job/job = SSjobs.get_by_path(ID.job_access_type)
		if(job)
			uniforms = find_uniforms(ID.military_rank, ID.military_branch, job.department_flag)
		for(var/T in uniforms)
			dat += "<b>[T]</b> <a href='byond://?src=\ref[src];get_all=[T]'>Select All</a>"
			var/list/uniform = uniforms[T]
			for(var/piece in uniform)
				if(piece)
					var/obj/item/clothing/C = piece
					if(piece in selected_outfit)
						dat += "<span class='linkOn'>[sanitize(initial(C.name))]</span><a href='byond://?src=\ref[src];rem=\ref[piece]'>X</a>"
					else if (can_issue(C))
						dat += "<a href='byond://?src=\ref[src];add=\ref[piece]'>[sanitize(initial(C.name))]</a>"
					else
						dat += "[sanitize(initial(C.name))] (ISSUED)"
			dat += "<hr>"
		dat += "<a href='byond://?src=\ref[src];vend=[1]'>Dispense</a>"
	dat = jointext(dat,"<br>")
	var/datum/browser/popup = new(user, "Uniform Dispenser","Uniform Dispenser", 300, 700, src)
	popup.set_content(dat)
	popup.open()

/obj/machinery/uniform_vendor/OnTopic(var/mob/user, href_list)
	if(href_list["ID"])
		if(ID)
			if(!issilicon(user))
				user.put_in_hands(ID)
			else
				ID.dropInto(loc)
			ID = null
			selected_outfit.Cut()
		else
			var/obj/item/card/id/I = user.get_active_hand()
			if(istype(I) && user.unEquip(I, src))
				ID = I
		. = TOPIC_REFRESH
	if(href_list["get_all"])
		if(!(href_list["get_all"] in uniforms))
			return TOPIC_NOACTION
		var/list/addition = uniforms[href_list["get_all"]]
		for(var/G in addition)
			if(can_issue(G))
				selected_outfit |= addition
		. = TOPIC_REFRESH
	if(href_list["add"])
		var/uniform_path = locate(href_list["add"])
		if(ispath(uniform_path))
			selected_outfit |= uniform_path
			. = TOPIC_REFRESH
		else
			. = TOPIC_NOACTION
	if(href_list["rem"])
		selected_outfit -= locate(href_list["rem"])
		. = TOPIC_REFRESH
	if(href_list["vend"])
		flick("uniform-vend", src)
		spawn_uniform(selected_outfit)
		selected_outfit.Cut()
		. = TOPIC_REFRESH
	if(.)
		attack_hand(user)

/obj/machinery/uniform_vendor/attackby(var/obj/item/W, var/mob/user)
	if(istype(W, /obj/item/clothingbag))
		if(W.contents.len)
			to_chat(user, "<span class='notice'>You must empty \the [W] before you can put it in \the [src].</span>")
			return
		to_chat(user, "<span class='notice'>You put \the [W] into \the [src]'s recycling slot.</span>")
		qdel(W)
	else if(istype(W, /obj/item/card/id) && !ID && user.unEquip(W, src))
		to_chat(user, "<span class='notice'>You slide \the [W] into \the [src]!</span>")
		ID = W
		attack_hand(user)
	else
		..()

/*	Outfit structures
	branch
	branch/department
	branch/department/officer
	branch/department/officer/command

	The one exception to the above is the command department, due to the fact that you have to be an officer to
	be in command, and there are no variants as a result. Also no special CO uniform :(
*/
/obj/machinery/uniform_vendor/proc/find_uniforms(var/datum/mil_rank/user_rank, var/datum/mil_branch/user_branch, var/department) //returns 1 if found branch and thus has a base uniform, 2, branch and department, 0 if failed.
	var/decl/hierarchy/mil_uniform/user_outfit = decls_repository.get_decl(/decl/hierarchy/mil_uniform)
	var/mil_uniforms = user_outfit
	for(var/decl/hierarchy/mil_uniform/child in user_outfit.children)
		if(is_type_in_list(user_branch, child.branches))
			user_outfit = child
	if(user_outfit == mil_uniforms) //We haven't found a branch
		return null //Return no uniforms, which will cause the machine to spit out an error.

	// we have found a branch.
	if(department == COM) //Command only has one variant and they have to be an officer
		for(var/decl/hierarchy/mil_uniform/child in user_outfit.children)
			if(child.departments & COM)
				user_outfit = child
				for(var/decl/hierarchy/mil_uniform/seniorchild in user_outfit.children) //Check for variants of command outfits
					if(user_rank.sort_order >= seniorchild.min_rank && user_outfit.min_rank < seniorchild.min_rank)
						user_outfit = seniorchild
	else
		var/tmp_department = department
		tmp_department &= ~COM //Parse departments, with complete disconsideration to the command flag (so we don't flag 2 outfit trees)

		for(var/decl/hierarchy/mil_uniform/child in user_outfit.children) //find base department outfit
			if(child.departments & tmp_department)
				user_outfit = child
				break
		for(var/decl/hierarchy/mil_uniform/child in user_outfit.children) //find highest applicable ranking department outfit
			if(user_rank.sort_order >= child.min_rank && user_outfit.min_rank < child.min_rank)
				user_outfit = child
		if(department & COM) //user is in command of their department
			if(user_outfit.children[1])// Command outfit exists
				user_outfit = user_outfit.children[1]
				for(var/decl/hierarchy/mil_uniform/child in user_outfit.children) //Check for variants of command outfits
					if(user_rank.sort_order >= child.min_rank && user_outfit.min_rank < child.min_rank)
						user_outfit = child

	return populate_uniforms(user_outfit) //Generate uniform lists.

/obj/machinery/uniform_vendor/proc/populate_uniforms(var/decl/hierarchy/mil_uniform/user_outfit)
	var/list/res = list()
	res["PT"] = list(
		user_outfit.pt_under,
		user_outfit.pt_shoes
		)

	res["Utility"] = list(
		user_outfit.utility_under,
		user_outfit.utility_shoes,
		user_outfit.utility_hat
		)
	if (user_outfit.utility_extra)
		res["Utility Extras"] = user_outfit.utility_extra

	res["Service"] = list(
		user_outfit.service_under,
		user_outfit.service_skirt,
		user_outfit.service_over,
		user_outfit.service_shoes,
		user_outfit.service_hat,
		user_outfit.service_gloves
		)
	if(user_outfit.service_extra)
		res["Service Extras"] = user_outfit.service_extra

	res["Dress"] = list(
		user_outfit.dress_under,
		user_outfit.dress_skirt,
		user_outfit.dress_over,
		user_outfit.dress_shoes,
		user_outfit.dress_hat,
		user_outfit.dress_gloves
		)
	if(user_outfit.dress_extra)
		res["Dress Extras"] = user_outfit.dress_extra

	return res

/obj/machinery/uniform_vendor/proc/spawn_uniform(var/list/selected_outfit)
	listclearnulls(selected_outfit)
	if(!issued_items[user_id()])
		issued_items[user_id()] = list()
	var/list/checkedout = issued_items[user_id()]
	if(selected_outfit.len > 1)
		var/obj/item/clothingbag/bag = new /obj/item/clothingbag
		for(var/item in selected_outfit)
			new item(bag)
			checkedout += item
		bag.dropInto(loc)
	else if (selected_outfit.len)
		var/obj/item/clothing/C = selected_outfit[1]
		new C(get_turf(src))
		checkedout += C

/obj/machinery/uniform_vendor/proc/user_id()
	if(!ID)
		return "UNKNOWN"
	else
		return "[ID.registered_name], [ID.military_rank], [ID.military_branch]"

/obj/machinery/uniform_vendor/proc/can_issue(var/gear)
	var/list/issued = issued_items[user_id()]
	if(!issued || !issued.len)
		return TRUE
	return !(gear in issued)
