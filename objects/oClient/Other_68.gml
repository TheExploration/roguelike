/// @description Recieve Data
var packet = async_load[? "buffer"];
buffer_seek(packet, buffer_seek_start,0);

var PACKET_ID = buffer_read(packet, buffer_u8);





