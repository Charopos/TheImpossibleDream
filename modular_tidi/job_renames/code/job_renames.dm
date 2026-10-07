/* THE GREAT RENAMING.

I'd renamed certain jobs to play better into Surrealis' story. This doesn't touch any of the mechanical lookups and defines for jobs! var/display_title handles it!
This just edits modularly the flavor texts and so forth that directly mention each individual position without my previous sloppy format of direct edits galore.

To start with - the widest workload in the form of the Duke -> Count renaming.
*/

// DUKE JOB RENAMING - Duke/Duchess -> Count/Countess

/datum/job/roguetown/lord
	display_title = "Count"
	f_title = "Countess"

/datum/objective/marry
	name = "marry"
	explanation_text = "Secure a marriage with the local Count/Countess - or alternatively marry one of the noble heirs and ensure they are coronated by the week's end."
	team_explanation_text = "Secure a marriage with the local Count/Countess - or alternatively marry one of the noble heirs and ensure they are coronated by the week's end."

/obj/item/clothing/head/roguetown/crown_hat
	name = "crown hat"
	desc = "Oft worn in place of a crown, this hat is the signature headwear of the Count. Its iconic feather stretches tall above its peers."

/obj/item/rogueweapon/huntingknife/idagger/silver/elvish/poopknife
	name = "thine majesty's nitesoil-cleaver"
	desc = "A heraldric accompaniment to the chamberpot, and the most closely-guarded secret before the Scar. It is said that this once belonged to the Count's eldest ancestor, who - in a fit of constipatory labor - had unwittingly realized another use for their wave-bladed trophy. Clinging to its silvered edge is a thin layer of otherworldly ash, refusing to yield to neither soap-nor-rag."

/datum/objective/aspirant/coup/one
	name = "Aspirant"
	explanation_text = "I must ensure that I am crowned as the Count of Pharos."

/datum/objective/aspirant/coup/two
	name = "Moral"
	explanation_text = "I am no kinslayer, I must make sure that my Count doesn't die."

/datum/objective/aspirant/loyal/one
	name = "Ruler"
	explanation_text = "I can count on the fact that I will remain the Count."

