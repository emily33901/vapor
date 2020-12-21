module vapor

// SteamId represents a steamid
pub type SteamId = u64

// default_steamid is the default
// universe 1, type .individual, instance 1, id 0
// steamid
pub const (
	default_steamid = SteamId(76561197960265728)
)

const (
	steamid_universe_mask = 0xFF00000000000000
	steamid_type_mask     = 0x00F0000000000000
	steamid_instance_mask = 0x000FFFFF00000000
	steamid_id_mask       = 0x00000000FFFFFFFF
)

const (
	steamid_universe_shift = 56
	steamid_type_shift     = 52
	steamid_instance_shift = 32
	steamid_id_shift       = 0
)

// steamid creates a SteamId from the u64 given
// it is a workaround for alias type casting being
// a little buggy...
pub fn steamid(x u64) SteamId {
	return SteamId(x)
}

pub fn (s SteamId) u64() u64 {
	return u64(s)
} 

// universe returns the steamid's universe
pub fn (s SteamId) universe() Universe {
	return Universe((s & steamid_universe_mask) >> steamid_universe_shift)
	// return int(byte(s >> 56))
}

// set_universe sets the steamid's universe
pub fn (mut s SteamId) set_universe(uni Universe) {
	mut u := s.u64()
	u &= ~steamid_universe_mask
	u |= ((u64(uni) << steamid_universe_shift) & steamid_universe_mask)
	unsafe { *s = u }
}

// @type returns the steamid's type
pub fn (s SteamId) @type() AccountType {
	return AccountType((s & steamid_type_mask) >> steamid_type_shift)
}

// set_type sets the steamid's type
pub fn (mut s SteamId) set_type(a AccountType) {
	mut u := s.u64()
	u &= ~steamid_type_mask
	u |= ((u64(a) << steamid_type_shift) & steamid_type_mask)
	unsafe { *s = u }
}

// instance returns the steamid's instance
pub fn (s SteamId) instance() int {
	return int((s & steamid_instance_mask) >> steamid_instance_shift)
}

pub fn (mut s SteamId) set_instance(i int) {
	mut u := s.u64()
	u &= ~steamid_instance_mask
	u |= ((u64(i) << steamid_instance_shift) & steamid_instance_mask)
	unsafe { *s = u }
}

// id returns the account id
pub fn (s SteamId) id() u32 {
	return u32((s & steamid_id_mask) >> steamid_id_shift)
}

pub fn (mut s SteamId) set_id(i u32) {
	mut u := s.u64()
	u &= ~steamid_id_mask
	u |= ((u64(i) << steamid_id_shift) & steamid_id_mask)
	unsafe { *s = u }
}
