/// @description Init Client
port = 6927;
ip = "6927.myqnapcloud.com";

network_set_config(network_config_connect_timeout, 3000);
client = network_create_socket(network_socket_tcp);
network_connect(client, ip, port);




//Display error if unable to connect
if (client < 0) {
	show_message("Error connecting to server.");
	game_restart();
	
}
//Chat
instance_create_layer(x,y,"Instances", oChat);

//Players
instances = ds_map_create();
idd = -1;
player = instance_create_layer(random(room_width), random(room_height), "Instances", oPlayer1);

//Latency and Timeout
latency = 0;
timeout = 0;


