/// @description Recieve Data
var packet = async_load[? "buffer"];
buffer_seek(packet, buffer_seek_start,0);

var data = SnapBufferReadMessagePack(packet,0);

switch (data.type) {
	case DATATYPE.connect:
		latency = current_time - data.time;
		timeout = 0;
		if (is_undefined(player)) {
			player = instance_create_layer(100,100, "Instances",oPlayer);
			player.my_id = data.id;
			idd = data.id;
			ds_map_add(instances, data.id, player);	
		}
	break;
	case DATATYPE.move: 
		show_debug_message(data);
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
	
	
	break;
		
	
}
