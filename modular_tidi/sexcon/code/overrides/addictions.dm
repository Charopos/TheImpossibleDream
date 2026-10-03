/datum/charflaw/addiction/var/stress_event = /datum/stressevent/vice

/datum/charflaw/addiction/alcoholic
	stress_event = /datum/stressevent/vice/alcoholic

/datum/charflaw/addiction/junkie
	stress_event = /datum/stressevent/vice/junkie

/datum/charflaw/addiction/smoker
	stress_event = /datum/stressevent/vice/smoker

/datum/charflaw/addiction/caffiend
	stress_event = /datum/stressevent/vice/caffiend

/datum/charflaw/addiction/godfearing
	stress_event = /datum/stressevent/vice/godfearing

/datum/charflaw/addiction/sadist
	stress_event = /datum/stressevent/vice/sadist

/datum/charflaw/addiction/masochist
	stress_event = /datum/stressevent/vice/masochist

/datum/charflaw/addiction/lovefiend
	stress_event = /datum/stressevent/vice/nympho

/datum/charflaw/addiction/thrillseeker
	stress_event = /datum/stressevent/vice/thrillseeker

/datum/charflaw/addiction/clamorous
	stress_event = /datum/stressevent/vice/clamorous

/datum/charflaw/addiction/paranoid
	stress_event = /datum/stressevent/vice/paranoid

/datum/charflaw/addiction/voyeur
	stress_event = /datum/stressevent/vice/voyeur

/// For sex freaks. Manually raising their arousal prevents their vices from being sated. Try jerking off.
/datum/status_effect/debuff/false_sensation
	id = "false_sensation"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/false_sensation
	effectedstats = null
	duration = 2 MINUTES
	status_type = STATUS_EFFECT_REFRESH

/atom/movable/screen/alert/status_effect/debuff/false_sensation
	name = "False Sensation"
	desc = "My body is aflame, but it's not real. Only a real touch of passion will sate my urges."
	icon_state = "debuff"

/datum/charflaw/addiction/baothamarked
	name = "Baothan Marked"
	desc = "I've been branded by a Baothan mark."
	time = 45 MINUTES
	needsate_text = "My brand burns painfully."
	stress_event = /datum/stressevent/vice/baothamarked
	sated_text = "The brand's glow lessens, relief washing over me..."
	debuff = /datum/status_effect/debuff/addiction/baothamarked

/datum/status_effect/debuff/addiction/baothamarked
	id = "addiction_baothamark"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/addiction/baothamarked
	effectedstats = list(STATKEY_CON = -1, STATKEY_WIL = -1)

/atom/movable/screen/alert/status_effect/debuff/addiction/baothamarked
	name = "Baothan Mania"
	desc = "That accursed rune. It burns brightly across my flesh, searing my loins with a painful desire for release."
	icon_state = "nymphomaniac"

#define THRILLSEEKER_THRESHOLD 85

/datum/sex_controller/proc/adjust_arousal_thrill(amount)
	if(!user.has_flaw(/datum/charflaw/addiction/thrillseeker))
		return
	if(arousal_frozen)
		return
	if(last_ejaculation_time > world.time - (3 MINUTES))
		return
	if(arousal >= THRILLSEEKER_THRESHOLD)
		return
	set_arousal(min(arousal + amount, THRILLSEEKER_THRESHOLD))

/datum/sex_controller/proc/thrill_climax()
	if(!user.has_flaw(/datum/charflaw/addiction/thrillseeker))
		return
	user.sate_addiction(/datum/charflaw/addiction/thrillseeker)
	user.add_stress(/datum/stressevent/thrill)
	last_ejaculation_time = world.time
	if(prob(1))
		user.emote("groan", forced = TRUE)

#undef THRILLSEEKER_THRESHOLD
