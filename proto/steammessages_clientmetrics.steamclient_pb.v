// Generated by vproto - Do not modify
module proto

import emily33901.vproto

[_allow_multiple_values]
enum ESteamPipeWorkType {
	k_esteampipeclientworktype_invalid = 0
	k_esteampipeclientworktype_stagefromchunkstores = 1
}

// FOR INTERNAL USE ONLY
[inline]
fn zzz_vproto_internal_new_esteampipeworktype() ESteamPipeWorkType {
	return .k_esteampipeclientworktype_invalid
}

// FOR INTERNAL USE ONLY
[inline]
fn zzz_vproto_internal_pack_esteampipeworktype(e ESteamPipeWorkType, num u32) []byte {
	return vproto.pack_int32_field(int(e), num)
}

// FOR INTERNAL USE ONLY
[inline]
fn zzz_vproto_internal_pack_esteampipeworktype_packed(e []ESteamPipeWorkType, num u32) []byte {
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
fn zzz_vproto_internal_unpack_esteampipeworktype(buf []byte, tag_wiretype vproto.WireType) ?(int, ESteamPipeWorkType) {
	i, v := vproto.unpack_int32_field(buf, tag_wiretype) ?
	return i, ESteamPipeWorkType(v)
}

// FOR INTERNAL USE ONLY
[inline]
fn zzz_vproto_internal_unpack_esteampipeworktype_packed(buf []byte, tag_wiretype vproto.WireType) ?(int, []ESteamPipeWorkType) {
	i, v := vproto.unpack_int32_field_packed(buf, tag_wiretype) ?
	return i, array{
		data: v.data
		len: v.len
		cap: v.cap
		element_size: v.element_size
	}
}

[_allow_multiple_values]
enum ESteamPipeOperationType {
	k_esteampipeoperationtype_invalid = 0
	k_esteampipeoperationtype_decryptcpu = 1
	k_esteampipeoperationtype_diskread = 2
	k_esteampipeoperationtype_diskwrite = 3
}

// FOR INTERNAL USE ONLY
[inline]
fn zzz_vproto_internal_new_esteampipeoperationtype() ESteamPipeOperationType {
	return .k_esteampipeoperationtype_invalid
}

// FOR INTERNAL USE ONLY
[inline]
fn zzz_vproto_internal_pack_esteampipeoperationtype(e ESteamPipeOperationType, num u32) []byte {
	return vproto.pack_int32_field(int(e), num)
}

// FOR INTERNAL USE ONLY
[inline]
fn zzz_vproto_internal_pack_esteampipeoperationtype_packed(e []ESteamPipeOperationType, num u32) []byte {
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
fn zzz_vproto_internal_unpack_esteampipeoperationtype(buf []byte, tag_wiretype vproto.WireType) ?(int, ESteamPipeOperationType) {
	i, v := vproto.unpack_int32_field(buf, tag_wiretype) ?
	return i, ESteamPipeOperationType(v)
}

// FOR INTERNAL USE ONLY
[inline]
fn zzz_vproto_internal_unpack_esteampipeoperationtype_packed(buf []byte, tag_wiretype vproto.WireType) ?(int, []ESteamPipeOperationType) {
	i, v := vproto.unpack_int32_field_packed(buf, tag_wiretype) ?
	return i, array{
		data: v.data
		len: v.len
		cap: v.cap
		element_size: v.element_size
	}
}

pub struct CClientMetrics_AppInterfaceCreation {
mut:
	unknown_fields           []vproto.UnknownField
pub mut:
	raw_version              string
	requested_interface_type string
}

pub fn (o &CClientMetrics_AppInterfaceCreation) pack() []byte {
	mut res := []byte{}
	if o.raw_version != '' {
		res << vproto.pack_string_field(o.raw_version, 1)
	}
	if o.requested_interface_type != '' {
		res << vproto.pack_string_field(o.requested_interface_type, 2)
	}
	return res
}

pub fn cclientmetrics_appinterfacecreation_unpack(buf []byte) ?CClientMetrics_AppInterfaceCreation {
	mut res := zzz_vproto_internal_new_cclientmetrics_appinterfacecreation()
	mut total := 0
	for total < buf.len {
		mut i := 0
		buf_before_wire_type := buf[total..]
		tag_wiretype := vproto.unpack_tag_wire_type(buf_before_wire_type) or {
			return error('malformed protobuf (couldnt parse tag & wire type)')
		}
		cur_buf := buf_before_wire_type[tag_wiretype.consumed..]
		match tag_wiretype.tag {
			1 {
				i, res.raw_version = vproto.unpack_string_field(cur_buf, tag_wiretype.wire_type) ?
			}
			2 {
				i, res.requested_interface_type = vproto.unpack_string_field(cur_buf,
					tag_wiretype.wire_type) ?
			}
			else {
				ii, v := vproto.unpack_unknown_field(cur_buf, tag_wiretype.wire_type)
				res.unknown_fields <<
					vproto.UnknownField{tag_wiretype.wire_type, tag_wiretype.tag, v}
				i = ii
			}
		}
		if i == 0 {
			return error('malformed protobuf (didnt unpack a field)')
		}
		total += tag_wiretype.consumed + i
	}
	return res
}

[inline]
pub fn (a CClientMetrics_AppInterfaceCreation) eq(b CClientMetrics_AppInterfaceCreation) bool {
	return true && a.raw_version == b.raw_version && a.requested_interface_type == b.requested_interface_type
}

[inline]
pub fn (a CClientMetrics_AppInterfaceCreation) ne(b CClientMetrics_AppInterfaceCreation) bool {
	return !a.eq(b)
}

[inline]
pub fn (a []CClientMetrics_AppInterfaceCreation) eq(b []CClientMetrics_AppInterfaceCreation) bool {
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
pub fn (a []CClientMetrics_AppInterfaceCreation) ne(b []CClientMetrics_AppInterfaceCreation) bool {
	return !a.eq(b)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_new_cclientmetrics_appinterfacecreation() CClientMetrics_AppInterfaceCreation {
	return CClientMetrics_AppInterfaceCreation{}
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_pack_cclientmetrics_appinterfacecreation(o CClientMetrics_AppInterfaceCreation, num u32) []byte {
	return vproto.pack_message_field(o.pack(), num)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_unpack_cclientmetrics_appinterfacecreation(buf []byte, tag_wiretype vproto.WireType) ?(int, CClientMetrics_AppInterfaceCreation) {
	i, v := vproto.unpack_message_field(buf, tag_wiretype) ?
	mut unpacked := cclientmetrics_appinterfacecreation_unpack(v) ?
	return i, unpacked
}

pub struct CClientMetrics_AppInterfaceMethodCounts {
mut:
	unknown_fields []vproto.UnknownField
pub mut:
	interface_name string
	method_name    string
	call_count     u32
}

pub fn (o &CClientMetrics_AppInterfaceMethodCounts) pack() []byte {
	mut res := []byte{}
	if o.interface_name != '' {
		res << vproto.pack_string_field(o.interface_name, 1)
	}
	if o.method_name != '' {
		res << vproto.pack_string_field(o.method_name, 2)
	}
	if o.call_count != u32(0) {
		res << vproto.pack_uint32_field(o.call_count, 3)
	}
	return res
}

pub fn cclientmetrics_appinterfacemethodcounts_unpack(buf []byte) ?CClientMetrics_AppInterfaceMethodCounts {
	mut res := zzz_vproto_internal_new_cclientmetrics_appinterfacemethodcounts()
	mut total := 0
	for total < buf.len {
		mut i := 0
		buf_before_wire_type := buf[total..]
		tag_wiretype := vproto.unpack_tag_wire_type(buf_before_wire_type) or {
			return error('malformed protobuf (couldnt parse tag & wire type)')
		}
		cur_buf := buf_before_wire_type[tag_wiretype.consumed..]
		match tag_wiretype.tag {
			1 {
				i, res.interface_name = vproto.unpack_string_field(cur_buf, tag_wiretype.wire_type) ?
			}
			2 {
				i, res.method_name = vproto.unpack_string_field(cur_buf, tag_wiretype.wire_type) ?
			}
			3 {
				i, res.call_count = vproto.unpack_uint32_field(cur_buf, tag_wiretype.wire_type) ?
			}
			else {
				ii, v := vproto.unpack_unknown_field(cur_buf, tag_wiretype.wire_type)
				res.unknown_fields <<
					vproto.UnknownField{tag_wiretype.wire_type, tag_wiretype.tag, v}
				i = ii
			}
		}
		if i == 0 {
			return error('malformed protobuf (didnt unpack a field)')
		}
		total += tag_wiretype.consumed + i
	}
	return res
}

[inline]
pub fn (a CClientMetrics_AppInterfaceMethodCounts) eq(b CClientMetrics_AppInterfaceMethodCounts) bool {
	return true && a.interface_name == b.interface_name && a.method_name == b.method_name &&
		a.call_count == b.call_count
}

[inline]
pub fn (a CClientMetrics_AppInterfaceMethodCounts) ne(b CClientMetrics_AppInterfaceMethodCounts) bool {
	return !a.eq(b)
}

[inline]
pub fn (a []CClientMetrics_AppInterfaceMethodCounts) eq(b []CClientMetrics_AppInterfaceMethodCounts) bool {
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
pub fn (a []CClientMetrics_AppInterfaceMethodCounts) ne(b []CClientMetrics_AppInterfaceMethodCounts) bool {
	return !a.eq(b)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_new_cclientmetrics_appinterfacemethodcounts() CClientMetrics_AppInterfaceMethodCounts {
	return CClientMetrics_AppInterfaceMethodCounts{}
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_pack_cclientmetrics_appinterfacemethodcounts(o CClientMetrics_AppInterfaceMethodCounts, num u32) []byte {
	return vproto.pack_message_field(o.pack(), num)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_unpack_cclientmetrics_appinterfacemethodcounts(buf []byte, tag_wiretype vproto.WireType) ?(int, CClientMetrics_AppInterfaceMethodCounts) {
	i, v := vproto.unpack_message_field(buf, tag_wiretype) ?
	mut unpacked := cclientmetrics_appinterfacemethodcounts_unpack(v) ?
	return i, unpacked
}

pub struct CClientMetrics_AppInterfaceStats_Notification {
mut:
	unknown_fields         []vproto.UnknownField
pub mut:
	game_id                u64
	interfaces_created     []CClientMetrics_AppInterfaceCreation
	methods_called         []CClientMetrics_AppInterfaceMethodCounts
	session_length_seconds u32
}

pub fn (o &CClientMetrics_AppInterfaceStats_Notification) pack() []byte {
	mut res := []byte{}
	if o.game_id != u64(0) {
		res << vproto.pack_uint64_field(o.game_id, 1)
	}
	// [packed=false]
	for _, x in o.interfaces_created {
		res << zzz_vproto_internal_pack_cclientmetrics_appinterfacecreation(x, 2)
	}
	// [packed=false]
	for _, x in o.methods_called {
		res << zzz_vproto_internal_pack_cclientmetrics_appinterfacemethodcounts(x, 3)
	}
	if o.session_length_seconds != u32(0) {
		res << vproto.pack_uint32_field(o.session_length_seconds, 4)
	}
	return res
}

pub fn cclientmetrics_appinterfacestats_notification_unpack(buf []byte) ?CClientMetrics_AppInterfaceStats_Notification {
	mut res := zzz_vproto_internal_new_cclientmetrics_appinterfacestats_notification()
	mut total := 0
	for total < buf.len {
		mut i := 0
		buf_before_wire_type := buf[total..]
		tag_wiretype := vproto.unpack_tag_wire_type(buf_before_wire_type) or {
			return error('malformed protobuf (couldnt parse tag & wire type)')
		}
		cur_buf := buf_before_wire_type[tag_wiretype.consumed..]
		match tag_wiretype.tag {
			1 {
				i, res.game_id = vproto.unpack_uint64_field(cur_buf, tag_wiretype.wire_type) ?
			}
			2 {
				// [packed=false]
				ii, v := zzz_vproto_internal_unpack_cclientmetrics_appinterfacecreation(cur_buf,
					tag_wiretype.wire_type) ?
				res.interfaces_created << v
				i = ii
			}
			3 {
				// [packed=false]
				ii, v := zzz_vproto_internal_unpack_cclientmetrics_appinterfacemethodcounts(cur_buf,
					tag_wiretype.wire_type) ?
				res.methods_called << v
				i = ii
			}
			4 {
				i, res.session_length_seconds = vproto.unpack_uint32_field(cur_buf, tag_wiretype.wire_type) ?
			}
			else {
				ii, v := vproto.unpack_unknown_field(cur_buf, tag_wiretype.wire_type)
				res.unknown_fields <<
					vproto.UnknownField{tag_wiretype.wire_type, tag_wiretype.tag, v}
				i = ii
			}
		}
		if i == 0 {
			return error('malformed protobuf (didnt unpack a field)')
		}
		total += tag_wiretype.consumed + i
	}
	return res
}

[inline]
pub fn (a CClientMetrics_AppInterfaceStats_Notification) eq(b CClientMetrics_AppInterfaceStats_Notification) bool {
	return true && a.game_id == b.game_id && a.interfaces_created.eq(b.interfaces_created) &&
		a.methods_called.eq(b.methods_called) && a.session_length_seconds == b.session_length_seconds
}

[inline]
pub fn (a CClientMetrics_AppInterfaceStats_Notification) ne(b CClientMetrics_AppInterfaceStats_Notification) bool {
	return !a.eq(b)
}

[inline]
pub fn (a []CClientMetrics_AppInterfaceStats_Notification) eq(b []CClientMetrics_AppInterfaceStats_Notification) bool {
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
pub fn (a []CClientMetrics_AppInterfaceStats_Notification) ne(b []CClientMetrics_AppInterfaceStats_Notification) bool {
	return !a.eq(b)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_new_cclientmetrics_appinterfacestats_notification() CClientMetrics_AppInterfaceStats_Notification {
	return CClientMetrics_AppInterfaceStats_Notification{}
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_pack_cclientmetrics_appinterfacestats_notification(o CClientMetrics_AppInterfaceStats_Notification, num u32) []byte {
	return vproto.pack_message_field(o.pack(), num)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_unpack_cclientmetrics_appinterfacestats_notification(buf []byte, tag_wiretype vproto.WireType) ?(int, CClientMetrics_AppInterfaceStats_Notification) {
	i, v := vproto.unpack_message_field(buf, tag_wiretype) ?
	mut unpacked := cclientmetrics_appinterfacestats_notification_unpack(v) ?
	return i, unpacked
}

pub struct CClientMetrics_IPv6Connectivity_Result {
mut:
	unknown_fields     []vproto.UnknownField
pub mut:
	protocol_tested    u32
	connectivity_state u32
}

pub fn (o &CClientMetrics_IPv6Connectivity_Result) pack() []byte {
	mut res := []byte{}
	if o.protocol_tested != u32(0) {
		res << vproto.pack_uint32_field(o.protocol_tested, 1)
	}
	if o.connectivity_state != u32(0) {
		res << vproto.pack_uint32_field(o.connectivity_state, 2)
	}
	return res
}

pub fn cclientmetrics_ipv6connectivity_result_unpack(buf []byte) ?CClientMetrics_IPv6Connectivity_Result {
	mut res := zzz_vproto_internal_new_cclientmetrics_ipv6connectivity_result()
	mut total := 0
	for total < buf.len {
		mut i := 0
		buf_before_wire_type := buf[total..]
		tag_wiretype := vproto.unpack_tag_wire_type(buf_before_wire_type) or {
			return error('malformed protobuf (couldnt parse tag & wire type)')
		}
		cur_buf := buf_before_wire_type[tag_wiretype.consumed..]
		match tag_wiretype.tag {
			1 {
				i, res.protocol_tested = vproto.unpack_uint32_field(cur_buf, tag_wiretype.wire_type) ?
			}
			2 {
				i, res.connectivity_state = vproto.unpack_uint32_field(cur_buf, tag_wiretype.wire_type) ?
			}
			else {
				ii, v := vproto.unpack_unknown_field(cur_buf, tag_wiretype.wire_type)
				res.unknown_fields <<
					vproto.UnknownField{tag_wiretype.wire_type, tag_wiretype.tag, v}
				i = ii
			}
		}
		if i == 0 {
			return error('malformed protobuf (didnt unpack a field)')
		}
		total += tag_wiretype.consumed + i
	}
	return res
}

[inline]
pub fn (a CClientMetrics_IPv6Connectivity_Result) eq(b CClientMetrics_IPv6Connectivity_Result) bool {
	return true && a.protocol_tested == b.protocol_tested && a.connectivity_state == b.connectivity_state
}

[inline]
pub fn (a CClientMetrics_IPv6Connectivity_Result) ne(b CClientMetrics_IPv6Connectivity_Result) bool {
	return !a.eq(b)
}

[inline]
pub fn (a []CClientMetrics_IPv6Connectivity_Result) eq(b []CClientMetrics_IPv6Connectivity_Result) bool {
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
pub fn (a []CClientMetrics_IPv6Connectivity_Result) ne(b []CClientMetrics_IPv6Connectivity_Result) bool {
	return !a.eq(b)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_new_cclientmetrics_ipv6connectivity_result() CClientMetrics_IPv6Connectivity_Result {
	return CClientMetrics_IPv6Connectivity_Result{}
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_pack_cclientmetrics_ipv6connectivity_result(o CClientMetrics_IPv6Connectivity_Result, num u32) []byte {
	return vproto.pack_message_field(o.pack(), num)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_unpack_cclientmetrics_ipv6connectivity_result(buf []byte, tag_wiretype vproto.WireType) ?(int, CClientMetrics_IPv6Connectivity_Result) {
	i, v := vproto.unpack_message_field(buf, tag_wiretype) ?
	mut unpacked := cclientmetrics_ipv6connectivity_result_unpack(v) ?
	return i, unpacked
}

pub struct CClientMetrics_IPv6Connectivity_Notification {
mut:
	unknown_fields        []vproto.UnknownField
pub mut:
	cell_id               u32
	results               []CClientMetrics_IPv6Connectivity_Result
	private_ip_is_rfc6598 bool
}

pub fn (o &CClientMetrics_IPv6Connectivity_Notification) pack() []byte {
	mut res := []byte{}
	if o.cell_id != u32(0) {
		res << vproto.pack_uint32_field(o.cell_id, 1)
	}
	// [packed=false]
	for _, x in o.results {
		res << zzz_vproto_internal_pack_cclientmetrics_ipv6connectivity_result(x, 2)
	}
	if o.private_ip_is_rfc6598 != false {
		res << vproto.pack_bool_field(o.private_ip_is_rfc6598, 3)
	}
	return res
}

pub fn cclientmetrics_ipv6connectivity_notification_unpack(buf []byte) ?CClientMetrics_IPv6Connectivity_Notification {
	mut res := zzz_vproto_internal_new_cclientmetrics_ipv6connectivity_notification()
	mut total := 0
	for total < buf.len {
		mut i := 0
		buf_before_wire_type := buf[total..]
		tag_wiretype := vproto.unpack_tag_wire_type(buf_before_wire_type) or {
			return error('malformed protobuf (couldnt parse tag & wire type)')
		}
		cur_buf := buf_before_wire_type[tag_wiretype.consumed..]
		match tag_wiretype.tag {
			1 {
				i, res.cell_id = vproto.unpack_uint32_field(cur_buf, tag_wiretype.wire_type) ?
			}
			2 {
				// [packed=false]
				ii, v := zzz_vproto_internal_unpack_cclientmetrics_ipv6connectivity_result(cur_buf,
					tag_wiretype.wire_type) ?
				res.results << v
				i = ii
			}
			3 {
				i, res.private_ip_is_rfc6598 = vproto.unpack_bool_field(cur_buf, tag_wiretype.wire_type) ?
			}
			else {
				ii, v := vproto.unpack_unknown_field(cur_buf, tag_wiretype.wire_type)
				res.unknown_fields <<
					vproto.UnknownField{tag_wiretype.wire_type, tag_wiretype.tag, v}
				i = ii
			}
		}
		if i == 0 {
			return error('malformed protobuf (didnt unpack a field)')
		}
		total += tag_wiretype.consumed + i
	}
	return res
}

[inline]
pub fn (a CClientMetrics_IPv6Connectivity_Notification) eq(b CClientMetrics_IPv6Connectivity_Notification) bool {
	return true && a.cell_id == b.cell_id && a.results.eq(b.results) && a.private_ip_is_rfc6598 ==
		b.private_ip_is_rfc6598
}

[inline]
pub fn (a CClientMetrics_IPv6Connectivity_Notification) ne(b CClientMetrics_IPv6Connectivity_Notification) bool {
	return !a.eq(b)
}

[inline]
pub fn (a []CClientMetrics_IPv6Connectivity_Notification) eq(b []CClientMetrics_IPv6Connectivity_Notification) bool {
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
pub fn (a []CClientMetrics_IPv6Connectivity_Notification) ne(b []CClientMetrics_IPv6Connectivity_Notification) bool {
	return !a.eq(b)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_new_cclientmetrics_ipv6connectivity_notification() CClientMetrics_IPv6Connectivity_Notification {
	return CClientMetrics_IPv6Connectivity_Notification{}
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_pack_cclientmetrics_ipv6connectivity_notification(o CClientMetrics_IPv6Connectivity_Notification, num u32) []byte {
	return vproto.pack_message_field(o.pack(), num)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_unpack_cclientmetrics_ipv6connectivity_notification(buf []byte, tag_wiretype vproto.WireType) ?(int, CClientMetrics_IPv6Connectivity_Notification) {
	i, v := vproto.unpack_message_field(buf, tag_wiretype) ?
	mut unpacked := cclientmetrics_ipv6connectivity_notification_unpack(v) ?
	return i, unpacked
}

pub struct CClientMetrics_SteamPipeWorkStats_Operation {
mut:
	unknown_fields   []vproto.UnknownField
pub mut:
	@type            ESteamPipeOperationType = .k_esteampipeoperationtype_invalid
	num_ops          u32
	num_bytes        u64
	busy_time_ms     u64
	idle_time_ms     u64
	sum_run_time_ms  u64
	sum_wait_time_ms u64
}

pub fn (o &CClientMetrics_SteamPipeWorkStats_Operation) pack() []byte {
	mut res := []byte{}
	if o.@type != zzz_vproto_internal_new_esteampipeoperationtype() {
		res << zzz_vproto_internal_pack_esteampipeoperationtype(o.@type, 1)
	}
	if o.num_ops != u32(0) {
		res << vproto.pack_uint32_field(o.num_ops, 2)
	}
	if o.num_bytes != u64(0) {
		res << vproto.pack_uint64_field(o.num_bytes, 3)
	}
	if o.busy_time_ms != u64(0) {
		res << vproto.pack_uint64_field(o.busy_time_ms, 4)
	}
	if o.idle_time_ms != u64(0) {
		res << vproto.pack_uint64_field(o.idle_time_ms, 5)
	}
	if o.sum_run_time_ms != u64(0) {
		res << vproto.pack_uint64_field(o.sum_run_time_ms, 6)
	}
	if o.sum_wait_time_ms != u64(0) {
		res << vproto.pack_uint64_field(o.sum_wait_time_ms, 7)
	}
	return res
}

pub fn cclientmetrics_steampipeworkstats_operation_unpack(buf []byte) ?CClientMetrics_SteamPipeWorkStats_Operation {
	mut res := zzz_vproto_internal_new_cclientmetrics_steampipeworkstats_operation()
	mut total := 0
	for total < buf.len {
		mut i := 0
		buf_before_wire_type := buf[total..]
		tag_wiretype := vproto.unpack_tag_wire_type(buf_before_wire_type) or {
			return error('malformed protobuf (couldnt parse tag & wire type)')
		}
		cur_buf := buf_before_wire_type[tag_wiretype.consumed..]
		match tag_wiretype.tag {
			1 {
				i, res.@type = zzz_vproto_internal_unpack_esteampipeoperationtype(cur_buf,
					tag_wiretype.wire_type) ?
			}
			2 {
				i, res.num_ops = vproto.unpack_uint32_field(cur_buf, tag_wiretype.wire_type) ?
			}
			3 {
				i, res.num_bytes = vproto.unpack_uint64_field(cur_buf, tag_wiretype.wire_type) ?
			}
			4 {
				i, res.busy_time_ms = vproto.unpack_uint64_field(cur_buf, tag_wiretype.wire_type) ?
			}
			5 {
				i, res.idle_time_ms = vproto.unpack_uint64_field(cur_buf, tag_wiretype.wire_type) ?
			}
			6 {
				i, res.sum_run_time_ms = vproto.unpack_uint64_field(cur_buf, tag_wiretype.wire_type) ?
			}
			7 {
				i, res.sum_wait_time_ms = vproto.unpack_uint64_field(cur_buf, tag_wiretype.wire_type) ?
			}
			else {
				ii, v := vproto.unpack_unknown_field(cur_buf, tag_wiretype.wire_type)
				res.unknown_fields <<
					vproto.UnknownField{tag_wiretype.wire_type, tag_wiretype.tag, v}
				i = ii
			}
		}
		if i == 0 {
			return error('malformed protobuf (didnt unpack a field)')
		}
		total += tag_wiretype.consumed + i
	}
	return res
}

[inline]
pub fn (a CClientMetrics_SteamPipeWorkStats_Operation) eq(b CClientMetrics_SteamPipeWorkStats_Operation) bool {
	return true && a.@type == b.@type && a.num_ops == b.num_ops && a.num_bytes == b.num_bytes &&
		a.busy_time_ms == b.busy_time_ms && a.idle_time_ms == b.idle_time_ms && a.sum_run_time_ms == b.sum_run_time_ms &&
		a.sum_wait_time_ms == b.sum_wait_time_ms
}

[inline]
pub fn (a CClientMetrics_SteamPipeWorkStats_Operation) ne(b CClientMetrics_SteamPipeWorkStats_Operation) bool {
	return !a.eq(b)
}

[inline]
pub fn (a []CClientMetrics_SteamPipeWorkStats_Operation) eq(b []CClientMetrics_SteamPipeWorkStats_Operation) bool {
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
pub fn (a []CClientMetrics_SteamPipeWorkStats_Operation) ne(b []CClientMetrics_SteamPipeWorkStats_Operation) bool {
	return !a.eq(b)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_new_cclientmetrics_steampipeworkstats_operation() CClientMetrics_SteamPipeWorkStats_Operation {
	return CClientMetrics_SteamPipeWorkStats_Operation{}
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_pack_cclientmetrics_steampipeworkstats_operation(o CClientMetrics_SteamPipeWorkStats_Operation, num u32) []byte {
	return vproto.pack_message_field(o.pack(), num)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_unpack_cclientmetrics_steampipeworkstats_operation(buf []byte, tag_wiretype vproto.WireType) ?(int, CClientMetrics_SteamPipeWorkStats_Operation) {
	i, v := vproto.unpack_message_field(buf, tag_wiretype) ?
	mut unpacked := cclientmetrics_steampipeworkstats_operation_unpack(v) ?
	return i, unpacked
}

pub struct CClientMetrics_SteamPipeWorkStats_Notification {
mut:
	unknown_fields []vproto.UnknownField
pub mut:
	appid          u32
	depotid        u32
	work_type      ESteamPipeWorkType = .k_esteampipeclientworktype_invalid
	operations     []CClientMetrics_SteamPipeWorkStats_Operation
}

pub fn (o &CClientMetrics_SteamPipeWorkStats_Notification) pack() []byte {
	mut res := []byte{}
	if o.appid != u32(0) {
		res << vproto.pack_uint32_field(o.appid, 1)
	}
	if o.depotid != u32(0) {
		res << vproto.pack_uint32_field(o.depotid, 2)
	}
	if o.work_type != zzz_vproto_internal_new_esteampipeworktype() {
		res << zzz_vproto_internal_pack_esteampipeworktype(o.work_type, 3)
	}
	// [packed=false]
	for _, x in o.operations {
		res <<
			zzz_vproto_internal_pack_cclientmetrics_steampipeworkstats_operation(x, 4)
	}
	return res
}

pub fn cclientmetrics_steampipeworkstats_notification_unpack(buf []byte) ?CClientMetrics_SteamPipeWorkStats_Notification {
	mut res := zzz_vproto_internal_new_cclientmetrics_steampipeworkstats_notification()
	mut total := 0
	for total < buf.len {
		mut i := 0
		buf_before_wire_type := buf[total..]
		tag_wiretype := vproto.unpack_tag_wire_type(buf_before_wire_type) or {
			return error('malformed protobuf (couldnt parse tag & wire type)')
		}
		cur_buf := buf_before_wire_type[tag_wiretype.consumed..]
		match tag_wiretype.tag {
			1 {
				i, res.appid = vproto.unpack_uint32_field(cur_buf, tag_wiretype.wire_type) ?
			}
			2 {
				i, res.depotid = vproto.unpack_uint32_field(cur_buf, tag_wiretype.wire_type) ?
			}
			3 {
				i, res.work_type = zzz_vproto_internal_unpack_esteampipeworktype(cur_buf,
					tag_wiretype.wire_type) ?
			}
			4 {
				// [packed=false]
				ii, v := zzz_vproto_internal_unpack_cclientmetrics_steampipeworkstats_operation(cur_buf,
					tag_wiretype.wire_type) ?
				res.operations << v
				i = ii
			}
			else {
				ii, v := vproto.unpack_unknown_field(cur_buf, tag_wiretype.wire_type)
				res.unknown_fields <<
					vproto.UnknownField{tag_wiretype.wire_type, tag_wiretype.tag, v}
				i = ii
			}
		}
		if i == 0 {
			return error('malformed protobuf (didnt unpack a field)')
		}
		total += tag_wiretype.consumed + i
	}
	return res
}

[inline]
pub fn (a CClientMetrics_SteamPipeWorkStats_Notification) eq(b CClientMetrics_SteamPipeWorkStats_Notification) bool {
	return true && a.appid == b.appid && a.depotid == b.depotid && a.work_type == b.work_type &&
		a.operations.eq(b.operations)
}

[inline]
pub fn (a CClientMetrics_SteamPipeWorkStats_Notification) ne(b CClientMetrics_SteamPipeWorkStats_Notification) bool {
	return !a.eq(b)
}

[inline]
pub fn (a []CClientMetrics_SteamPipeWorkStats_Notification) eq(b []CClientMetrics_SteamPipeWorkStats_Notification) bool {
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
pub fn (a []CClientMetrics_SteamPipeWorkStats_Notification) ne(b []CClientMetrics_SteamPipeWorkStats_Notification) bool {
	return !a.eq(b)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_new_cclientmetrics_steampipeworkstats_notification() CClientMetrics_SteamPipeWorkStats_Notification {
	return CClientMetrics_SteamPipeWorkStats_Notification{}
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_pack_cclientmetrics_steampipeworkstats_notification(o CClientMetrics_SteamPipeWorkStats_Notification, num u32) []byte {
	return vproto.pack_message_field(o.pack(), num)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_unpack_cclientmetrics_steampipeworkstats_notification(buf []byte, tag_wiretype vproto.WireType) ?(int, CClientMetrics_SteamPipeWorkStats_Notification) {
	i, v := vproto.unpack_message_field(buf, tag_wiretype) ?
	mut unpacked := cclientmetrics_steampipeworkstats_notification_unpack(v) ?
	return i, unpacked
}

pub struct CClientMetrics_ReportClientError_Notification_Error {
mut:
	unknown_fields []vproto.UnknownField
pub mut:
	identifier     string
	message        string
	count          u32
}

pub fn (o &CClientMetrics_ReportClientError_Notification_Error) pack() []byte {
	mut res := []byte{}
	if o.identifier != '' {
		res << vproto.pack_string_field(o.identifier, 1)
	}
	if o.message != '' {
		res << vproto.pack_string_field(o.message, 2)
	}
	if o.count != u32(0) {
		res << vproto.pack_uint32_field(o.count, 3)
	}
	return res
}

pub fn cclientmetrics_reportclienterror_notification_error_unpack(buf []byte) ?CClientMetrics_ReportClientError_Notification_Error {
	mut res := zzz_vproto_internal_new_cclientmetrics_reportclienterror_notification_error()
	mut total := 0
	for total < buf.len {
		mut i := 0
		buf_before_wire_type := buf[total..]
		tag_wiretype := vproto.unpack_tag_wire_type(buf_before_wire_type) or {
			return error('malformed protobuf (couldnt parse tag & wire type)')
		}
		cur_buf := buf_before_wire_type[tag_wiretype.consumed..]
		match tag_wiretype.tag {
			1 {
				i, res.identifier = vproto.unpack_string_field(cur_buf, tag_wiretype.wire_type) ?
			}
			2 {
				i, res.message = vproto.unpack_string_field(cur_buf, tag_wiretype.wire_type) ?
			}
			3 {
				i, res.count = vproto.unpack_uint32_field(cur_buf, tag_wiretype.wire_type) ?
			}
			else {
				ii, v := vproto.unpack_unknown_field(cur_buf, tag_wiretype.wire_type)
				res.unknown_fields <<
					vproto.UnknownField{tag_wiretype.wire_type, tag_wiretype.tag, v}
				i = ii
			}
		}
		if i == 0 {
			return error('malformed protobuf (didnt unpack a field)')
		}
		total += tag_wiretype.consumed + i
	}
	return res
}

[inline]
pub fn (a CClientMetrics_ReportClientError_Notification_Error) eq(b CClientMetrics_ReportClientError_Notification_Error) bool {
	return true && a.identifier == b.identifier && a.message == b.message && a.count == b.count
}

[inline]
pub fn (a CClientMetrics_ReportClientError_Notification_Error) ne(b CClientMetrics_ReportClientError_Notification_Error) bool {
	return !a.eq(b)
}

[inline]
pub fn (a []CClientMetrics_ReportClientError_Notification_Error) eq(b []CClientMetrics_ReportClientError_Notification_Error) bool {
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
pub fn (a []CClientMetrics_ReportClientError_Notification_Error) ne(b []CClientMetrics_ReportClientError_Notification_Error) bool {
	return !a.eq(b)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_new_cclientmetrics_reportclienterror_notification_error() CClientMetrics_ReportClientError_Notification_Error {
	return CClientMetrics_ReportClientError_Notification_Error{}
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_pack_cclientmetrics_reportclienterror_notification_error(o CClientMetrics_ReportClientError_Notification_Error, num u32) []byte {
	return vproto.pack_message_field(o.pack(), num)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_unpack_cclientmetrics_reportclienterror_notification_error(buf []byte, tag_wiretype vproto.WireType) ?(int, CClientMetrics_ReportClientError_Notification_Error) {
	i, v := vproto.unpack_message_field(buf, tag_wiretype) ?
	mut unpacked := cclientmetrics_reportclienterror_notification_error_unpack(v) ?
	return i, unpacked
}

pub struct CClientMetrics_ReportClientError_Notification {
mut:
	unknown_fields []vproto.UnknownField
pub mut:
	product        string
	version        string
	errors         []CClientMetrics_ReportClientError_Notification_Error
}

pub fn (o &CClientMetrics_ReportClientError_Notification) pack() []byte {
	mut res := []byte{}
	if o.product != '' {
		res << vproto.pack_string_field(o.product, 1)
	}
	if o.version != '' {
		res << vproto.pack_string_field(o.version, 2)
	}
	// [packed=false]
	for _, x in o.errors {
		res <<
			zzz_vproto_internal_pack_cclientmetrics_reportclienterror_notification_error(x, 3)
	}
	return res
}

pub fn cclientmetrics_reportclienterror_notification_unpack(buf []byte) ?CClientMetrics_ReportClientError_Notification {
	mut res := zzz_vproto_internal_new_cclientmetrics_reportclienterror_notification()
	mut total := 0
	for total < buf.len {
		mut i := 0
		buf_before_wire_type := buf[total..]
		tag_wiretype := vproto.unpack_tag_wire_type(buf_before_wire_type) or {
			return error('malformed protobuf (couldnt parse tag & wire type)')
		}
		cur_buf := buf_before_wire_type[tag_wiretype.consumed..]
		match tag_wiretype.tag {
			1 {
				i, res.product = vproto.unpack_string_field(cur_buf, tag_wiretype.wire_type) ?
			}
			2 {
				i, res.version = vproto.unpack_string_field(cur_buf, tag_wiretype.wire_type) ?
			}
			3 {
				// [packed=false]
				ii, v := zzz_vproto_internal_unpack_cclientmetrics_reportclienterror_notification_error(cur_buf,
					tag_wiretype.wire_type) ?
				res.errors << v
				i = ii
			}
			else {
				ii, v := vproto.unpack_unknown_field(cur_buf, tag_wiretype.wire_type)
				res.unknown_fields <<
					vproto.UnknownField{tag_wiretype.wire_type, tag_wiretype.tag, v}
				i = ii
			}
		}
		if i == 0 {
			return error('malformed protobuf (didnt unpack a field)')
		}
		total += tag_wiretype.consumed + i
	}
	return res
}

[inline]
pub fn (a CClientMetrics_ReportClientError_Notification) eq(b CClientMetrics_ReportClientError_Notification) bool {
	return true && a.product == b.product && a.version == b.version && a.errors.eq(b.errors)
}

[inline]
pub fn (a CClientMetrics_ReportClientError_Notification) ne(b CClientMetrics_ReportClientError_Notification) bool {
	return !a.eq(b)
}

[inline]
pub fn (a []CClientMetrics_ReportClientError_Notification) eq(b []CClientMetrics_ReportClientError_Notification) bool {
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
pub fn (a []CClientMetrics_ReportClientError_Notification) ne(b []CClientMetrics_ReportClientError_Notification) bool {
	return !a.eq(b)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_new_cclientmetrics_reportclienterror_notification() CClientMetrics_ReportClientError_Notification {
	return CClientMetrics_ReportClientError_Notification{}
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_pack_cclientmetrics_reportclienterror_notification(o CClientMetrics_ReportClientError_Notification, num u32) []byte {
	return vproto.pack_message_field(o.pack(), num)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_unpack_cclientmetrics_reportclienterror_notification(buf []byte, tag_wiretype vproto.WireType) ?(int, CClientMetrics_ReportClientError_Notification) {
	i, v := vproto.unpack_message_field(buf, tag_wiretype) ?
	mut unpacked := cclientmetrics_reportclienterror_notification_unpack(v) ?
	return i, unpacked
}
