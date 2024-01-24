/// @description Movement and Data

//Allow for movement only if our ID matches the client's
if (instance_exists(oClient) && (my_id == oClient.idd)) {
	//Basic Movement
	get_input();
	calc_movement();
	image_angle = point_direction(x,y,mouse_x,mouse_y);
	//Move
	move_and_collide(hsp, vsp, oWall);
	if (my_id != -1) {
		//Send our data
		var buff = write_move_buffer(my_id, x, y, image_angle)
	
		network_send_packet(oClient.client, buff, buffer_tell(buff));
		buffer_delete(buff);
	}
	
}
if (instance_exists(oServer) && (my_id == oServer.idd)) {
	//Basic Movement
	get_input();
	calc_movement();
	image_angle = point_direction(x,y,mouse_x,mouse_y);
	//Move
	move_and_collide(hsp, vsp, oWall);
	
	//Send our data
	var buff = write_move_buffer(my_id, x, y, image_angle)
	send_packet_all(oServer.total_players, buff);
	buffer_delete(buff);
}








