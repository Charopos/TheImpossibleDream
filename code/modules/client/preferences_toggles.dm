//this works as is to create a single checked item, but has no back end code for toggleing the check yet
#define TOGGLE_CHECKBOX(PARENT, CHILD) PARENT/CHILD/abstract = TRUE;PARENT/CHILD/checkbox = CHECKBOX_TOGGLE;PARENT/CHILD/verb/CHILD

//Example usage TOGGLE_CHECKBOX(datum/verbs/menu/Settings/Ghost/chatterbox, toggle_ghost_ears)()
#ifdef TESTING
//override because we don't want to save preferences twice.
/datum/verbs/menu/Settings/Set_checked(client/C, verbpath)
	if (checkbox == CHECKBOX_GROUP)
		C.prefs.menuoptions[type] = verbpath
	else if (checkbox == CHECKBOX_TOGGLE)
		var/checked = Get_checked(C)
		C.prefs.menuoptions[type] = !checked
		winset(C, "[verbpath]", "is-checked = [!checked]")
#endif

/client/verb/setup_character()
	set name = "Game Preferences"
	set category = "Preferences.Options"
	set desc = ""
	if(prefs)
		prefs.ShowChoices(usr, PREFERENCE_TAB_GAME_SETTINGS)

/client/verb/toggle_fullscreen()
	set name = "Toggle Fullscreen"
	set category = "Preferences.Options"
	set desc = ""
	if(prefs)
		prefs.toggles ^= TOGGLE_FULLSCREEN
		prefs.save_preferences()
		toggle_fullscreeny(prefs.toggles & TOGGLE_FULLSCREEN)

/client/verb/toggle_screenshake()
	set category = "Preferences.Options"
	set name = "Toggle Screen Shake"
	if(prefs)
		prefs.shake = !prefs.shake
		prefs.save_preferences()
		if(prefs.shake)
			to_chat(src, "Screen shake enabled.")
		else
			to_chat(src, "Screen shake disabled.")

/client/verb/toggle_action_buttons()
	set category = "Preferences.Options"
	set name = "Toggle Action Buttons"
	set desc = "Show or hide the action button bar."
	if(mob)
		mob.toggle_action_buttons()

/client/verb/masked_examine()
	set category = "Preferences.Options"
	set name = "Toggle Masked Examine"
	if(prefs)
		prefs.masked_examine = !prefs.masked_examine
		prefs.save_preferences()
		if(prefs.masked_examine)
			to_chat(src, "Your character information will be viewable when masked.")
		else
			to_chat(src, "Your character information will no longer be viewable when masked.")

/client/verb/toggle_instruments()
	set category = "Preferences.Options"
	set name = "Toggle Instrument Sounds"
	if(prefs)
		prefs.toggles ^= SOUND_INSTRUMENTS
		prefs.save_preferences()
	to_chat(src, "You will[(prefs.toggles & SOUND_INSTRUMENTS) ? "" : " no longer"] hear instrument-played songs.")

/client/verb/toggle_midis()
	set category = "Preferences.Options"
	set name = "Toggle Admin Midis"
	if(prefs)
		prefs.toggles ^= SOUND_MIDI
		prefs.save_preferences()
	to_chat(src, "You will[prefs.toggles & SOUND_MIDI ? "" : " no longer"] hear admin-played sounds.")

/client/verb/mute_animal_emotes()
	set category = "Preferences.Options"
	set name = "Toggle Animal Noise Emotes"
	if(prefs)
		prefs.mute_animal_emotes = !prefs.mute_animal_emotes
		prefs.save_preferences()
		if(prefs.mute_animal_emotes)
			to_chat(src, "You can no longer hear animal sound emotes.")
		else
			to_chat(src, "You will now hear animal sound emotes.")

/client/verb/autoconsume()
	set category = "Preferences.Options"
	set name = "Toggle AutoConsume"
	if(prefs)
		prefs.autoconsume = !prefs.autoconsume
		prefs.save_preferences()
		if(prefs.autoconsume)
			to_chat(src, "You will now try to repeatedly consume/feed food/drinks")
		else
			to_chat(src, "You will no longer try to repeatedly consume/feed food/drinks")

