let dgram = require("dgram");
const msgpack = require("@msgpack/msgpack");

const BiMap = require('bidirectional-map');


let server = dgram.createSocket("udp4");

server.bind(6927);

const players = new BiMap();

const TYPE = {
    connect: 0,
    DISCONNECT: 1,
    MOVE: 2,
    CHAT: 3,
    FIRE: 4
};

server.on("message", function(msg, rinfo){
    console.log(msgpack.decode(msg).x);
    server.send("message recieved", rinfo.port, rinfo.address); 
});