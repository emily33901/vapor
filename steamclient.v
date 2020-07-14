module vapor

import encoding.base64
import proto

struct TcpHeader {
mut:
	size int
	magic u32
}

struct Packet {
	header TcpHeader
mut:
	body []byte
}

struct Message {
	msg Msg
	source u64
	target u64
	body []byte
}

struct SteamClient {
mut:
	cm_addr string
	client TcpClient
	handlers []MsgHandler

	// Items needed for the header
	session_id int
	steam_id u64

	// Handlers
	encryption &EncryptionHandler
	multi_handler &MultiHandler
	friends &SteamFriends
	user &SteamUser
}

pub fn new_steamclient() &SteamClient {
	s := &SteamClient {
		encryption: &EncryptionHandler{}
		multi_handler: &MultiHandler{}
		friends: &SteamFriends{}
		user: &SteamUser{}
	}

	s.handlers << s
	s.handlers << s.multi_handler
	s.handlers << s.encryption
	s.handlers << s.friends
	s.handlers << s.user

	for h in s.handlers {
		h.initialise(mut s)
	}

	return s
}

pub fn (mut s SteamClient) shutdown() ? {
	return none
}

pub fn (_ SteamClient) initialise(mut s SteamClient) ? {
}

pub fn (mut s SteamClient) connect() ? {
	cm := hardcoded_cm()
	println('connecting to $cm')
	s.client = new_tcp_client(cm)?
}

pub fn (mut s SteamClient) connected() bool {
	return s.encryption.encrypted == true
}

pub fn (mut s SteamClient) frame() ? {
	for {
		if p := s.read_packet() {
			s.process_and_dispatch_packet(p)?
		} else {
			break
		}
	}
}

fn (mut s SteamClient) read_packet() ?Packet {
	mut header := TcpHeader {}
	tcpclient_read<TcpHeader>(mut s.client, mut header, sizeof(TcpHeader))

	mut body := []byte{ len: header.size }
	s.client.read_into(body)?

	return s.encryption.decrypt_packet(Packet {header body})
}

// process_and_dispatch_packet processes a packet and then dispatches 
// the message that comes from it (if any)
fn (mut s SteamClient) process_and_dispatch_packet(p Packet) ? {
	if msg := s.process_packet(p) {
		s.dispatch(msg)?
		msg.body.free()
	}
}

fn (mut s SteamClient) process_packet(p Packet) ?Message {
	base_header := &MsgBaseHeader(p.body.data)

	is_proto, msg := base_header.decompose()

	println('$msg $is_proto')

	mut source_job_id := u64(0)
	mut target_job_id := u64(0)
	mut msg_body := array{}

	if !is_proto {
		match msg {
			.channel_encrypt_request,
			.channel_encrypt_result {
				full_header := &MsgHeader(p.body.data)
				source_job_id = full_header.source_job_id
				target_job_id = full_header.target_job_id
				msg_body = p.body[sizeof(MsgHeader)..].clone()
			}
			else {}
		}
	} else {
		full_header := &MsgHdrProtobuf(p.body.data)

		if full_header.header_length > 0 {
			header := proto.cmsgprotobufheader_unpack(
				p.body[sizeof(MsgHdrProtobuf)..int(sizeof(MsgHdrProtobuf))+full_header.header_length])?

			if header.has_steamid {
				s.steam_id = header.steamid
			}

			if header.has_client_sessionid {
				s.session_id = header.client_sessionid
			}
			source_job_id = header.jobid_source
			target_job_id = header.jobid_target
		} else {
			source_job_id = ~0
			target_job_id = ~0
		}

		msg_body = p.body[int(sizeof(MsgHdrProtobuf))+full_header.header_length..].clone()
	}

	return Message {
		msg
		source_job_id
		target_job_id
		msg_body
	}
}

fn (mut s SteamClient) dispatch(m Message) ? {
	for h in s.handlers {
		h.handle_msg(m)?
	}
}

fn (mut s SteamClient) handle_msg(m Message) ? {
}

fn (mut s SteamClient) write_packet(data []byte) ? {
	mut p := Packet {
		TcpHeader {	data.len }
		data
	}
	p = s.encryption.encrypt_packet(p)?
	mut body := p.body
	pad := []byte{len:8, init:0}
	defer {pad.free()}
	body.prepend(pad)

	mut packet_header := &TcpHeader(body.data)
	packet_header.size = p.header.size
	packet_header.magic = 0x31305456 // VT01

	s.client.write(body)?
}

fn (mut s SteamClient) write_non_protobuf_message(m Message) ? {
	if m.msg != .channel_encrypt_response {
		panic('This should only ever be called for channel_encrypt_response')
	}
	// Prepend 20 bytes for msg header
	mut body := m.body
	pad := []byte{len:20}
	body.prepend_many(pad, int(sizeof(MsgHeader)))

	mut message_header := &MsgHeader(body.data)
	message_header.msg = m.msg
	message_header.source_job_id = ~0
	message_header.target_job_id = ~0

	s.write_packet(body)?
}

fn (mut s SteamClient) write_message_internal(m Message) ? {
	mut header := proto.CMsgProtoBufHeader{}

	header.has_steamid = true
	header.steamid = 76561197960265728
	
	header.has_client_sessionid = true
	header.client_sessionid = int(s.session_id)

	if m.target != 0 {
		header.has_jobid_target = true
		header.jobid_target = m.target
	}

	packed_header := header.pack()

	mut full_message := []byte{len: int(sizeof(MsgHdrProtobuf))}
	mut proto_header :=  &MsgHdrProtobuf(full_message.data)
	proto_header.msg = m.msg.make_proto()
	proto_header.header_length = packed_header.len

	// put the proto header after the normal header
	full_message << packed_header
	full_message << m.body

	s.write_packet(full_message)
}

pub fn (mut s SteamClient) write_message(job u64, m Msg, body &Packable) ? {
	s.write_message_internal(Message {
		target: job
		msg: m
		body: body.pack()
	})
}

pub fn (s &SteamClient) friends() &SteamFriends {
	return s.friends
}

pub fn (s &SteamClient) user() &SteamUser {
	return s.user
}