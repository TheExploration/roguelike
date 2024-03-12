let dgram = require("dgram");
let msgpack = require("@msgpack/msgpack");


let server = dgram.createSocket("udp4");

server.on("message", function(msg, rinfo){


    console.log(msg);
    server.send("message recieved", rinfo.port, rinfo.address); 
});

server.bind(6927);