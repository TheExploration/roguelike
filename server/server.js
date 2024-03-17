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
let data;


server.on("message", function(msg, rinfo){
    console.log(msgpack.decode(msg));
    data 
    server.send("message recieved", rinfo.port, rinfo.address); 
});