/client/verb/toggle_ERP() // Alters if other people can use the ERP panel ON you.
	set category = "Preferences.Sensual"
	set name = "Toggle ERP Panel"
	if(prefs)
		prefs.sexable = !prefs.sexable
		prefs.save_preferences()
		if(prefs.sexable)
			to_chat(src, "Others can play with you.")
		else
			to_chat(src, "Others can't touch you.")

/client/verb/toggle_ERP_visuals()
	set category = "Preferences.Sensual"
	set name = "Toggle ERP Visual Effects"
	if(prefs)
		prefs.erp_visuals = !prefs.erp_visuals
		prefs.save_preferences()
		if(prefs.erp_visuals)
			to_chat(src, "ERP visual effects enabled.")
		else
			to_chat(src, "ERP visual effects disabled.")
			var/mob/living/carbon/human/H = mob
			if(istype(H) && H.sexcon)
				H.sexcon.update_pink_screen()

/client/verb/toggle_Chastity() // Alters whether the user can see or interact with any content related to chastity devices, including the devices themselves, actions that target them, and messages related to them. This is intended for users who want to avoid accidentally encountering this content, but still want to be able to use the game without missing out on unrelated features.
	set category = "Preferences.Sensual"
	set name = "Toggle Chastity Content"
	if(prefs)
		prefs.chastenable = !prefs.chastenable
		prefs.save_preferences()
		if(prefs.chastenable)
			to_chat(src, "Chastity content enabled.")
		else
			if(hascall(src, "modular_handle_chastity_toggle_disable"))
				call(src, "modular_handle_chastity_toggle_disable")()
			to_chat(src, "Chastity content disabled.")

/client/verb/toggle_Chastity_Hardmode()
	set category = "Preferences.Sensual"
	set name = "Toggle Permanent Binding"
	
	if(!prefs)
		return
	
	// Enabling hard mode requires confirmation
	if(prefs.chastity_hardmode == CHASTITY_HARDMODE_DISABLED)
		var/confirm = alert(src, 
			"PERMANENT CHASTITY BINDING:\n\n\
			• Only the device's unique key can unlock it\n\
			• Keys can be lost, stolen, or destroyed forever\n\
			• Divine intervention will not free you\n\
			• Lockpicks and tools will fail\n\
			• Even the Duke's master key holds no power\n\
			• Physical removal is impossible\n\
			• You will remain bound until the key releases you\n\n\
			Do you accept these terms of permanent binding?",
			"Permanent Chastity Binding",
			"I accept the binding",
			"I refuse")
		
		if(confirm != "I accept the binding")
			to_chat(src, span_notice("You decline the permanent binding."))
			return
		
		prefs.chastity_hardmode = CHASTITY_HARDMODE_ENABLED
		prefs.save_preferences()
		if(ishuman(mob))
			var/mob/living/carbon/human/H = mob
			H.chastity_device?.sync_generated_key_metadata(H, mob)
		to_chat(src, span_boldwarning("You have accepted the terms of PERMANENT BINDING. Only keys shall grant freedom."))
		log_game("[key_name(src)] enabled permanent chastity binding.")
		message_admins("[key_name_admin(src)] enabled permanent chastity binding.")
	else
		// Disabling requires the humiliation prayer
		to_chat(src, span_notice("To disable permanent binding, you must recite the Prayer of Foolish Repentance to Eora."))
		var/sacred_prayer = "Dear Eora, I embraced this binding in foolish haste because I'm a dullard and I'm sorry, so so so sorry for being such a stupid stupid stupid person and I'm begging you please please please free my loins."
		var/encoded_sacred_prayer = html_encode(sacred_prayer)
		var/prayer_prompt = "Recite the Prayer of Foolish Repentance EXACTLY as written:\n\n\"[sacred_prayer]\"\n\n(You must type this yourself - copying is forbidden by divine law)"
		// multiline=TRUE so the wrapping textarea is readable; bigmodal=TRUE for a large window that shows the full prompt.
		// disable_paste=TRUE enforces hand-typing; max_length locks out anything longer than the prayer itself.
		var/prayer_attempt = tgui_input_text(src, prayer_prompt, "Prayer of Foolish Repentance", default = "", max_length = length(encoded_sacred_prayer), multiline = TRUE, encode = TRUE, ui_state = GLOB.tgui_always_state, bigmodal = TRUE, disable_paste = TRUE)

		if(!prayer_attempt)
			to_chat(src, span_warning("Eora does not hear your silence."))
			return

		// tgui_input_text() html-encodes player input, so compare against the prayer normalized the same way.
		if(prayer_attempt != encoded_sacred_prayer)
			to_chat(src, span_warning("Eora rejects your imperfect prayer. You must recite it EXACTLY as written."))
			to_chat(src, span_notice("You wrote: \"[prayer_attempt]\""))
			to_chat(src, span_notice("Required: \"[sacred_prayer]\""))
			log_game("[key_name(src)] failed the humiliation prayer (incorrect text).")
			return

		// They did it! The humiliation is complete
		prefs.chastity_hardmode = CHASTITY_HARDMODE_DISABLED
		prefs.save_preferences()
		if(ishuman(mob))
			var/mob/living/carbon/human/H = mob
			H.chastity_device?.sync_generated_key_metadata(H)
		to_chat(src, span_boldnotice("Eora hears your pathetic plea and takes pity upon you. The permanent binding is lifted."))
		to_chat(src, span_notice("You have revoked the permanent binding. Mortal means may now test the lock once more."))
		log_game("[key_name(src)] disabled permanent chastity binding via humiliation prayer.")
		message_admins("[key_name_admin(src)] disabled permanent chastity binding by reciting the humiliation prayer.")

