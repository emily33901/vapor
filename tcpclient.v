module vapor

import emily33901.net

import time

// TcpClient is a basic wrapper around a tcp connection
// right now it is implemented with loose functions until
// our good friend Joe C gets round to adding methods :)
struct TcpClient {
	c net.TcpConn
}

pub fn new_tcp_client(addr string) ?TcpClient {
	mut c := net.dial_tcp(addr)?

	// set a timeout so we dont choke the CPU when there is nothing to read
	c.set_read_timeout(5 * time.second)

	return TcpClient{c}
}

fn (mut c TcpClient) read_into(b []byte) ? {
	len := b.len
	mut read := 0
	for read < len {
		read += c.c.read_into(mut b[read..]) or {
			0
		}
	}
}

pub fn (mut c TcpClient) write(data []byte) ? {
	c.c.write(data)?
}

pub fn tcpclient_read<T>(mut c TcpClient, mut v T, size u32) ? {
	arr := array {data: v len: int(size) element_size: 1}
	c.read_into(arr)?
}

// pub fn (mut c TcpClient) read<T>(mut v T) ? {
// 	arr := array {data: &v len: sizeof(T) element_size: 1}
// 	c.read_into(mut arr)?
// }

pub fn tcpclient_write<T>(mut c TcpClient, mut v T, size u32) ? {
	arr := array {data: v len: int(size) element_size: 1}
	c.write(arr)?
}

// pub fn (mut c TcpClient) write<T>(v T) ? {
// 	arr := array {data: &v len: sizeof(T) element_size: 1}
// 	c.c.write(arr)?
// }