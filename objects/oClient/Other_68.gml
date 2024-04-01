/// @description Recieve Data
var packet = async_load[? "buffer"];
buffer_seek(packet, buffer_seek_start,0);

var data = SnapBufferReadMessagePack(packet,0);

switch (data.type) {
	case DATATYPE.connect:
		handle_connect(data);
	break;
	case DATATYPE.move: 
		handle_move(data);
	break;
	case DATATYPE.disconnect:
		handle_disconnect(data);
	break;
	case DATATYPE.chat:
		handle_chat(data);
	break;
		
	
}
