/proc/highlight_phrases(text)
	for(var/phrase in GLOB.phrase_highlights)
		var/regex/reg = regex("(\\w*[REGEX_QUOTE(html_encode(phrase))]\\w*)(?!\[^<\]*>)", "gi")
		text = reg.Replace(text, "<span data-component=\"TooltipHTML\" data-html=\"[html_encode(GLOB.phrase_highlights[phrase])]\" style=\"color:#ad456d\">$1</span>")
	return text

/atom/movable/say_quote(input, list/spans = list(speech_span), message_mode, plaintext_input)
	if(!input)
		return ..()
	if(isnull(plaintext_input))
		plaintext_input = input
		input = parsemarkdown_basic(input, limited = TRUE, barebones = TRUE)
	return ..(highlight_phrases(input), spans, message_mode, plaintext_input)
