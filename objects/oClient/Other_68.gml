/// @description Recieve Data
var packet = async_load[? "buffer"];
buffer_seek(packet, buffer_seek_start,0);

var data = SnapBufferReadMessagePack(packet,0);

switch (data.type) {
	case DATATYPE.connect:
		latency = current_time - data.time;
		timeout = 0;
		if (idd = -1) {
			idd = data.id;
			player.my_id = idd;
		}
	break;
	case DATATYPE.move: 
	show_debug_message("MOVING");
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
				find_player.image_angle = data.direction;
			}
		}
	
	
	break;
		
	
}
