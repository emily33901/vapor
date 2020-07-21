module vapor

// TODO maybe move to its own module

// Callback represents all the possible callbacks
pub type Callback = 
	ConnectedCallback | DisconnectedCallback |

	LoggedOnCallback | LoggedOffCallback

// CallbackHandler lets types handle callbacks
pub interface CallbackHandler {
	handle_callback(cb Callback)?
}