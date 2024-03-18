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
		for (var i = 0; i < instance_number(oPlayer); i++) {
			var target = instance_find(oPlayer, i);
			if (data.id == target.my_id) {
				target.x = data.x;
				target.y = data.y;
				
			}
		}
	break;
		
	
}
