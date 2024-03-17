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


server.on("message", function(msg, rinfo){
    console.log(msgpack.decode(msg));
    data = msgpack.decode(msg);
    switch (data.type) {
        case DATATYPE.connect:
            console.log("connect");
        break;
        case DATATYPE.DISCONNECT:
            
        break;
        case DATATYPE.connect:
            
        break;
        case DATATYPE.connect:
            
        break;

    }
    server.send("message recieved", rinfo.port, rinfo.address); 
});