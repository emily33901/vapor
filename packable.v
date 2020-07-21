module vapor

// Packable represents a type that can be packed
// to a buffer
pub interface Packable {
	pack() []byte
}
