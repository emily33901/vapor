module vapor

import rand.util
import emily33901.tomcrypt
import emily33901.tomcrypt.aes
import hash.crc32

// EncryptionHandler is a middleware for packets
// that are encrypted and decrypted before processing / sending
struct EncryptionHandler {
mut:
	s           &SteamClient
	session_key []byte
	encrypted   bool
}

fn generate_iv() []byte {
	return array{
		data: util.time_seed_array(4).data
		len: 16
		element_size: 1
		cap: 16
	}
}

fn (mut e EncryptionHandler) initialise_internal() ? {
	e.encrypted = false
	temp := util.time_seed_array(8)
	e.session_key = array{
		data: temp.data
		len: 32
		cap: 32
		element_size: 1
	}
}

fn (mut e EncryptionHandler) initialise(mut s SteamClient) ? {
	e.s = s
	e.initialise_internal()
}

fn (mut e EncryptionHandler) shutdown() ? {
	// re-initialise ourselves
	e.initialise_internal()
}

fn (mut e EncryptionHandler) decrypt_packet(p Packet) ?Packet {
	if !e.encrypted {
		return p
	}
	mut iv := []byte{len: 16}
	// free the old packet body and the iv when we are finished with them
	defer {
		unsafe {
			p.body.free()
			iv.free()
		}
	}
	aes.ecb_decrypt_into(e.session_key, p.body[..16], mut iv)
	mut output := []byte{len: p.body.len - 16}
	aes.cbc_decrypt_into(e.session_key, iv, p.body[16..], mut &output)
	return Packet{
		header: {
			size: output.len
			magic: p.header.magic
		}
		body: output
	}
}

fn (mut e EncryptionHandler) encrypt_packet(p Packet) ?Packet {
	if !e.encrypted {
		return p
	}
	output_size := 16 + ((p.body.len / 16) + 1) * 16
	mut output := []byte{len: output_size}
	mut @in := p.body
	mut iv := generate_iv()
	// free the old packet body and the iv when we are finished with them
	defer {
		unsafe {
			p.body.free()
			iv.free()
		}
	}
	aes.ecb_encrypt_into(e.session_key, iv, mut output[..16])
	aes.cbc_encrypt_into(e.session_key, iv, mut @in, mut output[16..])
	return Packet{
		header: {
			size: output_size
		}
		body: output
	}
}

fn (mut e EncryptionHandler) handle_msg(msg Message) ? {
	match msg.msg {
		.channel_encrypt_request {
			// 8 for header
			// 128 for key
			// 4 for crc32
			mut response := []byte{len: 8 + 128 + 4 + 4, init: 0}
			mut res_base := &MsgChannelEncryptResponse(response.data)
			res_base.protocol_version = 1
			res_base.key_size = 128
			rsa := tomcrypt.load_rsa_key(steam_public_key)
			rsa.sha1_encrypt_key_into(e.session_key, mut response[8..8 + 128])
			unsafe {
				mut sum := &u32(response[128 + 8..].data)
				*sum = crc32.sum(response[8..8 + 128])
			}
			e.s.write_non_protobuf_message(Message{.channel_encrypt_response, msg.source, msg.target, response})?
		}
		.channel_encrypt_result {
			m := &MsgChannelEncryptResult(msg.body.data)
			println('Channel encrypt result: $m.result')
			if m.result == 1 {
				e.encrypted = true
				e.s.dispatch_callback(ConnectedCallback{})
			}
		}
		else {}
	}
	return none
}
