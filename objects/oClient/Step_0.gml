/// @description Networking Step

if (instance_exists(oPlayer)) {
	player_data.x = oPlayer.x;
	player_data.y = oPlayer.y;
	player_data.id = idd;
	
}

send_struct(player_data);
