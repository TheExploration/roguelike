let dgram = require("dgram");
let msgpack = require("@msgpack/msgpack");


let server = dgram.createSocket("udp4");

server.on("message", function(msg, rinfo){
    //const i = msg.indexOf(0x00);
    //const nb = msg.slice(0, i+6);
    console.log(msgpack.decode(msg));
    server.send("message recieved", rinfo.port, rinfo.address); 
});

server.bind(6927);