/client/verb/toggle_extreme_ERP()// toggles gore, ryona, and other extreme content in the ERP panel. This is separate from the regular ERP toggle for users who want to avoid just the extreme content but are okay with milder stuff.
	set category = "Preferences.Sensual"
	set name = "Toggle Extreme ERP Content"
	if(prefs)
		prefs.extreme_erp = !prefs.extreme_erp
		prefs.save_preferences()
		if(prefs.extreme_erp)
			to_chat(src, "Extreme ERP content enabled in the ERP panel.")
		else
			if(hascall(src, "modular_handle_extreme_erp_toggle_disable"))
				call(src, "modular_handle_extreme_erp_toggle_disable")()
			to_chat(src, "Extreme ERP content disabled in the ERP panel.")

/client/verb/toggle_facial_brands()
	set category = "Preferences.Sensual"
	set name = "Toggle Facial Branding"
	if(prefs)
		prefs.facial_brands = !prefs.facial_brands
		prefs.save_preferences()
		if(prefs.facial_brands)
			to_chat(src, "Your head area can now be branded by others.")
		else
			to_chat(src, "Your head area can no longer be branded by others.")

/client/verb/toggle_sensitive_brands()
	set category = "Preferences.Sensual"
	set name = "Toggle Sensitive Branding"
	if(prefs)
		prefs.sensitive_brands = !prefs.sensitive_brands
		prefs.save_preferences()
		if(prefs.sensitive_brands)
			to_chat(src, "Your genital and breast organs can now be branded by others.")
		else
			to_chat(src, "Your genital and breast organs can no longer be branded by others.")

/client/verb/toggle_pubes()
	set category = "Preferences.Sensual"
	set name = "Toggle Pubic Hair Descriptors"
	if(prefs)
		prefs.pubes = !prefs.pubes
		prefs.save_preferences()
		if(prefs.pubes)
			to_chat(src, "Pubic hair descriptors are now visible when examining exposed players.")
		else
			to_chat(src, "You will no longer see pubic hair descriptions when examining exposed players.")

/client/verb/toggle_pits()
	set category = "Preferences.Sensual"
	set name = "Toggle Armpit Hair Descriptors"
	if(prefs)
		prefs.pits = !prefs.pits
		prefs.save_preferences()
		if(prefs.pits)
			to_chat(src, "Armpit hair descriptors are now visible when examining exposed players.")
		else
			to_chat(src, "You will no longer see armpit hair descriptors when examining players.")

