/// @description Init Client
port = 6927;
ip = "127.0.0.1";

network_set_config(network_config_connect_timeout, 3000);
client = network_create_socket(network_socket_tcp);
network_connect(client, ip, port);

//Display error if unable to connect
if (client < 0) {
	show_message("Error connecting to server.");
	game_restart();
	
}