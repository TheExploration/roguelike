/// @description Makes the server a client

is_client = true;
player = instance_create_layer(random(room_width), random(room_height), "Instances", oPlayer1);
idd = player.my_id;
ds_map_add(instances, idd, player)
