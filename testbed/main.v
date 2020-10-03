module main

import time
import emily33901.vapor
import json
import os

struct Secrets {
	username string
	password string
}

struct Testbed {
mut:
	secrets Secrets
	s       &vapor.SteamClient
}

fn new_testbed(secrets Secrets, s &vapor.SteamClient) &Testbed {
	return &Testbed{secrets, s}
}

fn (mut t Testbed) main() ? {
	// no need for ref here because t is already
	// pointer
	t.s.add_callback_handler(t)
	t.s.connect()?
	for {
		t.s.frame() or {
			panic('$errcode $err')
		}
		time.sleep_ms(1)
	}
}

fn (mut t Testbed) handle_callback(cb vapor.Callback) ? {
	mut user := t.s.user()
	match cb {
		vapor.ConnectedCallback {
			println('Connected!')
			user.logon({
				username: t.secrets.username,
				password: t.secrets.password
			})?
		}
		vapor.DisconnectedCallback {
			println('Disconnected!')
			// reconnect
			t.s.connect()?
		}
		vapor.LoggedOnCallback {
			go t.handle_logon(cb)
		}
		vapor.LoggedOffCallback {
			println('Logged off!')
		}
		vapor.AccountInfoCallback {
			println('You are logged in as "$cb.name" from "$cb.country"!')
		}
		// else {
		// println('Unknown callback')
		// }
	}
}

fn (mut t Testbed) handle_logon(cb &vapor.LoggedOnCallback) {
	mut user := t.s.user()
	if cb.result == .ok {
		println('Logged on successfully!')
		time.sleep_ms(5000)
		// NOTE: you probably want to do something here :)
		println('Logging off...')
		user.logoff()
	}
}

fn main() {
	ssecrets := os.read_file('secrets.json')?
	secrets := json.decode(Secrets, ssecrets)?
	mut s := vapor.new_steamclient()
	mut t := new_testbed(secrets, s)
	t.main()?
}
