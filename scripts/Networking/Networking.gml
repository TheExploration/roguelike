function send_struct(data, socket = oClient.socket) {
	var buff = buffer_create(200, buffer_fixed, 200);
	buffer_seek(buff, buffer_seek_start, 0);
	SnapBufferWriteMessagePack(buff, data);
	network_send_udp_raw(socket, IP, PORT, buff, buffer_tell(buff));
	buffer_delete(buff);
}