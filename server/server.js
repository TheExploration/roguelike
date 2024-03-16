let dgram = require("dgram");
let msgpack = require("@msgpack/msgpack");


let server = dgram.createSocket("udp4");

server.bind(6927);

const data_type = {
    
}

server.on("message", function(msg, rinfo){
    console.log(msgpack.decode(msg));
    server.send("message recieved", rinfo.port, rinfo.address); 
});