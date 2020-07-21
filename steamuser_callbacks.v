module vapor

import time
import proto

pub struct LoggedOnCallback {
pub:
	result                          Result
	extended_result                 Result
	out_of_game_heartbeat_secs      int
	in_game_heartbeat_secs          int
	// ip address
	server_time                     time.Time
	account_flags                   AccountFlags
	steamid                         SteamId
	email_domain                    string
	// Number of times an event happens
	// before you need to find another CM
	// and connect to that instead
	// These are used internally to schedule heartbeat
	// sending
	count_login_failures_to_migrate int
	count_disconnects_to_migrate    int
}

fn (mut user SteamUser) handle_logon_response(msg proto.CMsgClientLogonResponse) {
	user.s.dispatch_callback(LoggedOnCallback{
		result: msg.eresult
		extended_result: msg.eresult_extended
		out_of_game_heartbeat_secs: msg.out_of_game_heartbeat_seconds
		in_game_heartbeat_secs: msg.in_game_heartbeat_seconds
		server_time: time.new_time({
			unix: msg.rtime32_server_time
		})
		account_flags: AccountFlags(msg.account_flags)
		steamid: SteamId(user.s.steam_id)
		count_login_failures_to_migrate: msg.count_loginfailures_to_migrate
		count_disconnects_to_migrate: msg.count_disconnects_to_migrate
	})
}

pub struct LoggedOffCallback {
	result Result
}

fn (mut user SteamUser) handle_logged_off(msg proto.CMsgClientLoggedOff) {
	user.s.dispatch_callback(LoggedOffCallback{
		result: Result(msg.eresult)
	})
}
