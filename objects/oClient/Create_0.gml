/// @description Init Client
port = 6927;
ip = "6927.myqnapcloud.com";

socket = network_create_socket(network_socket_udp);
network_connect_raw(socket, ip, port);


player_data = {
	type : DATATYPE.connect,
	x : -1,
	y : -1,
	id : -1
};
idd = -1;

ping = {
	type : DATATYPE.connect,
	
}

enum DATATYPE {
	connect,
	disconnect,
	move,
	chat,
	fire
};


//Latency and Timeout
latency = 0;
timeout = 0;
alarm[0] = 120;


