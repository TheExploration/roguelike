/// @description Networking Step

if (instance_exists(player)) {
	player_data.x = oPlayer.x;
	player_data.y = oPlayer.y;
	player_data.id = idd;
	send_struct(player_data);	
}





ping.time = current_time;
send_struct(ping);

timeout++;

if (timeout > 60*60){
	room_goto(rMenu);
	instance_destroy();
}