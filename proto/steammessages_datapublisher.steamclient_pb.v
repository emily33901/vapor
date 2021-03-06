// Generated by vproto - Do not modify
module proto

import emily33901.vproto

pub struct CDataPublisher_ClientContentCorruptionReport_Notification {
mut:
	unknown_fields    []vproto.UnknownField
pub mut:
	appid             u32
	depotid           u32
	download_source   string
	objectid          string
	cellid            u32
	is_manifest       bool
	object_size       u64
	corruption_type   u32
	used_https        bool
	oc_proxy_detected bool
}

pub fn (o &CDataPublisher_ClientContentCorruptionReport_Notification) pack() []byte {
	mut res := []byte{}
	if o.appid != u32(0) {
		res << vproto.pack_uint32_field(o.appid, 1)
	}
	if o.depotid != u32(0) {
		res << vproto.pack_uint32_field(o.depotid, 2)
	}
	if o.download_source != '' {
		res << vproto.pack_string_field(o.download_source, 3)
	}
	if o.objectid != '' {
		res << vproto.pack_string_field(o.objectid, 4)
	}
	if o.cellid != u32(0) {
		res << vproto.pack_uint32_field(o.cellid, 5)
	}
	if o.is_manifest != false {
		res << vproto.pack_bool_field(o.is_manifest, 6)
	}
	if o.object_size != u64(0) {
		res << vproto.pack_uint64_field(o.object_size, 7)
	}
	if o.corruption_type != u32(0) {
		res << vproto.pack_uint32_field(o.corruption_type, 8)
	}
	if o.used_https != false {
		res << vproto.pack_bool_field(o.used_https, 9)
	}
	if o.oc_proxy_detected != false {
		res << vproto.pack_bool_field(o.oc_proxy_detected, 10)
	}
	return res
}

