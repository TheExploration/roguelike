/// @description Insert description here
var data_type = async_load[? "type"];

switch(data_type) {
	case network_type_connect:
		var player_socket = async_load[? "socket"];
		ds_list_add(total_players, player_socket);
		var jpid = server_assign_id();
		var jbuff = buffer_create(32, buffer_grow, 1);
		buffer_seek(jbuff, buffer_seek_start, 0);
		buffer_write(jbuff, buffer_u8, network.join);
		buffer_write(jbuff, buffer_u16, jpid);
		send_packet_all(total_players, jbuff);
		buffer_delete(jbuff);
		break;
	
	case network_type_disconnect:
		var disconnect_socket = async_load[? "socket"];
		var index = ds_list_find_index(total_players, disconnect_socket);
		ds_list_delete(total_players, index);
		var dpid = ds_list_find_value(player_ids, index);
		var dbuff = buffer_create(32, buffer_grow, 1);
		buffer_seek(dbuff, buffer_seek_start, 0);
		buffer_write(dbuff, buffer_u8, network.disconnect);
		buffer_write(dbuff, buffer_u16, dpid);
		send_packet_all(total_players, dbuff);
		ds_list_delete(player_ids, index);
		buffer_delete(dbuff);
		
		//Remove if client
		if (is_client) {
			if (!is_undefined(ds_map_find_value(instances, dpid))) {
				instance_destroy(ds_map_find_value(instances, dpid));
				ds_map_delete(instances, dpid);
			}
		}
		break;
		
	case network_type_data:
		server_data();
		break;
}