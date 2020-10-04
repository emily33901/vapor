module vapor

struct ZZZIgnoreMePlease {
}

fn (x ZZZIgnoreMePlease) handle_callback(cb Callback) ? {
	return none
}

fn zzz_ignore_me_im_helping() {
	// Make sure that all the interface name tables
	// are generated so that V doesnt complain
	mut s := &SteamClient(0)
	s.add_callback_handler(&ZZZIgnoreMePlease{})
}