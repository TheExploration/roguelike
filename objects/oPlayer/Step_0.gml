/// @description Insert description here
	
if (my_id = oClient.idd) {
	//Basic Movement
	get_input();
	calc_movement();
	image_angle = point_direction(x,y,mouse_x,mouse_y);
	//Move
	move_and_collide(hsp, vsp, oWall);
}







