// Irrelevant to the tutorial, but a quick message display that clears itself. 

if (msg != "") {
	show_message_time--;
	if (show_message_time < 0) {
		msg = "";
	}
}

draw_text(room_width/2-(string_width(msg)/2),room_height/2-string_height(msg),msg);