/client/verb/toggle_descriptor_color()
	set category = "Preferences.Sensual"
	set name = "Toggle Colored Descriptors"
	if(prefs)
		prefs.descriptor_color = !prefs.descriptor_color
		prefs.save_preferences()
		if(prefs.descriptor_color)
			to_chat(src, "Genital and body hair descriptor colors are now visible.")
		else
			to_chat(src, "Genital and body hair descriptor colors are no longer visible.")

/client/verb/toggle_edging() // Toggles edging content in the ERP panel, for psydonites who clearly can't ENDURE.
	set category = "Preferences.Sensual"
	set name = "Toggle Edging Content"
	if(prefs)
		prefs.edging = !prefs.edging
		prefs.save_preferences()
		if(prefs.edging)
			to_chat(src, "You ENDVRE through orgasms.")
		else
			to_chat(src, "You will no longer ENDVRE through orgasms.")

/client/verb/toggle_free_use_default()
	set category = "Preferences.Sensual"
	set name = "Toggle Free Use Default"
	if(prefs)
		prefs.free_use_default = !prefs.free_use_default
		prefs.save_preferences()
		if(prefs.free_use_default)
			to_chat(src, "You will now start with Free Use enabled by default.")
		else
			to_chat(src, "You will no longer start with Free Use enabled by default.")


/client/verb/toggle_cursed_collars() // Toggles cursed collars. Will drop existing collars if toggled off while wearing one
	set category = "Preferences.Sensual"
	set name = "Toggle Cursed Collars"
	if(!prefs)
		return
	prefs.cursed_collarable = !prefs.cursed_collarable
	prefs.save_preferences()
	if(prefs.cursed_collarable)
		to_chat(src, "You can now be collared.")
		return
	to_chat(src, "You are no longer able to be collared")
	if(!ishuman(usr))
		return
	var/mob/living/carbon/human/human_user = usr
	var/obj/item/clothing/neck/roguetown/cursed_collar/collar = human_user.wear_neck
	if(!istype(collar))
		return
	collar.dropped(human_user)

/client/verb/toggle_compliance_notifs() // The messages need to be on-by-default while this is in its early stages.
	set category = "Preferences.Options"
	set name = "Toggle Compliance Notifs"
	if(prefs)
		prefs.compliance_notifs = !prefs.compliance_notifs
		prefs.save_preferences()
		if(prefs.compliance_notifs)
			to_chat(src, "You will receive chat notifications when enabling or disabling Compliance Mode.")
		else
			to_chat(src, "You will no longer be notified in chat when toggling Compliance Mode.")

/client/verb/toggle_examine_blocks()
	set category = "Preferences.Options"
	set name = "Toggle Examine Blocks"
	if(prefs)
		prefs.no_examine_blocks = !prefs.no_examine_blocks
		prefs.save_preferences()
		if(prefs.no_examine_blocks)
			to_chat(src, "You will no longer see examined items in boxes.")
		else
			to_chat(src, "You will now see examined items in boxes.")

/client/verb/toggle_autopunctuation()
	set category = "Preferences.Options"
	set name = "Toggle Autopunctuation"
	if(prefs)
		prefs.no_autopunctuate = !prefs.no_autopunctuate
		prefs.save_preferences()
		if(prefs.no_autopunctuate)
			to_chat(src, "Your messages will no longer be automatically punctuated.")
		else
			to_chat(src, "Your messages will now be automatically punctuated.")

/client/verb/toggle_language_fonts()
	set category = "Preferences.Options"
	set name = "Toggle Language Fonts"
	if(prefs)
		prefs.no_language_fonts = !prefs.no_language_fonts
		prefs.save_preferences()
		if(prefs.no_language_fonts)
			to_chat(src, "You will no longer see languages in their stylized fonts.")
		else
			to_chat(src, "You will now see languages in their stylized fonts.")

