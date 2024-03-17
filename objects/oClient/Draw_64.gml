draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(1000, 50, "Client Id: " + string(idd));
if (idd == -1) {
	draw_text(1000, 80, "Playing Locally");
}
draw_text(1000, 100, "Ping: " + string(latency));