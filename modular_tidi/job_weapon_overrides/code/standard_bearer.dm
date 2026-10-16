/datum/outfit/job/roguetown/manorguard/standard_bearer/pre_equip(mob/living/carbon/human/H)
	. = ..()
	backl = null//doesn't need a strap so we get our buff as long as the standard is on our person.
	if(!H.mind)
		return
	var/list/standard_options = list(
		"Pike" = /obj/item/rogueweapon/spear/keep_standard,
		"Poleaxe" = /obj/item/rogueweapon/spear/keep_standard/poleaxe,
	)
	var/standard_choice = input(H, "Choose your standard.", "TAKE UP ARMS") as anything in standard_options
	r_hand = standard_options[standard_choice]
