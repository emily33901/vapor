module vapor

import proto
import time

struct HeartbeatFn {
	s &SteamClient
}

fn (mut h HeartbeatFn) run() ?time.Duration {
	msg := proto.CMsgClientHeartBeat{}
	h.s.write_message(0, .client_heart_beat, &msg)?

	if h.s.connected() {
		return h.s.out_of_game_heartbeat_secs
	}

	return none
}
