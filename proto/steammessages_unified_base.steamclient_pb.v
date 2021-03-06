// Generated by vproto - Do not modify
module proto

import emily33901.vproto
import proto.google.protobuf

[_allow_multiple_values]
enum EProtoExecutionSite {
	k_eprotoexecutionsiteunknown = 0
	k_eprotoexecutionsitesteamclient = 2
}

// FOR INTERNAL USE ONLY
[inline]
fn zzz_vproto_internal_new_eprotoexecutionsite() EProtoExecutionSite {
	return .k_eprotoexecutionsiteunknown
}

// FOR INTERNAL USE ONLY
[inline]
fn zzz_vproto_internal_pack_eprotoexecutionsite(e EProtoExecutionSite, num u32) []byte {
	return vproto.pack_int32_field(int(e), num)
}

// FOR INTERNAL USE ONLY
[inline]
fn zzz_vproto_internal_pack_eprotoexecutionsite_packed(e []EProtoExecutionSite, num u32) []byte {
	x := array{
		data: e.data
		len: e.len
		element_size: e.element_size
		cap: e.cap
	}
	return vproto.pack_int32_field_packed(x, num)
}

// FOR INTERNAL USE ONLY
[inline]
fn zzz_vproto_internal_unpack_eprotoexecutionsite(buf []byte, tag_wiretype vproto.WireType) ?(int, EProtoExecutionSite) {
	i, v := vproto.unpack_int32_field(buf, tag_wiretype) ?
	return i, EProtoExecutionSite(v)
}

// FOR INTERNAL USE ONLY
[inline]
fn zzz_vproto_internal_unpack_eprotoexecutionsite_packed(buf []byte, tag_wiretype vproto.WireType) ?(int, []EProtoExecutionSite) {
	i, v := vproto.unpack_int32_field_packed(buf, tag_wiretype) ?
	return i, array{
		data: v.data
		len: v.len
		cap: v.cap
		element_size: v.element_size
	}
}

pub struct NoResponse {
mut:
	unknown_fields []vproto.UnknownField
}

pub fn (o &NoResponse) pack() []byte {
	res := []byte{}
	return res
}

pub fn noresponse_unpack(buf []byte) ?NoResponse {
	res := zzz_vproto_internal_new_noresponse()
	return res
}

[inline]
pub fn (a NoResponse) eq(b NoResponse) bool {
	return true
}

[inline]
pub fn (a NoResponse) ne(b NoResponse) bool {
	return !a.eq(b)
}

[inline]
pub fn (a []NoResponse) eq(b []NoResponse) bool {
	if a.len != b.len {
		return false
	}
	for i, _ in a {
		if a[i].ne(b[i]) {
			return false
		}
	}
	return true
}

[inline]
pub fn (a []NoResponse) ne(b []NoResponse) bool {
	return !a.eq(b)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_new_noresponse() NoResponse {
	return NoResponse{}
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_pack_noresponse(o NoResponse, num u32) []byte {
	return vproto.pack_message_field(o.pack(), num)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_unpack_noresponse(buf []byte, tag_wiretype vproto.WireType) ?(int, NoResponse) {
	i, v := vproto.unpack_message_field(buf, tag_wiretype) ?
	mut unpacked := noresponse_unpack(v) ?
	return i, unpacked
}
