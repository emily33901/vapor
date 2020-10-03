module vapor

// Callback represents all the possible callbacks
pub type Callback = ConnectedCallback | DisconnectedCallback | LoggedOffCallback | LoggedOnCallback | AccountInfoCallback

// CallbackHandler lets types handle callbacks
pub interface CallbackHandler {
	handle_callback(cb Callback) ?
}
