/obj/item/bodypart/proc/should_dismember(bclass, damage_dealt, mob/living/user, zone_precise, armor_block = 0, raw_damage = 0, obj/item/weapon)
	return prob(get_dismember_probability(bclass, damage_dealt, user, zone_precise, armor_block, raw_damage, weapon))

/obj/item/bodypart/proc/get_dismember_probability(bclass, damage_dealt, mob/living/user, zone_precise, armor_block = 0, raw_damage = 0, obj/item/weapon)
	if(!owner || !dismemberable || (owner.status_flags & GODMODE) || HAS_TRAIT(owner, TRAIT_NODISMEMBER))
		return 0
	var/total_dam = get_damage()
	var/hard_dismember = HAS_TRAIT(src, TRAIT_HARDDISMEMBER) || HAS_TRAIT(owner, TRAIT_HARDDISMEMBER)
	var/easy_dismember = rotted || skeletonized || HAS_TRAIT(src, TRAIT_EASYDISMEMBER) || HAS_TRAIT(owner, TRAIT_EASYDISMEMBER)
	var/is_sharp = (bclass in GLOB.dismember_bclasses)
	var/is_blunt = (bclass in GLOB.fracture_bclasses)
	var/probability = 0

	if(is_sharp || is_blunt)
		var/nuforce = damage_dealt
		if(is_sharp && istype(weapon, /obj/item/rogueweapon))
			var/obj/item/rogueweapon/blade = weapon
			if(bclass == BCLASS_CHOP)
				nuforce *= 1.1
			else if(blade.max_blade_int && blade.dismember_blade_int)
				if(blade.blade_int / blade.dismember_blade_int <= 0.15)
					return 0
				if(blade.blade_int < blade.dismember_blade_int * 0.95 && total_dam < max_damage * 0.8)
					return 0
		if(user)
			if(istype(user.rmb_intent, /datum/rmb_intent/weak))
				return 0
			if(istype(user.rmb_intent, /datum/rmb_intent/strong))
				nuforce *= 1.1
		if(nuforce < 10)
			return 0
		if(is_sharp)
			probability = nuforce * (total_dam / max_damage)
		else
			if(brute_dam < max_damage)
				return 0
			if(damage_dealt < max_damage * 0.25)
				return 0
			probability = (damage_dealt / max_damage) * 30
		var/multiplied = FALSE
		if(is_blunt)
			multiplied = HAS_TRAIT(src, TRAIT_BRITTLE) || HAS_TRAIT(owner, TRAIT_BRITTLE)
		else
			multiplied = HAS_TRAIT(owner, TRAIT_EASYDECAPITATION) && zone_precise == BODY_ZONE_PRECISE_NECK
		if(hard_dismember)
			probability *= 0.25
		else if(easy_dismember)
			multiplied = TRUE
		if(multiplied)
			probability *= 1.5
	else if(bclass in GLOB.charring_bclasses)
		if(damage_dealt < max_damage * 0.4)
			return 0
		if(burn_dam < max_damage)
			return 0
		probability = (damage_dealt / max_damage) * 15
		if(hard_dismember)
			probability *= 0.25
		else if(easy_dismember)
			probability *= 1.5

	if(armor_block > 0 && raw_damage > 0)
		if(damage_dealt < armor_block)
			return 0
		probability *= (1 - (armor_block / raw_damage)) ** 2
	return probability

/mob/living/proc/spawn_limbgore()
	new /obj/effect/gibspawner/part(drop_location(), src)

/obj/effect/gibspawner/part
	gibtypes = list(/obj/effect/decal/cleanable/blood/gibs, /obj/effect/decal/cleanable/blood/gibs/core, /obj/effect/decal/cleanable/blood/gibs, /obj/effect/decal/cleanable/blood/gibs/core, /obj/effect/decal/cleanable/blood/gibs)
	gibamounts = list(1, 1, 1, 1, 1)
	gibdirections = list(list(), list(), list(), list(), list())
	sound_vol = 20
