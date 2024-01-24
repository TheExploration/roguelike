/// @description Draw the chat

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

//Draw input box
if (focus) {
	draw_rectangle(16, room_height/2-8, 232, room_height/2+8, true);
	draw_text(20, room_height/2, string(text)+cursor);
	
} else {
	draw_text(16, room_height/2-8, "Press ENTER to chat.");
}

//Draw messages from the chat
var yy = 64;

//Loop through the list and draw the messages
for (var i = 0; i < ds_list_size(global.CHAT); i++) {
	draw_text_ext(16, yy, ds_list_find_value(global.CHAT, i), -1, max_text);
	
	yy+=16;
}


