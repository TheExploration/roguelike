let dgram = require("dgram");
let msgpack = require("@msgpack/msgpack");


let server = dgram.createSocket("udp4");

server.on("message", function(msg, rinfo){
    console.log(msgpack.decode(msg));
    server.send("message recieved", rinfo.port, rinfo.address); 
});
ssdsd
server.bind(6927);
a