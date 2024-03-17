const dgram = require("dgram");
const msgpack = require("@msgpack/msgpack");

const BiMap = require('bidirectional-map');


let server = dgram.createSocket("udp4");

server.bind(6927);

const players = new BiMap();

const DATATYPE = {
    connect: 0,
    disconnect: 1,
    move: 2,
    chat: 3,
    fire: 4
};

let data;

function server_assign_id(){

    var pid = -1;
    if (ds_list_find_index(player_ids, 1) == -1) {
        ds_list_add(player_ids, 1);
        pid = 1;
    } else if (ds_list_find_index(player_ids, 2) == -1) {
        ds_list_add(player_ids, 2);
        pid = 2;
    } else if (ds_list_find_index(player_ids, 3) == -1) {
        ds_list_add(player_ids, 3);
        pid = 3;
    } else if (ds_list_find_index(player_ids, 4) == -1) {
        ds_list_add(player_ids, 4);
        pid = 4;
    } else {
        //server full
    }
    return pid;
    
    
}


server.on("message", function(msg, rinfo){
    console.log(msgpack.decode(msg));
    data = msgpack.decode(msg);
    switch (data.type) {
        case DATATYPE.connect:
            var jpid = server_assign_id();
        break;
        case DATATYPE.disconnect:
            
        break;
        case DATATYPE.connect:
            
        break;
        case DATATYPE.connect:
            
        break;

    }
    server.send("message recieved", rinfo.port, rinfo.address); 
});