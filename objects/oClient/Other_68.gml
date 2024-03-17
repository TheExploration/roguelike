/// @description Recieve Data
var packet = async_load[? "buffer"];
buffer_seek(packet, buffer_seek_start,0);

var data = SnapBufferReadMessagePack(packet,0);

switch (data.type) {
	case DATATYPE.connect:
		latency = current_time - data.time;
		timeout = 0;
	break;
	
		
	
}
