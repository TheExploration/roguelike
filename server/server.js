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