/client/verb/toggle_language_icon()
	set category = "Preferences.Options"
	set name = "Toggle Language Icon"
	if(prefs)
		prefs.no_language_icon = !prefs.no_language_icon
		prefs.save_preferences()
		if(prefs.no_language_icon)
			to_chat(src, "You will no longer see the language icon in front of a language.")
		else
			to_chat(src, "You will now see the language icon in front of a language.")

/client/verb/toggle_redflash()
	set category = "Preferences.Options"
	set name = "Toggle Red Screen Flash"
	if(prefs)
		prefs.no_redflash = !prefs.no_redflash
		prefs.save_preferences()
		var/mob/living/carbon/C = mob
		if(istype(C))
			C.update_damage_hud() // Fixes that the overlay is not removed when toggling if already present.
		to_chat(src, "You will see the red flashing effect [prefs.no_redflash ? "less" : "more"] frequently.")

/client/verb/toggle_topexamine()
	set category = "Preferences.Options"
	set name = "Toggle Top Examine"
	if(prefs)
		prefs.top_examine = !prefs.top_examine
		prefs.save_preferences()
		to_chat(src, "Main Examines will be at the [prefs.top_examine ? "top" : "bottom"].")

/client/verb/toggle_lobby_music()
	set name = "Toggle Lobby Music"
	set category = "Preferences.Options"
	set desc = ""
	if(prefs)
		prefs.toggles ^= SOUND_LOBBY
		prefs.save_preferences()
	if(prefs.toggles & SOUND_LOBBY)
		to_chat(src, "You will now hear music in the lobby.")
		if(isnewplayer(usr))
			playtitlemusic()
	else
		to_chat(src, "You will no longer hear music in the lobby.")
		mob.stop_sound_channel(CHANNEL_LOBBYMUSIC)

/client/verb/stop_sounds_rogue()
	set name = "StopSounds"
	set category = "Preferences.Options"
	set desc = ""
	if(mob)
		SEND_SOUND(mob, sound(null))

/client/verb/toggle_area_music()
	set category = "Preferences.Options"
	set name = "Toggle Area Music"
	if(prefs)
		prefs.stopdroning = !prefs.stopdroning
		prefs.save_preferences()

		if(prefs.stopdroning)
			to_chat(src, "You will no longer hear looping area music.")
			SSdroning.kill_droning(src)
			SSdroning.kill_loop(src)
		else
			to_chat(src, "You will now hear looping area music.")

/client/verb/cmode_strip()
	set name = "Combat Mode Stripping"
	set category = "Preferences.Options"
	set desc = ""
	if(prefs)
		prefs.combat_toggles ^= CMODE_STRIPPING
		prefs.save_preferences()
	to_chat(src, "You will [prefs.combat_toggles & CMODE_STRIPPING ? "" : "not"] be able to open the strip menu in combat mode.")

/client/verb/antighost()
	set name = "Toggle Antighost"
	set category = "Preferences.Options"
	set desc = ""
	if(prefs)
		prefs.ghost_toggles ^= TOGGLE_ANTIGHOST
		prefs.save_preferences()
	to_chat(src, "You are currently[prefs.ghost_toggles & TOGGLE_ANTIGHOST ? " not" : ""] orbitable.")

/client/verb/mood_messages_in_chat()
	set category = "Preferences.Options"
	set name = "Toggle Mood Messages"

	if(prefs)
		prefs.chat_toggles ^= CHAT_MOODMESSAGES
		prefs.save_preferences()

	to_chat(src, "You will[prefs.chat_toggles & CHAT_MOODMESSAGES ? "" : " not"] see all mood messages \
	in your chat. Sufficiently severe mood messages are shown in chat regardless of this toggle.")

/client/verb/attack_blip_frequency()
	set category = "Preferences.Options"
	set name = "Change Attack Sound Frequency"

	var/choice = input(src, "How often do you wish to hear your character emote on successful hits?", "ATTACK NOISE FREQUENCY") as null|anything in GLOB.attack_blip_pref_list
	if(!choice)
		return

	if(choice && prefs)
		prefs.attack_blip_frequency = GLOB.attack_blip_pref_list[choice]
		prefs.save_preferences()

	var/text = choice
	if(choice == "Half the time (Default)")
		text = "Half the time"

	to_chat(src, "Your character will [text] voice their successful attacks.")

