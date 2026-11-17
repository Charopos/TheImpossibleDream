/proc/roll_spell_damage_variance(damage, variance_range, int_stat, skill_level)
	if(!variance_range)
		return damage
	var/variance_center = clamp((int_stat - 10) * 0.0125 + skill_level * 0.025, -1, 1)
	var/variance_roll = 0
	for(var/i in 1 to 3)
		variance_roll += rand(-variance_range, variance_range)
	variance_roll = clamp(variance_roll / 3 + variance_center * variance_range, -variance_range, variance_range)
	return round(damage * (1 + variance_roll / 100), 1)

/proc/caster_varied_spell_damage(damage, variance_range, mob/living/caster, skill_type = /datum/skill/magic/arcane)
	if(!variance_range || !ishuman(caster))
		return damage
	return roll_spell_damage_variance(damage, variance_range, caster.STAINT, caster.get_skill_level(skill_type))

/datum/action/cooldown/spell/proc/get_varied_damage(damage, mob/living/caster, variance_range = damage_variance)
	return caster_varied_spell_damage(damage, variance_range, caster, associated_skill)
