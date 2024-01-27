/// @description Recieve Incoming Data
// You can write your code in this editor

var packet = async_load[? "buffer"];
buffer_seek(packet, buffer_seek_start,0);

var PACKET_ID = buffer_read(packet, buffer_u8);

switch (PACKET_ID) {
	#region Move
	case network.move: 
		var pid = buffer_read(packet, buffer_u16);
		var player_x = buffer_read(packet, buffer_s16);
		var player_y = buffer_read(packet, buffer_s16);
		var player_angle = buffer_read(packet, buffer_s16);
		
		update_move_players(pid, player_x, player_y, player_angle);
	break;
	#endregion
	#region Join
	case network.join:
		var pid = buffer_read(packet, buffer_u16);
		if (pid != -1) {
			
			player.my_id = pid;
			idd = pid;
			ds_map_add(instances, idd, player)
		}
	break;
	#endregion
	#region Disconnect
	case network.disconnect:
		var dpid = buffer_read(packet, buffer_u16);
		
		
		var disconnect_player = ds_map_find_value(instances, dpid);
		
		if (dpid != idd) {
			if (!is_undefined(disconnect_player)) {
				instance_destroy(disconnect_player);
				ds_map_delete(instances, dpid);
				
				//Display in chat
				ds_list_add(global.CHAT, string(dpid)+" has left the game.");
			}
		} else {
			room_goto(rMenu);
		}
		
		
	break;
	#endregion
	#region Chat
	case network.chat:
		//Read the message from the packet
		var msg = buffer_read(packet, buffer_string);
		
		//Now we need to add the string to the chat list
		if (instance_exists(oChat)) {
			ds_list_add(global.CHAT, msg);
		}
	break;
	#endregion
	
	#region Latency
	case network.latency:
		//Read the time
		var _got_time = buffer_read(packet, buffer_u32);
		
		//Set latency
		latency = current_time - _got_time;
		
		//reset timeout
		timeout = 0;
	break;
	#endregion
}





