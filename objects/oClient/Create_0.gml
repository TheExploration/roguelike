/// @description Init Client
port = 6927;
ip = "6927.myqnapcloud.com";

socket = network_create_socket(network_socket_udp);
network_connect_raw(socket, ip, port);

player = undefined;
instance_create_layer(100,100, "Instances",oChat);

instances = ds_map_create();

player_data = {
	type : DATATYPE.move,
	x : -1,
	y : -1,
	dir : 0,
	id : -1
};
idd = -1;

disconnect = {
	type : DATATYPE.disconnect,
	id : idd
}

ping = {
	type : DATATYPE.connect,
	time : current_time
}

enum DATATYPE {
	connect, //and Ping
	disconnect,
	move,
	chat,
	fire
};


//Latency and Timeout
latency = 0;
timeout = 0;
alarm[0] = 120;
ping.time = current_time;
send_struct(ping);