/client/verb/toggle_xptext() // Whether the user can see the balloon XP pop ups.
	set category = "Preferences.Options"
	set name = "Toggle XP Text"
	if(prefs)
		prefs.combat_toggles ^= XP_TEXT
		prefs.save_preferences()
	to_chat(src, "You will[prefs.combat_toggles & XP_TEXT ? "" : " not"] see XP pop ups.")

/client/verb/vocal_barks()
	set name = "Toggle Vocal Barks"
	set category = "Preferences.Options"
	set desc = ""
	if(prefs)
		prefs.mute_barks = !prefs.mute_barks
		prefs.save_preferences()
	to_chat(src, "You will [prefs.mute_barks ? "not " : ""]hear vocal barks.")

/client/verb/toggle_hitzonetext() // Whether the user can see a text popup for where they got hit.
	set category = "Preferences.Options"
	set name = "Toggle Hitzone Text"
	if(prefs)
		prefs.combat_toggles ^= HITZONE_TEXT
		prefs.save_preferences()
	to_chat(src, "You will[prefs.combat_toggles & HITZONE_TEXT ? "" : " not"] see floating text for where you were hit.")

/client/verb/toggle_floatingtext() // Whether the user can see the balloon pop ups at all.
	set category = "Preferences.Options"
	set name = "Toggle Floating Text"
	if(prefs)
		prefs.combat_toggles ^= FLOATING_TEXT
		prefs.save_preferences()
	to_chat(src, "You will [prefs.combat_toggles & FLOATING_TEXT ? "see" : "not see any"] floating text.")

/client/verb/toggle_deadchat() // Whether the user can see DSAY or not.
	set name = "Show/Hide Deadchat"
	set category = "Preferences.Options"
	set desc ="Toggles seeing deadchat"

	if(prefs)
		prefs.chat_toggles ^= CHAT_DSAY
		prefs.save_preferences()
	to_chat(src, "You will [(prefs.chat_toggles & CHAT_DSAY) ? "now" : "no longer"] see deadchat.")
	if(holder)
		SSblackbox.record_feedback("nested tally", "admin_toggle", 1, list("Toggle Deadchat Visibility", "[prefs.chat_toggles & CHAT_DSAY ? "Enabled" : "Disabled"]"))

//Admin Preferences
/client/proc/toggleadminhelpsound()
	set name = "Hear/Silence Adminhelps"
	set desc = ""
	set hidden = 1
	if(!holder)
		return
	prefs.toggles ^= SOUND_ADMINHELP
	prefs.save_preferences()
	to_chat(usr, "You will [(prefs.toggles & SOUND_ADMINHELP) ? "now" : "no longer"] hear a sound when adminhelps arrive.")
	SSblackbox.record_feedback("nested tally", "admin_toggle", 1, list("Toggle Adminhelp Sound", "[prefs.toggles & SOUND_ADMINHELP ? "Enabled" : "Disabled"]")) //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/toggleannouncelogin()
	set name = "Do/Don't Announce Login"
	set category = "Admin.Preferences"
	set desc = ""
	if(!holder)
		return
	prefs.toggles ^= ANNOUNCE_LOGIN
	prefs.save_preferences()
	to_chat(usr, "You will [(prefs.toggles & ANNOUNCE_LOGIN) ? "now" : "no longer"] have an announcement to other admins when you login.")
	SSblackbox.record_feedback("nested tally", "admin_toggle", 1, list("Toggle Login Announcement", "[prefs.toggles & ANNOUNCE_LOGIN ? "Enabled" : "Disabled"]")) //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/toggleprayers()
	set name = "Show/Hide Prayers"
	set category = "Admin.Preferences"
	set desc = ""
	if(!holder)
		return
	prefs.chat_toggles ^= CHAT_PRAYER
	prefs.save_preferences()
	to_chat(src, "You will [(prefs.chat_toggles & CHAT_PRAYER) ? "now" : "no longer"] see prayerchat.")
	SSblackbox.record_feedback("nested tally", "admin_toggle", 1, list("Toggle Prayer Visibility", "[prefs.chat_toggles & CHAT_PRAYER ? "Enabled" : "Disabled"]")) //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/toggle_prayer_sound()
	set name = "Toggle Prayer Sounds"
	set category = "Admin.Preferences"
	set desc = ""
	if(!holder)
		return
	prefs.toggles ^= SOUND_PRAYERS
	prefs.save_preferences()
	to_chat(usr, "You will [(prefs.toggles & SOUND_PRAYERS) ? "now" : "no longer"] hear a sound when prayers arrive.")
	SSblackbox.record_feedback("nested tally", "admin_toggle", 1, list("Toggle Prayer Sounds", "[usr.client.prefs.toggles & SOUND_PRAYERS ? "Enabled" : "Disabled"]"))

