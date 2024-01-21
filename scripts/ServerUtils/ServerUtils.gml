// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playercount() {
	var all_players = ds_list_size(total_players);
	
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text(room_width/2, room_height/2, "Connected Players: " + string(all_players));
	
	
}
function write_move_buffer(pid, player_x, player_y, player_angle) {
	//Send our data
	var buff = buffer_create(32, buffer_grow, 1);
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff, buffer_u8, network.move);
	buffer_write(buff, buffer_u16, pid);
	buffer_write(buff, buffer_s16, player_x);
	buffer_write(buff, buffer_s16, player_y);
	buffer_write(buff, buffer_s16, player_angle);
	return buff;
}

function update_players(pid, player_x, player_y, player_angle) {
	
			var find_player = ds_map_find_value(instances, pid);
		
			//If no instances, that means its not been created
			if (is_undefined(find_player)) {
				//Create the player
				var _p = instance_create_layer(random(room_width), random(room_height), "Instances", oPlayer1);
				ds_map_add(instances, pid, _p);	
			} else {
				if (idd != pid) && (instance_exists(find_player)) {
		
						
				
					//Assign to the other players
					find_player.x = player_x;
					find_player.y = player_y;
					find_player.image_angle = player_angle;
				}
			}
		
}