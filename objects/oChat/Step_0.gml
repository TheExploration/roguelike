/// @description Text Input

//If the text box is open
if (focus) {
	text = keyboard_string;
	//If the user press enter
	if (keyboard_check_released(vk_enter) && string_length(text) < max_text) {
		
		//Create buffer
		var tbuff = buffer_create(32, buffer_grow, 1);
		buffer_seek(tbuff, buffer_seek_start, 0);
		buffer_write(tbuff, buffer_u8, network.chat);
		buffer_write(tbuff, buffer_string, "[" + string(oClient.idd) + "]: "+string(text));
		
		//Send to server
		network_send_packet(oClient.client, tbuff, buffer_tell(tbuff));
		//Delete
		buffer_delete(tbuff);
		
		//Reset tex
		text = "";
		keyboard_string = "";
		focus = !focus;
	}
} else if (keyboard_check_released(vk_enter)) {
	focus = !focus;
	text = "";
	keyboard_string = "";
}


//Chat max storage
while (ds_list_size(global.CHAT) > stored_messages){
	ds_list_delete(global.CHAT, 0); //Delete oldest message
}


