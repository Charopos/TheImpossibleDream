/client/toggle_command_bar_button()
	set name = "toggle-command-bar-button"
	set hidden = TRUE

	var/current = winget(src, "outputwindow.input", "command")
	if(current == "say")
		set_command_bar_mode(FALSE)
	else
		set_command_bar_mode(TRUE)

/client/show_command_bar_button()
	winset(src, "outputwindow.saybutton", "is-visible=true")
	winset(src, "outputwindow.input", "anchor2=92,100")

/client/hide_command_bar_button()
	return

/client/check_localhost_command_bar()
	show_command_bar_button()
	winset(src, "outputwindow.input", "command=")
	winset(src, "outputwindow.saybutton", "text=Cmd;is-checked=false")
