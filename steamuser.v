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


// LogonConfig is the config passed to SteamUser.logon
pub struct LogonConfig {
	username string
	password string

	steamguard string
	twofactor string
}

// logon logs on with a username and password
pub fn (mut user SteamUser) logon(c LogonConfig) ? {
	mut logon_message := proto.CMsgClientLogon{
		// TODO a bump to 65580 means we go from deflate -> gzip compression
		protocol_version: 65575
		cell_id: 4
		account_name: c.username
		password: c.password
	}
	user.s.write_message(0, .client_logon, &logon_message)?
}

// logoff logs off the currently logged on account
pub fn (mut user SteamUser) logoff() ? {
	mut logoff_message := proto.CMsgClientLogOff{}
	user.s.write_message(0, .client_log_off, &logoff_message)
}
