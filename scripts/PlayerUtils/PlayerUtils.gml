// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_input() {
	up = keyboard_check(ord("W"));
	down = keyboard_check(ord("S"));
	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));
	


}

function calc_movement() {
	//Calculate Movement
	var moveX = right-left;
	var moveY = down-up;

	//Horizontal
	hsp = moveX * move_spd;

	//Vertical
	vsp = moveY * move_spd;

	//Diagonal


	if (hsp != 0 && vsp != 0) {
		hsp = hsp/sqrt(2);
		vsp = vsp/sqrt(2);
	}
}