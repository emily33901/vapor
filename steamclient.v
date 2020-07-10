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

// TODO
// type FillFn = fn (mut body []byte)?

struct SteamClient {
mut:
	cm_addr string
	client TcpClient
	handlers []MsgHandler
	session_id u32
	encryption &EncryptionHandler
}

pub fn new_steamclient() &SteamClient {
	s := &SteamClient {
		encryption: &EncryptionHandler{}
	}

	s.handlers << s
	s.handlers << s.encryption

	for h in s.handlers {
		h.initialise(mut s)
	}

	return s
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
			if msg := s.process_packet(p) {
				s.dispatch(msg)?
			}
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

fn (mut s SteamClient) fake_packet(body []byte) ? {
	decrypted := s.encryption.decrypt_packet(Packet { TcpHeader {size: body.len magic: 0} body})?
	s.process_packet(decrypted)?
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
				msg_body = p.body[sizeof(MsgHeader)..]
			}
			else {}
		}
	} else {
		full_header := &MsgHdrProtobuf(p.body.data)
		header := proto.cmsgprotobufheader_unpack(p.body[sizeof(MsgHdrProtobuf)..int(sizeof(MsgHdrProtobuf))+full_header.header_length])?
		println('$header')

		match msg {
			.client_log_on_response {
				// TODO remove
				sliced := p.body[int(sizeof(MsgHdrProtobuf))+full_header.header_length..]
				message := proto.cmsgclientlogonresponse_unpack(sliced)?
				
				println('$message')
				println('$message.eresult')
			}

			else {
				println('unknown message')
			}
		}
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
		h.handle_msg(m)
	}
}

fn (mut s SteamClient) handle_msg(m Message) ? {
}

fn (mut s SteamClient) write_packet(mut data []byte) ? {
	mut p := Packet {
		TcpHeader {	data.len }
		data
	}
	p = s.encryption.encrypt_packet(p)?
	mut body := p.body
	val := byte(0)
	// prepend 8 bytes for packet header
	// TODO careful this doesnt do what we want at all 
	// and just reads random crap off of the stack!!!!
	body.prepend_many(val, int(sizeof(TcpHeader)))

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
	val := byte(0)
	body.prepend_many(val, int(sizeof(MsgHeader)))

	mut message_header := &MsgHeader(body.data)
	message_header.msg = m.msg
	message_header.source_job_id = ~0
	message_header.target_job_id = ~0

	s.write_packet(body)?
}

fn (mut s SteamClient) write_message(m Message) ? {
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

pub fn steamclient_write_message(mut s SteamClient, job u64, m Msg, body &Packable, size u32) ? {
	s.write_message(Message {
		target: job
		msg: m
		body: body.pack()
	})
}

pub fn (mut s SteamClient) logon(username, password string) ? {
	mut logon_message := proto.CMsgClientLogon{}

	logon_message.has_protocol_version = true
	logon_message.protocol_version = 65575

	logon_message.has_account_name = true
	logon_message.account_name = username

	logon_message.has_password = true
	logon_message.password = password

	logon_message.has_cell_id = true
	logon_message.cell_id = 4

	packed := logon_message.pack()
	println('${base64.encode(tos(packed.data, packed.len))}')

	steamclient_write_message(mut s, 0, .client_logon, &logon_message, sizeof(proto.CMsgClientLogon))
}