/mob/living/proc/resist_leash()
	return

/mob/living/electrocute_act(shock_damage, source, siemens_coeff = 1, flags = NONE)
	. = ..()
	if(!ishuman(src))
		return
	if(!. && (!(flags & SHOCK_VISUAL_ONLY) || HAS_TRAIT(src, TRAIT_SHOCKIMMUNE) || ((flags & SHOCK_TESLA) && (flags_1 & TESLA_IGNORE_1))))
		return
	// Home Alone 2 Marv scream on a 5% dice roll
	if(prob(5))
		playsound(get_turf(src), 'modular_tidi/sexcon/sounds/masomoans/agony/electroscreammarv.ogg', 80, FALSE, 2)
