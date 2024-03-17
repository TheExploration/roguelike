/// @description Recieve Data
var packet = async_load[? "buffer"];
buffer_seek(packet, buffer_seek_start,0);

var data = SnapBufferReadMessagePack(packet,0);
