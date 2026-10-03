// Vice-specific stress events for multiple vices support
/datum/stressevent/vice/nympho
	desc = list(span_boldred("I'm feeling randy..."),span_boldred("I need to sate my desires."))

/datum/stressevent/vice/baothamarked
	desc = list(span_boldred("My brand burns painfully..."),span_boldred("I need to sate this brand's yearning soon."))

/datum/stressevent/vice/sadist
	desc = list(span_boldred("I need to hear someone whimper."),span_boldred("I crave the suffering of others."))

/datum/stressevent/vice/masochist
	desc = list(span_boldred("I need someone to HURT me."),span_boldred("I crave the sensation of pain."))

/datum/stressevent/vice/greedy
	desc = list(span_boldred("I need more mammons..."),span_boldred("What I have is not enough!"))

/datum/stressevent/vice/alcoholic
	desc = list(span_boldred("Time for a drink."),span_boldred("I need some alcohol."))

/datum/stressevent/vice/junkie
	desc = list(span_boldred("Time to get really high."),span_boldred("I need a REAL high."))

/datum/stressevent/vice/smoker
	desc = list(span_boldred("Time for a flavorful smoke."),span_boldred("I need to smoke something."))

/datum/stressevent/vice/godfearing
	desc = list(span_boldred("Time to pray to my Patron."),span_boldred("I need to visit my Patron's realm."))

/datum/stressevent/vice/caffiend
	desc = list(span_boldred("I need a hot brew."),span_boldred("I can't think straight without my cup."))

/datum/stressevent/vice/thrillseeker
	desc = list(span_boldred("I need a FIGHT!"),span_boldred("My blood's gone cold without a scrap."))

/datum/stressevent/vice/clamorous
	desc = list(span_boldred("It's too quiet."),span_boldred("I need the noise of a crowd."))

/datum/stressevent/vice/paranoid
	desc = list(span_boldred("Am I the only one of my kind left?"),span_boldred("I need to be among my own."))

/datum/stressevent/vice/voyeur
	desc = list(span_boldred("I must please someone."),span_boldred("I need to see someone happy."))

/datum/stressevent/chastity_frustration
	timer = INFINITY
	stressadd = 1
	desc = span_red("This restraint is maddening.")

/datum/stressevent/chastity_flat_cramped
	timer = INFINITY
	stressadd = 1
	desc = span_red("This cage is too cramped for me.")

/datum/stressevent/unseemly_made_love
	stressadd = 3
	desc = span_red("That ugly fiend... Touched me!")
	timer = 30 MINUTES

/datum/stressevent/unseemly_made_love/beautiful
	desc = span_red("That ugly thing... RUINED me!")
	timer = 45 MINUTES
