function send_struct(data, socket = oClient.socket) {
	var buff = buffer_create(300, buffer_fixed, 1);
	buffer_seek(buff, buffer_seek_start, 0);
	SnapBufferWriteMessagePack(buff, data);
	show_debug_message(buffer_tell(buff));
	network_send_udp_raw(socket, IP, PORT, buff, buffer_tell(buff));
	buffer_delete(buff);
}