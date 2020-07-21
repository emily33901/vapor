module vapor

import proto

struct SteamUser {
mut:
	s &SteamClient
}

fn (mut user SteamUser) initialise(mut s SteamClient) ? {
	user.s = s
}

fn (mut user SteamUser) handle_msg(m Message) ? {
	match m.msg {
		.client_log_on_response {
			message := proto.cmsgclientlogonresponse_unpack(m.body)?
			user.handle_logon_response(message)
		}
		else {}
	}
}

// logon logs on with a username and password
pub fn (mut user SteamUser) logon(username, password string) ? {
	mut logon_message := proto.CMsgClientLogon{}
	logon_message.has_protocol_version = true
	// TODO a bump to 65580 means we go from deflate -> gzip compression
	logon_message.protocol_version = 65575
	logon_message.has_account_name = true
	logon_message.account_name = username
	logon_message.has_password = true
	logon_message.password = password
	logon_message.has_cell_id = true
	logon_message.cell_id = 4
	user.s.write_message(0, .client_logon, &logon_message)?
}

// logoff logs off the currently logged on account
pub fn (mut user SteamUser) logoff() ? {
	mut logoff_message := proto.CMsgClientLogOff{}
	user.s.write_message(0, .client_log_off, &logoff_message)
}
