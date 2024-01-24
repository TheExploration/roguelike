/// @description Makes the server a client

is_client = true;
if (player == noone) {
	player = instance_create_layer(random(room_width), random(room_height), "Instances", oPlayer1);
	idd = 0;
	player.my_id = idd;
	ds_map_add(instances, idd, player)
}