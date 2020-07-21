module vapor

import rand.util
import emily33901.tomcrypt
import emily33901.tomcrypt.aes
import hash.crc32

const (
	steam_public_key = [
        byte(0x30), 0x81, 0x9D, 0x30, 0x0D, 0x06, 0x09, 0x2A, 0x86, 0x48, 0x86, 0xF7, 0x0D, 0x01, 0x01, 0x01,
        0x05, 0x00, 0x03, 0x81, 0x8B, 0x00, 0x30, 0x81, 0x87, 0x02, 0x81, 0x81, 0x00, 0xDF, 0xEC, 0x1A,
        0xD6, 0x2C, 0x10, 0x66, 0x2C, 0x17, 0x35, 0x3A, 0x14, 0xB0, 0x7C, 0x59, 0x11, 0x7F, 0x9D, 0xD3,
        0xD8, 0x2B, 0x7A, 0xE3, 0xE0, 0x15, 0xCD, 0x19, 0x1E, 0x46, 0xE8, 0x7B, 0x87, 0x74, 0xA2, 0x18,
        0x46, 0x31, 0xA9, 0x03, 0x14, 0x79, 0x82, 0x8E, 0xE9, 0x45, 0xA2, 0x49, 0x12, 0xA9, 0x23, 0x68,
        0x73, 0x89, 0xCF, 0x69, 0xA1, 0xB1, 0x61, 0x46, 0xBD, 0xC1, 0xBE, 0xBF, 0xD6, 0x01, 0x1B, 0xD8,
        0x81, 0xD4, 0xDC, 0x90, 0xFB, 0xFE, 0x4F, 0x52, 0x73, 0x66, 0xCB, 0x95, 0x70, 0xD7, 0xC5, 0x8E,
        0xBA, 0x1C, 0x7A, 0x33, 0x75, 0xA1, 0x62, 0x34, 0x46, 0xBB, 0x60, 0xB7, 0x80, 0x68, 0xFA, 0x13,
        0xA7, 0x7A, 0x8A, 0x37, 0x4B, 0x9E, 0xC6, 0xF4, 0x5D, 0x5F, 0x3A, 0x99, 0xF9, 0x9E, 0xC4, 0x3A,
        0xE9, 0x63, 0xA2, 0xBB, 0x88, 0x19, 0x28, 0xE0, 0xE7, 0x14, 0xC0, 0x42, 0x89, 0x02, 0x01, 0x11,
    ]
)

// EncryptionHandler is a middleware for packets
// that are encrypted and decrypted before processing / sending
struct EncryptionHandler {
mut:
    s & SteamClient
	session_key []byte
    encrypted bool
}

fn generate_iv() []byte {
    return array {data: util.time_seed_array(4).data, len: 16, element_size: 1, cap: 16}
}

fn (mut e EncryptionHandler) initialise_internal() ? {
    e.encrypted = false
    temp := util.time_seed_array(8)
    e.session_key = array{data:temp.data, len:32, cap:32, element_size:1}
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
    defer { p.body.free() }
    defer { iv.free() }
    
    aes.ecb_decrypt_into(e.session_key, p.body[..16], mut iv)
    mut output := []byte{len:p.body.len-16}

    aes.cbc_decrypt_into(e.session_key, iv, p.body[16..], mut &output)

    return Packet {
        header: {
            size: output.len,
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

    mut output := []byte{ len:output_size }
    mut @in := p.body

    mut iv := generate_iv()
    
    // free the old packet body and the iv when we are finished with them
    defer { 
        p.body.free() 
        iv.free() 
    }
    
    aes.ecb_encrypt_into(e.session_key, iv, mut output[..16])
    aes.cbc_encrypt_into(e.session_key, iv, mut @in, mut output[16..])

    return Packet {
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
            mut response := []byte{ len: 8+128+4+4, init: 0 }
            mut res_base := &MsgChannelEncryptResponse(response.data)
            res_base.protocol_version = 1
            res_base.key_size = 128

            rsa := tomcrypt.load_rsa_key(steam_public_key)
            rsa.sha1_encrypt_key_into(e.session_key, mut response[8..8+128])
            unsafe {
                mut sum := &u32(response[128+8..].data)
                *sum = crc32.sum(response[8..8+128])
            }

            e.s.write_non_protobuf_message(Message {
                .channel_encrypt_response
                msg.source
                msg.target
                response
            })?
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

