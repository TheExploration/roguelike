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

    if (players.has(add)) {
        return players.get(add);
    
    } else {
        if (!players.hasValue(1)) {
            players.set(add, 1);
        } else if (!players.hasValue(2)) {
            players.set(add, 2);
        } else if (!players.hasValue(3)) {
            players.set(add, 3);
        } else if (!players.hasValue(4)) {
            players.set(add, 4);
        }
    }
    return players.get(add);
    
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
                let arr = address.split(":");
                console.log("address: "+arr[0]+":"+arr[1]);
                if (arr[0] != rinfo.address || +arr[1] != rinfo.port) {
                    console.log("sending to "+arr[0]+":"+arr[1]);
                    server.send(msgpack.encode(move), +arr[1], arr[0]);
                }
            }
            
        break;
        case DATATYPE.chat:
            
        break;

    }
    console.log("message recieved"+ String(rinfo.port)+String( rinfo.address)); 
});