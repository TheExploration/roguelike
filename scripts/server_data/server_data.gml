//Handle Packets Coming from Clients
function server_data(){
	var packet = async_load[? "buffer"];
	buffer_seek(packet, buffer_seek_start, 0);
	
	var PACKET_ID = buffer_read(packet, buffer_u8);
	
	switch (PACKET_ID) {
		case network.move:
			var pid = buffer_read(packet, buffer_u16);
			var player_x = buffer_read(packet, buffer_s16);
			var player_y = buffer_read(packet, buffer_s16);
			var player_angle = buffer_read(packet, buffer_s16);
			
			if (is_client) {
				
				update_move_players(pid, player_x, player_y, player_angle);
				
			}


			//Send to clients
			var buff = write_move_buffer(pid, player_x, player_y, player_angle);
			
			
			for (var i = 0; i < ds_list_size(total_players); i++) {
				
				network_send_packet(ds_list_find_value(total_players, i), buff, buffer_tell(buff));
			}
			buffer_delete(buff);
		break;
			
			
			
	}
}