module main

import time

import emily33901.vapor

import json
import os

struct Secrets {
	username string
	password string
}

fn pump (mut s vapor.SteamClient) {
		s.connect()

		for {
			s.frame() or {
				panic('$errcode $err')
			}
			time.sleep_ms(1)
	}
}

fn main() {
	mut s := vapor.new_steamclient()
	mut user := s.user()

	go pump(mut s)

	// wait for encrypted
	for !s.connected() {
		println('waiting for steam...')	
		time.sleep_ms(1000)
	}

	ssecrets := os.read_file('secrets.json')?
	secrets := json.decode(Secrets, ssecrets)?

	user.logon(secrets.username, secrets.password)?

	for {
		// wait for stuff to happen i guess
		time.sleep_ms(1000)
	}
}