pub fn cdatapublisher_clientcontentcorruptionreport_notification_unpack(buf []byte) ?CDataPublisher_ClientContentCorruptionReport_Notification {
	mut res := zzz_vproto_internal_new_cdatapublisher_clientcontentcorruptionreport_notification()
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
				i, res.download_source = vproto.unpack_string_field(cur_buf, tag_wiretype.wire_type) ?
			}
			4 {
				i, res.objectid = vproto.unpack_string_field(cur_buf, tag_wiretype.wire_type) ?
			}
			5 {
				i, res.cellid = vproto.unpack_uint32_field(cur_buf, tag_wiretype.wire_type) ?
			}
			6 {
				i, res.is_manifest = vproto.unpack_bool_field(cur_buf, tag_wiretype.wire_type) ?
			}
			7 {
				i, res.object_size = vproto.unpack_uint64_field(cur_buf, tag_wiretype.wire_type) ?
			}
			8 {
				i, res.corruption_type = vproto.unpack_uint32_field(cur_buf, tag_wiretype.wire_type) ?
			}
			9 {
				i, res.used_https = vproto.unpack_bool_field(cur_buf, tag_wiretype.wire_type) ?
			}
			10 {
				i, res.oc_proxy_detected = vproto.unpack_bool_field(cur_buf, tag_wiretype.wire_type) ?
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
pub fn (a CDataPublisher_ClientContentCorruptionReport_Notification) eq(b CDataPublisher_ClientContentCorruptionReport_Notification) bool {
	return true && a.appid == b.appid && a.depotid == b.depotid && a.download_source == b.download_source &&
		a.objectid == b.objectid && a.cellid == b.cellid && a.is_manifest == b.is_manifest &&
		a.object_size == b.object_size && a.corruption_type == b.corruption_type && a.used_https == b.used_https &&
		a.oc_proxy_detected == b.oc_proxy_detected
}

[inline]
pub fn (a CDataPublisher_ClientContentCorruptionReport_Notification) ne(b CDataPublisher_ClientContentCorruptionReport_Notification) bool {
	return !a.eq(b)
}

[inline]
pub fn (a []CDataPublisher_ClientContentCorruptionReport_Notification) eq(b []CDataPublisher_ClientContentCorruptionReport_Notification) bool {
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
pub fn (a []CDataPublisher_ClientContentCorruptionReport_Notification) ne(b []CDataPublisher_ClientContentCorruptionReport_Notification) bool {
	return !a.eq(b)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_new_cdatapublisher_clientcontentcorruptionreport_notification() CDataPublisher_ClientContentCorruptionReport_Notification {
	return CDataPublisher_ClientContentCorruptionReport_Notification{}
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_pack_cdatapublisher_clientcontentcorruptionreport_notification(o CDataPublisher_ClientContentCorruptionReport_Notification, num u32) []byte {
	return vproto.pack_message_field(o.pack(), num)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_unpack_cdatapublisher_clientcontentcorruptionreport_notification(buf []byte, tag_wiretype vproto.WireType) ?(int, CDataPublisher_ClientContentCorruptionReport_Notification) {
	i, v := vproto.unpack_message_field(buf, tag_wiretype) ?
	mut unpacked := cdatapublisher_clientcontentcorruptionreport_notification_unpack(v) ?
	return i, unpacked
}

pub struct CValveHWSurvey_GetSurveySchedule_Request {
mut:
	unknown_fields         []vproto.UnknownField
pub mut:
	surveydatetoken        string
	surveydatetokenversion u64
}

pub fn (o &CValveHWSurvey_GetSurveySchedule_Request) pack() []byte {
	mut res := []byte{}
	if o.surveydatetoken != '' {
		res << vproto.pack_string_field(o.surveydatetoken, 1)
	}
	if o.surveydatetokenversion != u64(0) {
		res << vproto.pack_64bit_field(o.surveydatetokenversion, 2)
	}
	return res
}

pub fn cvalvehwsurvey_getsurveyschedule_request_unpack(buf []byte) ?CValveHWSurvey_GetSurveySchedule_Request {
	mut res := zzz_vproto_internal_new_cvalvehwsurvey_getsurveyschedule_request()
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
				i, res.surveydatetoken = vproto.unpack_string_field(cur_buf, tag_wiretype.wire_type) ?
			}
			2 {
				i, res.surveydatetokenversion = vproto.unpack_64bit_field(cur_buf, tag_wiretype.wire_type) ?
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
pub fn (a CValveHWSurvey_GetSurveySchedule_Request) eq(b CValveHWSurvey_GetSurveySchedule_Request) bool {
	return true && a.surveydatetoken == b.surveydatetoken && a.surveydatetokenversion == b.surveydatetokenversion
}

[inline]
pub fn (a CValveHWSurvey_GetSurveySchedule_Request) ne(b CValveHWSurvey_GetSurveySchedule_Request) bool {
	return !a.eq(b)
}

[inline]
pub fn (a []CValveHWSurvey_GetSurveySchedule_Request) eq(b []CValveHWSurvey_GetSurveySchedule_Request) bool {
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
pub fn (a []CValveHWSurvey_GetSurveySchedule_Request) ne(b []CValveHWSurvey_GetSurveySchedule_Request) bool {
	return !a.eq(b)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_new_cvalvehwsurvey_getsurveyschedule_request() CValveHWSurvey_GetSurveySchedule_Request {
	return CValveHWSurvey_GetSurveySchedule_Request{}
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_pack_cvalvehwsurvey_getsurveyschedule_request(o CValveHWSurvey_GetSurveySchedule_Request, num u32) []byte {
	return vproto.pack_message_field(o.pack(), num)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_unpack_cvalvehwsurvey_getsurveyschedule_request(buf []byte, tag_wiretype vproto.WireType) ?(int, CValveHWSurvey_GetSurveySchedule_Request) {
	i, v := vproto.unpack_message_field(buf, tag_wiretype) ?
	mut unpacked := cvalvehwsurvey_getsurveyschedule_request_unpack(v) ?
	return i, unpacked
}

pub struct CValveHWSurvey_GetSurveySchedule_Response {
mut:
	unknown_fields         []vproto.UnknownField
pub mut:
	surveydatetoken        u32
	surveydatetokenversion u64
}

pub fn (o &CValveHWSurvey_GetSurveySchedule_Response) pack() []byte {
	mut res := []byte{}
	if o.surveydatetoken != u32(0) {
		res << vproto.pack_uint32_field(o.surveydatetoken, 1)
	}
	if o.surveydatetokenversion != u64(0) {
		res << vproto.pack_64bit_field(o.surveydatetokenversion, 2)
	}
	return res
}

pub fn cvalvehwsurvey_getsurveyschedule_response_unpack(buf []byte) ?CValveHWSurvey_GetSurveySchedule_Response {
	mut res := zzz_vproto_internal_new_cvalvehwsurvey_getsurveyschedule_response()
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
				i, res.surveydatetoken = vproto.unpack_uint32_field(cur_buf, tag_wiretype.wire_type) ?
			}
			2 {
				i, res.surveydatetokenversion = vproto.unpack_64bit_field(cur_buf, tag_wiretype.wire_type) ?
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
pub fn (a CValveHWSurvey_GetSurveySchedule_Response) eq(b CValveHWSurvey_GetSurveySchedule_Response) bool {
	return true && a.surveydatetoken == b.surveydatetoken && a.surveydatetokenversion == b.surveydatetokenversion
}

[inline]
pub fn (a CValveHWSurvey_GetSurveySchedule_Response) ne(b CValveHWSurvey_GetSurveySchedule_Response) bool {
	return !a.eq(b)
}

[inline]
pub fn (a []CValveHWSurvey_GetSurveySchedule_Response) eq(b []CValveHWSurvey_GetSurveySchedule_Response) bool {
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
pub fn (a []CValveHWSurvey_GetSurveySchedule_Response) ne(b []CValveHWSurvey_GetSurveySchedule_Response) bool {
	return !a.eq(b)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_new_cvalvehwsurvey_getsurveyschedule_response() CValveHWSurvey_GetSurveySchedule_Response {
	return CValveHWSurvey_GetSurveySchedule_Response{}
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_pack_cvalvehwsurvey_getsurveyschedule_response(o CValveHWSurvey_GetSurveySchedule_Response, num u32) []byte {
	return vproto.pack_message_field(o.pack(), num)
}

// FOR INTERNAL USE ONLY
[inline]
pub fn zzz_vproto_internal_unpack_cvalvehwsurvey_getsurveyschedule_response(buf []byte, tag_wiretype vproto.WireType) ?(int, CValveHWSurvey_GetSurveySchedule_Response) {
	i, v := vproto.unpack_message_field(buf, tag_wiretype) ?
	mut unpacked := cvalvehwsurvey_getsurveyschedule_response_unpack(v) ?
	return i, unpacked
}
