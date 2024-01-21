/// @description Recieve Incoming Data
// You can write your code in this editor

var packet = async_load[? "buffer"];
buffer_seek(packet, buffer_seek_start,0);

var PACKET_ID = buffer_read(packet, buffer_u8);

switch (PACKET_ID) {
	case network.move: 
		var pid = buffer_read(packet, buffer_u16);
		var player_x = buffer_read(packet, buffer_s16);
		var player_y = buffer_read(packet, buffer_s16);
		var player_angle = buffer_read(packet, buffer_s16);
		
		update_players(pid, player_x, player_y, player_angle);
	break;
}





