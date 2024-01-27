/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(1000, 50, "Client Id: " + string(idd));
if (idd == -1) {
	draw_text(1000, 80, "Playing Locally");
}
draw_text(1000, 50, "Ping: " + string(latency));








