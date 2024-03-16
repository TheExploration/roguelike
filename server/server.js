let dgram = require("dgram");
let msgpack = require("@msgpack/msgpack");


let server = dgram.createSocket("udp4");

server.bind(6927);

const players = new Map();

const data = {
    CONNECT: "connect",
    DISCONNECT: "disconnect",
    MOVE: "move",
    FIRE: "fire",
    CHAT: "chat"
};

server.on("message", function(msg, rinfo){
    console.log(msgpack.decode(msg));
    server.send("message recieved", rinfo.port, rinfo.address); 
});