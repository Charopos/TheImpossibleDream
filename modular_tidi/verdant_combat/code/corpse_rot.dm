/datum/component/rot/corpse
	var/flesh_rotting = FALSE
	var/necrotic = FALSE
	var/all_bone = FALSE
	var/bone_since = 0
	var/infect_after = 0

/// Runs every flesh limb's infection clock while dead, infecting clean limbs first. Returns TRUE if any limb changed.
/datum/component/rot/corpse/proc/rot_flesh(mob/living/carbon/corpse, advance = TRUE)
	. = FALSE
	flesh_rotting = FALSE
	necrotic = FALSE
	var/any_flesh = FALSE
	var/any_bone = FALSE
	var/ticking = advance && !has_world_trait(/datum/world_trait/pestra_mercy)
	if(!infect_after)
		infect_after = rand(INFECTION_FESTER_MIN_TIME, INFECTION_FESTER_MAX_TIME) * corpse.infection_con_modifier()
	for(var/obj/item/bodypart/part as anything in corpse.bodyparts)
		var/datum/wound/infection/infection = part.has_wound(/datum/wound/infection)
		if(ticking && !infection && !part.skeletonized && amount * corpse.zombie_rot_speed(0) > infect_after)
			infection = part.add_wound(/datum/wound/infection, silent = TRUE)
			if(infection)
				. = TRUE
		if(ticking && corpse.stat == DEAD && infection?.tick_clock(CORPSE_ROT_CLOCK_GAP))
			. = TRUE
		if(part.skeletonized)
			any_bone = TRUE
			continue
		if(!part.is_organic_limb())
			continue
		any_flesh = TRUE
		if(infection?.infection_stage >= INFECTION_STAGE_FESTERING)
			flesh_rotting = TRUE
		if(infection?.infection_stage >= INFECTION_STAGE_NECROTIC)
			necrotic = TRUE
	all_bone = any_bone && !any_flesh
	if(!all_bone)
		bone_since = 0
	else if(!bone_since)
		bone_since = world.time

/mob/living/proc/zombie_rot_speed(stage)
	if(HAS_TRAIT(src, TRAIT_DNR) || !mind?.has_antag_datum(/datum/antagonist/zombie))
		return 1
	switch(stage)
		if(INFECTION_STAGE_FESTERING)
			return ZOMBIE_FESTERING_ROT_SPEED
		if(INFECTION_STAGE_NECROTIC, INFECTION_STAGE_SKELETAL)
			return 1
	return ZOMBIE_EARLY_ROT_SPEED

/// Whether the corpse has been bare bone long enough to crumble.
/datum/component/rot/corpse/proc/ready_to_dust()
	return all_bone && bone_since && world.time - bone_since >= CORPSE_DUST_DELAY

/// Rots the body to at least the given infection stage, as when a corpse rises already decayed.
/mob/living/carbon/proc/rot_flesh_to(stage)
	for(var/obj/item/bodypart/part as anything in bodyparts)
		var/datum/wound/infection/infection = part.has_wound(/datum/wound/infection)
		if(!infection && !part.skeletonized)
			infection = part.add_wound(/datum/wound/infection, silent = TRUE)
		infection?.advance_to(stage)

/// Clears rot from the limb: its infection, and the rotted and skeletal flags.
/obj/item/bodypart/proc/cure_rot()
	var/datum/wound/infection/infection = has_wound(/datum/wound/infection)
	if(infection)
		qdel(infection)
	rotted = FALSE
	skeletonized = FALSE
