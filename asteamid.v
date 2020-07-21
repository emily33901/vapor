module vapor

pub type SteamId = u64

const (
	default_steamid = SteamId(76561197960265728)

	steamid_universe_mask = 0xFF00000000000000
	steamid_type_mask     = 0x00F0000000000000
	steamid_instance_mask = 0x000FFFFF00000000
	steamid_id_mask       = 0x00000000FFFFFFFF
)
const (
	steamid_universe_shift = 56
	steamid_type_shift = 52
	steamid_instance_shift = 32
	steamid_id_shift = 0
)

pub fn steamid(x u64) SteamId {
	return SteamId(x)
}

// universe returns the steamids universe
pub fn (s SteamId) universe() Universe {
	return Universe((u64(s) & steamid_universe_mask) >> steamid_universe_shift)
	// return int(byte(u64(s) >> 56))
}

pub fn (mut s SteamId) set_universe(u Universe) {
	// TODO unnecessary to coerce compiler
	unsafe {
		u64(*s) |= ((u64(u) << steamid_universe_shift) & steamid_universe_mask)
	}
}

// @type returns the type
pub fn (s SteamId) @type() AccountType {
	return AccountType((u64(s) & steamid_type_mask) >> steamid_type_shift)
}

pub fn (mut s SteamId) set_type(a AccountType) {
	// TODO unnecessary to coerce compiler
	unsafe {
		u64(*s) |= ((u64(a) << steamid_type_shift) & steamid_type_mask)
	}
}

pub fn (s SteamId) instance() int {
	return int((u64(s) & steamid_instance_mask) >> steamid_instance_shift)
}

// id returns the account id
pub fn (s SteamId) id() u32 {
	return u32((u64(s) & steamid_id_mask) >> steamid_id_shift)
}