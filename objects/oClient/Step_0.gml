/// @description Networking Step

if (!is_undefined(player) && player.my_id == idd) {
	player_data.x = player.x;
	player_data.y = player.y;
	player_data.dir = player.direction;
	player_data.id = player.my_id;
	send_struct(player_data);	
}





ping.time = current_time;
send_struct(ping);

timeout++;

if (timeout > 60*60){
	room_goto(rMenu);
	instance_destroy();
}