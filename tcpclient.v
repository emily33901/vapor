module vapor

import x.net
import time

struct TcpClient {
	c net.TcpConn
}

fn new_tcp_client(addr string) ?TcpClient {
	mut c := net.dial_tcp(addr)?
	// set a timeout so we dont choke the CPU when there is nothing to read
	c.set_read_timeout(1 * time.second)
	return TcpClient{c}
}

fn (mut c TcpClient) read_into(b []byte) ? {
	len := b.len
	mut read := 0
	for read < len {
		r := c.c.read_into(mut b[read..]) or {
			if errcode != net.err_timed_out_code {  
				return error('Connection terminated $errcode $err')
			}
			continue
		}
		if r == 0 {
			return error('Connection terminated')
		}
		read += r
	}
}

fn (mut c TcpClient) write(data []byte) ? {
	c.c.write(data)?
}

fn (mut c TcpClient) close() ? {
	c.c.close()?
}
