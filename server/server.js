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

function server_assign_id(address, port){
    let add = address + ":" + port;

    if (players.has(address)) {
        return players.get(address);
    
    } else {
        if (!players.hasValue(1)) {
            players.set(address, 1);
        } else if (!players.hasValue(2)) {
            players.set(address, 2);
        } else if (!players.hasValue(3)) {
            players.set(address, 3);
        } else if (!players.hasValue(4)) {
            players.set(address, 4);
        }
    }
    return players.get(address);
    
}


server.on("message", function(msg, rinfo){
    console.log(msgpack.decode(msg));
    data = msgpack.decode(msg);

    switch (data.type) {
        case DATATYPE.connect:
            let jpid = server_assign_id(rinfo.address, rinfo.port);
            let ping = {
                type : DATATYPE.connect,
                time : data.time,
                id : jpid
            };
            server.send(msgpack.encode(ping), rinfo.port, rinfo.address);

        break;
        case DATATYPE.disconnect:
            
        break;
        case DATATYPE.move:
            let move = {
                type : DATATYPE.move,
                x : data.x,
                y : data.y,
                dir : data.dir,
                id : data.id
            };
            
            for (let address of players.keys()) {
                
                    
                server.send(msgpack.encode(move), rinfo.port, address);
                
            }
            
        break;
        case DATATYPE.chat:
            
        break;

    }
    console.log("message recieved"+ String(rinfo.port)+String( rinfo.address)); 
});