/datum/book_entry/treasury_realm/budgets/inner_book_html(mob/user)
	return {"
		<div>
		<h3>Crown's Purse</h3>
		<p>The Crown's actual mammon balance. Used to pay wages, imports, deposits, and any other expenditure drawn through the Nerve Master (KEEP IT LOCKED!). Replenished by taxes, fines, rural taxes, direct deposit into the Nerve Master, exports, and fulfilling standing orders.</p>

		<h3>Burgher Pledge</h3>
		<p>Not actual coin, but a virtual pool pledged by the Burghers of the realm (off map). It refills daily while the Golden Bull stands, scaling with a flat base and the active player count. Does not refill while the Bull is suspended.</p>

		<h3>Alderman's Warrant</h3>
		<p>An Alderman, elected by the City Assembly, gains a Defense Warrant and a Trade Warrant. Neither is a purse - they are spending ceilings against the Crown's Purse or Burgher Pledge respectively:</p>
		<ul>
			<li><b>Trade Warrant</b> - a daily mammon ceiling against the Crown's Purse. The Alderman may import and export up to this amount each day; the monetary value of both imports and exports counts against the Warrant. Coin flows to and from the Purse itself.</li>
			<li><b>Defense Warrant</b> - a daily Pledge ceiling. Defense commissions issued by the Alderman burn Pledge authority up to this cap, just as the Steward's do. The Alderman may not draw the Crown's Purse for defense, and may not issue Requests.</li>
		</ul>
		<p>Both ceilings refresh at each session's resolution. Unspent authorisation does not carry over.</p>

		<h3>Crown Authority</h3>
		<p>The following titles share full Crown authority - they may petition the trade hall, draw emergency loans, commission defense and blockade writs, and stamp contracts levy-exempt with the signet:</p>
		<ul>
			<li>Steward, Clerk, Count/Countess, Hand, Marshal, Councillor, Heir/Heiress.</li>
		</ul>
		<p>The Steward is the primary officer; the rest substitute when the Steward is absent, dead, or otherwise occupied. A Regent crowned at the Throne inherits the same authority for the duration of their regency.</p>
		</div>
	"}

/datum/decree/indenture_of_war
	flavor_text = {"This Indenture of War, made betwene the Crown of Pharos on the one part, and the armed men of the Realm on the other part, witnesseth that:

The Crown shall paye unto its soldiery their just wages, by the daye, and without lette or delay, according to the ranks herein set forth. The Marshal of the Realm at threescore marks, the Knights at twoscore, a Sergeant at twoscore likewise, a Man at Armes at a score, a Warden at a score, and a Squire at ten. Beneath these sums no wage shall fall whilst this Indenture stands.

In return, the armed men of the Realm shall do their trewe service to the Count, and shall obey the Count's lieutenants and officers in all things lawful and reasonable. And if the saide armed men shall break or contravene this Indenture, they shall be at the Count's wille and mercye. And if the Crown shall break this Indenture - withholding the wages herein pledged, or setting them lower than here set forth - the soldier is released from his oath, and the Crown shall answer for the faith it hath broken.

In witness whereof, the Crown of Pharos hath set his seale to this Indenture, and the said armed men of the Realm have set their seales in like manner.

Yeven under the seal of the Crown."}

/datum/foreign_realm/naledi
		hail_lines = list(
		"Peace upon the Company. Naledi greets the factor, in Psydon's name, with the respect owed between honest houses.",
		"I bring glass from the Dunes, gold from Veranda, the finest coffee and tea in Psydonia. A thirst for iron that no caravan can slake.",
		"Every time we sell you coffee and tea, the finest in Psydonia, one of your stevedores would offer us wines and drinks. Know that us in Naledi do not indulge in such spirits nor bring them to court. We follow that very strictly. Now - do you happen to have some Kazengunese plum wine on hand?",
		"We know in the Pharos you tolerate Tieflings and Goblins amongst your people, yet fight and slay them by the hundreds every dae. Do not bring them near the dock - my crew might suddenly remember their Warscholar heritage.",
		"Do not point at my crew when you address them, factor. To do so is rude - and rudeness is how Djinn slip into a man's manners first, before all else.",
		"Bring me no gifts of gold; we mine more than the daimyos can swallow. Bring exotic spice, ore foreign to my dunes, or do not bring me anything at all.",
		"My weights are true under the gaze of Astrata - whom you call goddess and we call merely one of His aspects. Inspect them. Inspect them again if it pleases you.",
		"I sailed under royal license of the Malikat Amalara herself. The seal you see at my prow is hers. Show it the respect you would show your own Countess.",
		"Two of my passengers travel veiled head to toe. They are Warscholars returning from the Otavan houses. Do not address them. Do not stare. They have killed more than thirty Djinn each, and the habit of vigilance does not lift at a friendly pier.",
		"My hold smells of sand and hibiscus. I will not apologize for either. Pay fair and you may take a cup of the second before I depart.",
		"You will hear no priests of the Pentacle preaching from my deck. If you wish to bring symbols of them aboard, leave them at the gangway - my crew will not pass them, and neither shall I.",
		"My helmsman is Bilamak, sworn to the Crown, returning home after service abroad. His saber is sheathed in gilded silk; do not test him into drawing it. His blade dances faster than your eye, I promise you.",
		"The Arisole sandstorms have closed three southern passes. My route was thirty days longer than last season. The fee should reflect the dunes' temper - not mine.",
		"We are a welcoming people, factor. We will share bread and tea with anyone who asks honestly. But know that we do not share court with those who came here to convert us. Trade openly, drink openly, pray quietly.",
		"A wandering Vizier-scholar rides with me, bound for your Avisa boards to study how foreign justice is recorded. She pays in knowledge, not coin. Direct her kindly when she asks, and she will write your magistrate's name well in her journals.",
		"My grandmother saw the Otavan expedition return from the Dunes with a Pontifex's confession hanging from their saddles. She lived to a hundred and seven and never trusted a priest of the Temple again. I follow her in this.",
		"A Vizier-scholar of the Olindar houses rides with me, returning from her tutoring at the Otavan abbeys. For one zenny she will read a passage of the Treatise of Endurance and explain it for as long as you will listen. She has lectured for nine hours without rest at the Hierophant houses. Pay her and you will know why the Warscholars endure where lesser men kneel.",
		"The Dunes are beautiful two months past now. It is beautiful, and our architecture are most impressive. I would invite you on a trip, and then make a hefty profit by selling you the services of Warscholars to escort you from the Djinn of the sand. What say you, Factor? Do you want to see the Dunes with your own eyes?",
		"Olindar is holding another conclave of the Warscholars. And us Naledi knows to partake moderately in joys and pleasures of the world, as is right under the gaze of Psydon. So, give me the finest of your wines, the most succulent of your shrimps, lobsters and crabs from the sea, and a platter of your best cheeses. Spices? Do not bother, ours are the best in the world, I have some in the hold for you.",
		"My ship's surgeon ran out of aqua vitae at the second crossing of the dunes - the Warscholars cauterise their wounds with it, and the desert is not generous with wounds. If your distillers have bottles to spare, the Malikat's healers will repay you in iron-clean stitches and quiet recoveries. We do not drink it. We pour it on what should not have opened.",
	)

// PRIEST JOB RENAME - Priest -> Pontifex

/datum/job/roguetown/priest
	display_title = "Pontifex"

/obj/structure/roguemachine/vaultbank/church/get_authority_label()
	return "the Pontifex or Martyr"

/datum/advclass/herald
	name = "Herald of the Abyss"
	tutorial = "One of Abyssor's acolytes dedicated to the path of the dream painter. You are amongst the most studious of the cult, capable of casting the most powerful miracles. Detail your visions, bring great tidings... Perfom the grunt work to prepare the greatest rituals."

/datum/advclass/voice
	name = "Voice of the Seas"
	tutorial = "One of Abyssor's visionaries dedicated to the path of the dream painter. You are amongst the exhalted of the cult, leading this little branch of abyssorite misfits. Keep in mind your authority does not reach past the cult - and many would fear you for your draw towards the Dreamer. Perhaps you can recruit some of the loyal abyssorites around here."

/datum/advclass/templar/maris
	name = "Maris"
	tutorial = "One of Abyssor's sentinels dedicated to the path of the dream painter. You are amongst the protectors of the cult, keeping your fellow cultists safe from dreamfiends."

/datum/book_entry/treasury_general/patronage/inner_book_html(mob/user)
	return {"
		<div>
		<p>Patronages let certain roles extend their Charter's protection to other individuals.</p>
		<ul>
			<li><b>Pontifex</b> - The Pontifex may declare up to [PATRONAGE_CAP_BENEFACTOR] persons as benefactors of the Temple, granting them the same tax and levy exemption as the Temple while the Concordat is in force. The Pontifex may revoke at will.</li>
			<li><b>Steward</b> - The Steward may print Letters of Citizenry at the Nerve Master. The bearer gains Golden Bull protections while the Charter is in force. One can be printed every minute.</li>
		</ul>

		<p>Protection lapses if the backing Charter is suspended, but the status persists and resumes if the Charter is restored.</p>

		<h3>Faction Patronage Writs</h3>
		<p>Three factions print their own patronage writs at their MEISTER's institutional panel. Each writ is a one use item: hand it to someone for them to claim it by using it in hand. Roster slots are limited per faction and prune when an enrolled member dies or is gone.</p>
		<ul>
			<li><b>Writ of Charter</b> (Merchant, up to [PATRON_CAP_MERCHANT]) - the bearer becomes an Agent of the Pharovian Trading Company. They are recognized as a Burgher for tax purposes (Golden Bull cap) and will recognize the Company's debtors. Also confers Residency, so they are treated as a towner for round purposes including the towner contract gate.</li>
			<li><b>Token of the Bathhouse</b> (Bathmaster, up to [PATRON_CAP_BATHHOUSE]) - the bearer becomes an Agent of the Bathhouse. They may pass through the secret tunnel and the northeastern coast smugglers will offer them better prices on Black Market sales. They may also will recognize Bathhouse's debtors. Use discretion when granting to outlaws or wretches - the mark of the Bathhouse is visible, and being seen with it on a fugitive may invite the Temple's or Crown reprisal against the Bathmaster.</li>
			<li><b>Letter of Benefaction</b> (Pontifex / Martyr, up to [PATRON_CAP_CHURCH]) - the bearer becomes a Benefactor of the Temple and inherits the Concordat's tax exemption (no direct taxation while the Concordat stands). They may also see the Temple's debtors. This can be one of the Temple's main channels to gain lay allies for certain matters - such as preparation for conflicts.</li>
		</ul>
		</div>
	"}

/datum/book_entry/treasury_general/tax_evasion/inner_book_html(mob/user)
	return {"
		<div>
		<p>Both legal and illegal ways to dodge taxes exist.</p>

		<p><b>Legal Evasion</b>: Subjects without a bank account are inherently immune to poll taxes. Avoiding Contract Levy requires membership in a tax-exempt class - nobles, clergy, or holders of Temple Benefactor status (granted by the Pontifex). Note that the clergy itself is not expected to adventure without IC reason, so Benefactor status is the practical channel. Tax immunity does not apply to indirect taxes like import tariffs or export duties.</p>

		<p><b>Illegal Evasion</b>: The Merchant can stop paying taxes by toggling the navigator's tax setting and refusing to pay on Goldface sales. The risk of being caught and penalised by the Crown falls on the Merchant. The machines tally dodged amounts, but only the Shophand and the Merchant themselves can view the exact tally - the Crown can only guess and accuse, with or without proof.</p>
		</div>
	"}

/datum/book_entry/treasury_general/assembly/inner_book_html(mob/user)
	return {"
		<div>
		<p>Town members (excluding the keep and garrison) can elect an Alderman to replace or augment the Steward's authority.</p>

		<h3>Sessions</h3>
		<p>The first session opens [ASSEMBLY_FIRST_SESSION_MINUTES] minutes after the round begins; thereafter sessions resolve each dawn. Votes are cast at the Assembly noticeboard and may be changed freely until the session resolves.</p>

		<h3>Who Sits, Who Votes</h3>
		<p>All jobs but members of the Keep, the Inquisition, and the unjobbed may vote. Outlaws cannot vote. Voting weight is set by station:</p>
		<ul>
			<li><b>Transients</b> (Adventurer, Mercenary) - weight 1.</li>
			<li><b>Peasantry and sidefolk</b> - weight 1.5.</li>
			<li><b>Burghers and clergy</b> - weight 2.</li>
			<li><b>Notables</b> (Merchant, Guildmasters, Pontifex, and the like) - weight 4.</li>
		</ul>
		<p>A Letter of Citizenry or Residency raises sub-Burgher weights to 2.</p>

		<h3>Motions</h3>
		<p>Six motions stand before every session. All are optional; a silent voter is not counted toward that motion's weight.</p>
		<ul>
			<li><b>Election</b> - any subject who can hold office may stand. The highest-weighted eligible candidate takes the seat.</li>
			<li><b>Trade Authority</b> - a bracket vote setting the Alderman's daily trade warrant. Brackets: [jointext(ASSEMBLY_TRADE_BRACKETS, "m, ")]m.</li>
			<li><b>Defense Authority</b> - a bracket vote setting the Alderman's daily defense warrant, denominated in Pledge. Brackets: [jointext(ASSEMBLY_DEFENSE_BRACKETS, "p, ")]p.</li>
			<li><b>Recall</b> - removes a sitting Alderman. Passes on [ASSEMBLY_RECALL_THRESHOLD_PCT]% YAE of cast weight.</li>
			<li><b>Censure</b> - bars a subject from holding office or wielding warrants for the rest of the round. Passes on [ASSEMBLY_CENSURE_THRESHOLD_PCT]% YAE of cast weight.</li>
			<li><b>Poll Tax</b> - suspended pending reform.</li>
		</ul>
		<p>Recall and censure require at least [ASSEMBLY_REMOVAL_MOB_FLOOR] distinct YAE voters casting a combined [ASSEMBLY_REMOVAL_WEIGHT_FLOOR / 2] weight. Bracket motions are vetoed if NAE reaches [ASSEMBLY_NAE_VETO_PCT]% of cast weight - the authorization falls to zero for that session.</p>

		<h3>Quorum</h3>
		<p>A session is valid only if at least [ASSEMBLY_QUORUM_VOTERS] distinct voters have cast a ballot across any of its motions. Below that, the session dissolves and all caps and officers hold as they were.</p>

		<h3>The Alderman</h3>
		<p>The Alderman holds two daily authorisation ceilings:</p>
		<ul>
			<li><b>Trade</b> - imports and exports spend the Crown's Purse, capped each day by the trade warrant. The Alderman accesses the Trade Scroll through the Assembly noticeboard's <i>Alderman - Trade</i> button without standing at the Nerve Master.</li>
			<li><b>Defense</b> - commissions and blockade writs use the Burgher Pledge at the Grand Contract Ledger, capped each day by the defense warrant. The Alderman may not draw the Crown's Purse for defense, and may not issue Requests.</li>
		</ul>
		<p>Both ceilings refresh at each session's resolution. Unspent authorisation does not carry over.</p>

		<h3>Censure</h3>
		<p>A censured subject cannot stand for Alderman, cannot wield a warrant they hold, and cannot be granted one. The mark lasts the round.</p>
		</div>
	"}

/obj/item/rogueweapon/huntingknife/idagger/steel/profane/get_mechanics_examine(mob/user)
	. = ..()
	. += span_info("This is a dagger used by the ASSASSIN antagonist. Targets who have the \"TARGETED\" vice can be soul-trapped \
	within it by use of it's PECULATE intent. If you are an assassin, slay your target, or wait until they have produced a \"BLED OUT\" \
	message in order to sap them with it.")
	. += span_info("PECULATE steals the face of any valid being, TARGETED or not. It is still a little buggy. It will not work on NPCs, revenants, \
	or oozelings. Their souls will still be trapped if they are valid, however.")
	. += span_info("BREAKING the dagger requires the assassin to be slain.")
	// keep this updated w/ absolver if that also gets added
	. += span_info("This dagger can be broken through a Necran Rite, a Pontifex's blessing, or an Absolver's Golgatha blessing.")
	. += span_info("Breaking the dagger will restore the souls, allowing any ghosts who are still present in-round to be returned to their \
	bodies and revived.")
	. += span_redinfo("If you are an assassin, you can break any dagger you own by MMB'ing it. Please consider using this is if you are about to ERP \
	or similar. Thank you.")

/obj/structure/fluff/psycross/get_mechanics_examine(mob/user)
	. = ..()
	var/mob/living/living_user = user
	if(user.mind.assigned_role == "Bishop")
		. += span_info("As the Pontifex, you can marry two people by having them both bite an apple, then offering it to the cross.")
	else if(istype(living_user) && HAS_TRAIT(living_user, TRAIT_MARRIAGE_CAPABLE))
		. += span_info("As an Eoran, you can marry two people by having them both bite an apple, then offering it to the cross.")

/obj/item/rogueweapon/woodstaff/aries // more humble with no aura
	name = "staff of the shepherd"
	desc = "A finely wrought crozier crowned with the likeness of a shepherd watching over his flock. Its curved head serves as a reminder that a true shepherd does not rule through fear, but through guidance, mercy, and unwavering vigilance. To the faithful it is a symbol of humble service; to the lost, a promise that even the stray may yet find their way home."

/obj/item/rogueweapon/huntingknife/idagger/steel/holysee
	name = "eclipsum dagger"
	desc = "A sliver of heaven, shaped into an elegant dagger. The alloy radiates with magnificence: a reminder that no matter how dark the nites grow, there will always be a dawn to follow. Such a dagger is reserved for the Pentacle's pontifexus - both as a symbol of their divine authority, and as a means of ritualistic bloodletting. </br>'..come forth, child o' myne, and be anointed in the Pantheon's light once more..'"

/datum/usurpation_rite/sacred_supercession
	explanation = {"<p>A member of the Temple of the Pentacle may claim the throne through divine mandate.</p>\
<p><b>Who may invoke:</b> Any member of the Temple who follows one of the divine patrons.</p>\
<p><b>How it works:</b> Members of the Temple of Pharos, or those who have reached the First Tier of Divine devotion, must gather near the throne and speak the words 'I assent' to support your claim. Only followers of the Pantheon may participate.</p>\
<p><b>Completion condition:</b> <b>5</b> weighted voices must speak their assent. Foreign or wandering clergy count as only half a voice. Once the threshold is reached, the realm is alerted and a contestation period begins — survive it and stay conscious while remaining near the throne, and it is yours.</p>\
<p><b>Restrictions:</b> Only followers of the Pantheon may invoke or assent. Outlaws and the undead are shunned.</p>\
<p><b>Realm type if successful:</b> Prince-Pontifexus, ruled by a Prince-Pontifexus.</p>"}
	new_ruler_title = "Prince-Pontifexus"
	new_ruler_title_f = "Princess-Pontifexus"
	new_realm_type = "Pentacle-Protectorate"
	new_realm_type_short = "Pentacle-Protectorate"


// PRINCE JOB RENAME - Prince/Princess -> Heir/Heiress

/datum/job/roguetown/prince
	display_title = "Heir"
	f_title = "Heiress"

/datum/special_trait/punkprincess
	name = "Rebellous Daughter"
	greet_text = span_notice("I am quite rebellious for an heiress. Screw Noble Customs!")
	req_text = "Be an heiress"
	allowed_sexes = list(FEMALE)
	allowed_jobs = list(/datum/job/roguetown/prince)
	weight = 50

/datum/usurpation_rite/solar_succession
	name = "Rite of Solar Succession"
	desc = "When the throne falters, it is the right, no, the duty of the noble to step in and restore order."
	explanation = {"<p>A noble may claim the throne through the assent of their peers. An ancient tradition upheld by the order ordained by Astrata.</p>\
<p><b>Who may invoke:</b> Any noble.</p>\
<p><b>How it works:</b> Nobles of the realm must then gather near the throne and speak the words 'I assent' to support your claim.</p>\
<p><b>Completion condition:</b> Members of the noble family (Consort, Heir), Insiders (Hand, Steward, Councillor) and those with Heartfelt ties need only <b>3</b> noble voices — a palace coup. All other nobles require a quorum of <b>5</b> voices. Resident nobles of Pharos count as a full voice; foreign (wanderer) nobles count as only half. Once the threshold is reached, the realm is alerted and a contestation period begins — survive it and stay conscious while remaining near the throne, and it is yours.</p>\
<p><b>Restrictions:</b> Outlaws and those touched by the stench of undead may not invoke or assent.</p>\
<p><b>Realm type if successful:</b> County, ruled by a Count / Countess.</p>"}

// MISC JOB RENAMES - Sexton, Shophand, Orthodoxist -> Practicus

/datum/job/roguetown/sexton
	display_title = "Initiate"

/datum/job/roguetown/shophand
	display_title = "Docker"

/datum/job/roguetown/orthodoxist
	display_title = "Practicus"
