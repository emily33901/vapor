module vapor

struct SteamFriends {
mut:
	s &SteamClient
}

pub fn (mut f SteamFriends) initialise(mut s SteamClient) ? {
	f.s = s
}

pub fn (mut f SteamFriends) handle_msg(m Message) ? {
}
