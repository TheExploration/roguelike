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

function server_assign_id(address){
    if (players.has(address)) {
        return players.get(address);
    
    } else {
        if (!players.hasValue(1)) {
            players.set(address, 1);
        } else if (!players.hasValue(2)) {
            players.set(address, 2);
        } else if (!players.hasValue(3)) {
            players.set(address, 3);
        } else if (!players.hasValue(4)) {
            players.set(address, 4);
        }
    }
    return players.get(address);
    
}


server.on("message", function(msg, rinfo){
    console.log(msgpack.decode(msg));
    data = msgpack.decode(msg);
    switch (data.type) {
        case DATATYPE.connect:
            var jpid = server_assign_id(rinfo.address);
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