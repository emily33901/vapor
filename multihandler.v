module vapor 

import emily33901.archive

import proto

struct MultiHandler {
mut:
	s &SteamClient
}

pub fn (mut h MultiHandler) initialise(mut s SteamClient) ? {
	h.s = s
}

pub fn (mut h MultiHandler) handle_msg(m Message) ? {
	if m.msg == .multi {
		multi := proto.cmsgmulti_unpack(m.body)?

		mut body := multi.message_body

		if multi.size_unzipped > 0 {
			body = archive.deflate(multi.message_body, int(multi.size_unzipped))?
		}

		for i := 0; i < body.len; {
			size := *&int(body[i..].data)
			i += 4
			inner_body := body[i..i+size]

			h.s.process_and_dispatch_packet(Packet{ body: inner_body })?

			i += size
		}

		body.free()
	}
}