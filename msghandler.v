module vapor

interface MsgHandler {
	initialise(mut s SteamClient) ?
	handle_msg(m Message) ?
}
