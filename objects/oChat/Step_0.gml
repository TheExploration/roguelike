/// @description Text Input

//If the text box is open
if (focus) {
	text = keyboard_string;
	//If the user press enter
	if (keyboard_check_released(vk_enter) && string_length(text) < max_text) {
	
		//Create buffer
		chat.id = oClient.idd;
		chat.message = string(text);
		send_struct(chat);
		
		//Reset text
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