/client/proc/colorasay()
	set name = "Set Asay Color"
	set category = "Admin.Preferences"
	set desc = ""
	if(!holder)
		return
	if(!CONFIG_GET(flag/allow_admin_asaycolor))
		to_chat(src, "Custom Asay color is currently disabled by the server.")
		return
	var/new_asaycolor = input(src, "Please select your ASAY color.", "ASAY color", prefs.asaycolor) as color|null
	if(new_asaycolor)
		prefs.asaycolor = sanitize_ooccolor(new_asaycolor)
		prefs.save_preferences()
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Set ASAY Color")
	return

/client/proc/resetasaycolor()
	set name = "Reset your Admin Say Color"
	set desc = ""
	set category = "Admin.Preferences"
	if(!holder)
		return
	if(!CONFIG_GET(flag/allow_admin_asaycolor))
		to_chat(src, "Custom Asay color is currently disabled by the server.")
		return
	prefs.asaycolor = initial(prefs.asaycolor)
	prefs.save_preferences()

/client/proc/hearallasghost()
	set category = "Admin.Preferences"
	set name = "HearAllAsAdmin"
	if(!holder)
		return
	if(!prefs)
		return
	prefs.chat_toggles ^= CHAT_GHOSTEARS
	prefs.chat_toggles ^= CHAT_GHOSTWHISPER
	prefs.save_preferences()
	if(prefs.chat_toggles & CHAT_GHOSTEARS)
		to_chat(src, span_notice("I will hear all now."))
	else
		to_chat(src, span_info("I will hear like a mortal."))

/client/proc/hearglobalLOOC()
	set category = "Admin.Preferences"
	set name = "Show/Hide Global LOOC"
	if(!holder)
		return
	if(!prefs)
		return
	prefs.admin_chat_toggles ^= CHAT_ADMINLOOC
	prefs.save_preferences()
	if(prefs.admin_chat_toggles & CHAT_ADMINLOOC)
		to_chat(src, span_notice("I will now hear all LOOC chatter."))
	else
		to_chat(src, span_info("I will now only hear LOOC chatter around me."))

/client/proc/hearsubtleLOOC()
	set category = "Admin.Preferences"
	set name = "Show/Hide Subtle LOOC"
	if(!holder)
		return
	if(!prefs)
		return
	prefs.admin_chat_toggles ^= CHAT_ADMIN_SLOOC
	prefs.save_preferences()
	if(prefs.admin_chat_toggles & CHAT_ADMIN_SLOOC)
		to_chat(src, span_notice("I will now hear subtle LOOC (SLOOC) chatter I am not part of."))
	else
		to_chat(src, span_info("I will no longer hear subtle LOOC (SLOOC) chatter I am not part of."))

/client/proc/togglespawnmessages()
	set category = "Admin.Preferences"
	set name = "Show/Hide Spawn Logs"
	if(!holder)
		return
	if(!prefs)
		return
	prefs.admin_chat_toggles ^= CHAT_ADMINSPAWN
	prefs.save_preferences()
	to_chat(src, "You will [prefs.admin_chat_toggles & CHAT_ADMINSPAWN ? "see" : "not see any"] spawn logs.")

#undef TOGGLE_CHECKBOX
