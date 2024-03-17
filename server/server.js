let dgram = require("dgram");
let msgpack = require("@messagepack/msgpack");
import {encode, decode} from "messagepack";
import BiMap from 'bidirectional-map'


let server = dgram.createSocket("udp4");

server.bind(6927);

const players = new BiMap();

const data = {
    CONNECT: "connect",
    DISCONNECT: "disconnect",
    MOVE: "move",
    FIRE: "fire",
    CHAT: "chat"
};

server.on("message", function(msg, rinfo){
    console.log(decode(msg));
    server.send("message recieved", rinfo.port, rinfo.address); 
});