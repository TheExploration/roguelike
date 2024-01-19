/// @description Server Create

//Server Variables
port = 6927;
max_players = 4;

server = network_create_server(network_socket_tcp, port, max_players);
total_players = ds_list_create();

//Display Error
if (server < 0) {
		show_debug_message("Error creating server");
		game_restart();
}