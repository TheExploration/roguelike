function send_struct(data, socket = oClient.socket) {
	var buff = buffer_create(200, buffer_fixed, 1);
	buffer_seek(buff, buffer_seek_start, 0);
	SnapBufferWriteMessagePack(buff, data);
	show_debug_message(buffer_tell(buff));
	network_send_udp_raw(socket, IP, PORT, buff, buffer_tell(buff));
	buffer_delete(buff);
}


function handle_connect(data) {
	
	latency = current_time - data.time;
	timeout = 0;
	if (is_undefined(player)) {
		player = instance_create_layer(100,100, "Instances",oPlayer);
		player.my_id = data.id;
		idd = data.id;
		ds_map_add(instances, data.id, player);	
	}
}

function handle_move(data) {

		var find_player = ds_map_find_value(instances, data.id);
		
		//If no instances, that means its not been created
		if (is_undefined(find_player)) {
			//Create the player
			var _p = instance_create_layer(random(room_width), random(room_height), "Instances", oPlayer);
			_p.my_id = data.id;
			ds_map_add(instances, data.id, _p);	
		} else {
			if (idd != data.id) && (instance_exists(find_player)) {
		
						
				
				//Assign to the other players
				find_player.x = data.x;
				find_player.y = data.y;
				find_player.image_angle = data.dir;
			}
		}
	
}