/// @description Latency and Timeout

//Send current time
var lbuff = buffer_create(32, buffer_grow, 1);
buffer_seek(lbuff, buffer_seek_start, 0);
buffer_write(lbuff, buffer_u8, network.latency);





