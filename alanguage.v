module vapor

#include "@VROOT/pack_helper.h"

enum Universe {
	invalid = 0
	public = 1
	beta = 2
	internal = 3
	dev = 4
	rc = 5 // obsolete - universe no longer exists
	// max = 5
}

enum ChatEntryType {
	invalid = 0
	chat_msg = 1
	typing = 2
	invite_game = 3
	emote = 4
	lobby_game_start = 5
	left_conversation = 6
	entered = 7
	was_kicked = 8
	was_banned = 9
	disconnected = 10
}

enum PersonaState {
	offline = 0
	online = 1
	busy = 2
	away = 3
	snooze = 4
	looking_to_trade = 5
	looking_to_play = 6
	// max = 7
}

enum AccountType {
	invalid = 0
	individual = 1
	multiseat = 2
	game_server = 3
	anon_game_server = 4
	pending = 5
	content_server = 6
	clan = 7
	chat = 8
	console_user = 9
	anon_user = 10
	max = 11
}

enum FriendRelationship {
	none_ = 0
	blocked = 1
	// pending_invitee = 2// obsolete - renamed to request_recipient
	request_recipient = 2
	friend = 3
	request_initiator = 4
	// pending_inviter = 4// obsolete - renamed to request_initiator
	ignored = 5
	ignored_friend = 6
	suggested_friend = 7
	max = 8
}

enum AccountFlags {
	normal_user = 0
	persona_name_set = 1
	unbannable = 2
	password_set = 4
	support = 8
	admin = 16
	supervisor = 32
	app_editor = 64
	hwidset = 128
	personal_qaset = 256
	vac_beta = 512
	debug = 1024
	disabled = 2048
	limited_user = 4096
	limited_user_force = 8192
	email_validated = 16384
	marketing_treatment = 32768
	ogginvite_opt_out = 65536
	force_password_change = 131072
	force_email_verification = 262144
	logon_extra_security = 524288
	logon_extra_security_disabled = 1048576
}

enum EClanPermission {
	nobody = 0
	owner = 1
	officer = 2
	owner_and_officer = 3
	member = 4
	moderator = 8
}

enum EChatPermission {
	close = 1
	invite = 2
	talk = 8
	kick = 16
	mute = 32
	set_metadata = 64
	change_permissions = 128
	ban = 256
	change_access = 512
	// everyone_not_in_clan_default = 8
	// everyone_default = 10
	// member_default = 282
	// officer_default = 282
	// owner_default = 891
	// mask = 1019
}

enum EFriendFlags {
	none_ = 0
	blocked = 1
	friendship_requested = 2
	immediate = 4
	clan_member = 8
	// game_server = 16// obsolete - renamed to on_game_server
	on_game_server = 16
	requesting_friendship = 128
	requesting_info = 256
	ignored = 512
	ignored_friend = 1024
	flag_all = 65535
}

enum EClientPersonaStateFlag {
	status = 1
	player_name = 2
	query_port = 4
	source_id = 8
	presence = 16
	metadata = 32
	last_seen = 64
	clan_info = 128
	game_extra_info = 256
	game_data_blob = 512
	clan_tag = 1024
	facebook = 2048
}

enum EAppUsageEvent {
	game_launch = 1
	game_launch_trial = 2
	media = 3
	preload_start = 4
	preload_finish = 5
	marketing_message_view = 6
	in_game_ad_viewed = 7
	game_launch_free_weekend = 8
}

enum ELicenseFlags {
	none_ = 0
	renew = 0x01
	renewal_failed = 0x02
	pending = 0x04
	expired = 0x08
	cancelled_by_user = 0x10
	cancelled_by_admin = 0x20
	low_violence_content = 0x40
	imported_from_steam2 = 0x80
}

enum ELicenseType {
	no_license = 0
	single_purchase = 1
	single_purchase_limited_use = 2
	recurring_charge = 3
	recurring_charge_limited_use = 4
	recurring_charge_limited_use_with_overages = 5
	recurring_option = 6
}

enum EPaymentMethod {
	none_ = 0
	activation_code = 1
	credit_card = 2
	giropay = 3
	pay_pal = 4
	ideal = 5
	pay_safe_card = 6
	sofort = 7
	guest_pass = 8
	web_money = 9
	money_bookers = 10
	ali_pay = 11
	yandex = 12
	kiosk = 13
	qiwi = 14
	game_stop = 15
	hardware_promo = 16
	mo_pay = 17
	boleto_bancario = 18
	boa_compra_gold = 19
	banco_do_brasil_online = 20
	itau_online = 21
	bradesco_online = 22
	pagseguro = 23
	visa_brazil = 24
	amex_brazil = 25
	aura = 26
	hipercard = 27
	mastercard_brazil = 28
	diners_card_brazil = 29
	click_and_buy = 32
	auto_grant = 64
	wallet = 128
	valve = 129
	oemticket = 256
	split = 512
	complimentary = 1024
}

enum EIntroducerRouting {
	file_share = 0 // obsolete
	p2pvoice_chat = 1
	p2pnetworking = 2
}

enum EServerFlags {
	none_ = 0
	active = 1
	secure = 2
	dedicated = 4
	linux = 8
	passworded = 16
	private = 32
}

enum EDenyReason {
	invalid_version = 1
	generic = 2
	not_logged_on = 3
	no_license = 4
	cheater = 5
	logged_in_else_where = 6
	unknown_text = 7
	incompatible_anticheat = 8
	memory_corruption = 9
	incompatible_software = 10
	steam_connection_lost = 11
	steam_connection_error = 12
	steam_response_timed_out = 13
	steam_validation_stalled = 14
	steam_owner_left_guest_user = 15
}

enum EClanRank {
	none_ = 0
	owner = 1
	officer = 2
	member = 3
	moderator = 4
}

enum EClanRelationship {
	none_ = 0
	blocked = 1
	invited = 2
	member = 3
	kicked = 4
	kick_acknowledged = 5
}

enum EAuthSessionResponse {
	ok = 0
	user_not_connected_to_steam = 1
	no_license_or_expired = 2
	vacbanned = 3
	logged_in_else_where = 4
	vaccheck_timed_out = 5
	auth_ticket_canceled = 6
	auth_ticket_invalid_already_used = 7
	auth_ticket_invalid = 8
}

enum EChatRoomEnterResponse {
	success = 1
	doesnt_exist = 2
	not_allowed = 3
	full = 4
	error = 5
	banned = 6
	limited = 7
	clan_disabled = 8
	community_ban = 9
	member_blocked_you = 10
	you_blocked_member = 11
	no_ranking_data_lobby = 12
	no_ranking_data_user = 13
	rank_out_of_range = 14
}

enum EChatRoomType {
	friend = 1
	muc = 2
	lobby = 3
}

enum EChatInfoType {
	state_change = 1
	info_update = 2
	member_limit_change = 3
}

enum EChatAction {
	invite_chat = 1
	kick = 2
	ban = 3
	un_ban = 4
	start_voice_speak = 5
	end_voice_speak = 6
	lock_chat = 7
	unlock_chat = 8
	close_chat = 9
	set_joinable = 10
	set_unjoinable = 11
	set_owner = 12
	set_invisible_to_friends = 13
	set_visible_to_friends = 14
	set_moderated = 15
	set_unmoderated = 16
}

enum EChatActionResult {
	success = 1
	error = 2
	not_permitted = 3
	not_allowed_on_clan_member = 4
	not_allowed_on_banned_user = 5
	not_allowed_on_chat_owner = 6
	not_allowed_on_self = 7
	chat_doesnt_exist = 8
	chat_full = 9
	voice_slots_full = 10
}

enum EAppInfoSection {
	unknown = 0
	all = 1
	// first = 2
	common = 2
	extended = 3
	config = 4
	stats = 5
	install = 6
	depots = 7
	vac = 8
	drm = 9
	ufs = 10
	ogg = 11
	items_unused = 12
	policies = 13
	sys_reqs = 14
	community = 15
	max = 16
}

enum EContentDownloadSourceType {
	invalid = 0
	cs = 1
	cdn = 2
	lcs = 3
	// proxy = 4// obsolete - renamed to proxy_cache
	proxy_cache = 4
	max = 5
}

enum EPlatformType {
	unknown = 0
	win32 = 1
	win64 = 2
	linux = 3
	osx = 4
	ps3 = 5
	max = 6
}

enum EOSType {
	unknown = -1
	umq = -400
	ps3 = -300
	mac_osunknown = -102
	mac_os104 = -101
	mac_os105 = -100
	mac_os1058 = -99
	mac_os106 = -95
	mac_os1063 = -94
	mac_os1064_slgu = -93
	mac_os1067 = -92
	mac_os107 = -90
	mac_os108 = -89
	mac_os109 = -88
	linux_unknown = -203
	linux22 = -202
	linux24 = -201
	linux26 = -200
	linux32 = -199
	win_unknown = 0
	win311 = 1
	win95 = 2
	win98 = 3
	win_me = 4
	win_nt = 5
	win200 = 6
	win_xp = 7
	win2003 = 8
	win_vista = 9
	win7 = 10
	win2008 = 11
	windows8 = 12
	win_max = 13
	max = 24
}

enum EServerType {
	invalid = -1
	// first = 0
	shell = 0
	gm = 1
	bum = 2
	am = 3
	bs = 4
	vs = 5
	ats = 6
	cm = 7
	fbs = 8
	// fg = 9// obsolete - renamed to box_monitor
	box_monitor = 9
	ss = 10
	drms = 11
	// hub_obsolete = 12// obsolete
	console = 13
	// asbobsolete = 14// obsolete
	pics = 14
	client = 15
	bootstrap_obsolete = 16// obsolete
	dp = 17
	wg = 18
	sm = 19
	ufs = 21
	util = 23
	// dss = 24// obsolete - renamed to community
	community = 24
	p2prelay_obsolete = 25// obsolete
	app_information = 26
	spare = 27
	fts = 28
	epm = 29
	ps = 30
	@is = 31
	ccs = 32
	dfs = 33
	lbs = 34
	mds = 35
	cs = 36
	gc = 37
	ns = 38
	ogs = 39
	web_api = 40
	uds = 41
	mms = 42
	gms = 43
	kgs = 44
	ucm = 45
	rm = 46
	fs = 47
	econ = 48
	backpack = 49
	ugs = 50
	store = 51
	money_stats = 52
	cre = 53
	umq = 54
	workshop = 55
	brp = 56
	gch = 57
	mpas = 58
	trade = 59
	secrets = 60
	logsink = 61
	market = 62
	quest = 63
	wds = 64
	max = 65
}

enum EBillingType {
	no_cost = 0
	bill_once_only = 1
	bill_monthly = 2
	proof_of_prepurchase_only = 3
	guest_pass = 4
	hardware_promo = 5
	gift = 6
	auto_grant = 7
	oemticket = 8
	num_billing_types = 9
}

enum EActivationCodeClass {
	won_cdkey = 0
	valve_cdkey = 1
	doom3cdkey = 2
	dblookup = 3
	steam2010key = 4
	max = 5
	test = 2147483647
	invalid = -1
}

enum EChatMemberStateChange {
	entered = 0x01
	left = 0x02
	disconnected = 0x04
	kicked = 0x08
	banned = 0x10
}

enum ERegionCode {
	useast = 0x00
	uswest = 0x01
	south_america = 0x02
	europe = 0x03
	asia = 0x04
	australia = 0x05
	middle_east = 0x06
	africa = 0x07
	world = 0x8
}

enum ECurrencyCode {
	invalid = 0
	usd = 1
	gbp = 2
	eur = 3
	chf = 4
	rub = 5
	pln = 6
	brl = 7
	nok = 9
	max = 10
}

enum EDepotFileFlag {
	user_config = 1
	versioned_user_config = 2
	encrypted = 4
	read_only = 8
	hidden = 16
	executable = 32
	directory = 64
	custom_executable = 128
}

enum EWorkshopEnumerationType {
	ranked_by_vote = 0
	recent = 1
	trending = 2
	favorite_of_friends = 3
	voted_by_friends = 4
	content_by_friends = 5
	recent_from_followed_users = 6
}

enum EPublishedFileVisibility {
	public = 0
	friends_only = 1
	private = 2
}

enum EWorkshopFileAction {
	played = 0
	completed = 1
}

enum EEconTradeResponse {
	accepted = 0
	declined = 1
	// vac_banned_initiator = 2// obsolete - renamed to trade_banned_initiator
	trade_banned_initiator = 2
	// vac_banned_target = 3// obsolete - renamed to trade_banned_target
	trade_banned_target = 3
	target_already_trading = 4
	disabled = 5
	not_logged_in = 6
	cancel = 7
	too_soon = 8
	too_soon_penalty = 9
	connection_failed = 10
	initiator_already_trading = 11
	error = 12
	timeout = 13
	initiator_blocked_target = 18
	initiator_needs_verified_email = 20
	initiator_needs_steam_guard = 21
	target_account_cannot_trade = 22
	initiator_steam_guard_duration = 23
}

enum EMarketingMessageFlags {
	none_ = 0
	high_priority = 1
	platform_windows = 2
	platform_mac = 4
	platform_restrictions = 6
}

enum ENewsUpdateType {
	app_news = 0
	steam_ads = 1
	steam_news = 2
	cddbupdate = 3
	client_update = 4
}

enum ESystemIMType {
	raw_text = 0
	invalid_card = 1
	recurring_purchase_failed = 2
	card_will_expire = 3
	subscription_expired = 4
	guest_pass_received = 5
	guest_pass_granted = 6
	gift_revoked = 7
	support_message = 8
	support_message_clear_alert = 9
	max = 10
}

enum EChatFlags {
	locked = 1
	invisible_to_friends = 2
	moderated = 4
	unjoinable = 8
}

enum ERemoteStoragePlatform {
	none_ = 0
	windows = 1
	osx = 2
	ps3 = 4
	reserved1 = 8
	reserved2 = 16
	all = -1
}

enum EDRMBlobDownloadType {
	error = 0
	file = 1
	parts = 2
	compressed = 4
	all_mask = 7
	is_job = 8
	high_priority = 16
	add_timestamp = 32
	low_priority = 64
}

enum EDRMBlobDownloadErrorDetail {
	none_ = 0
	download_failed = 1
	target_locked = 2
	open_zip = 3
	read_zip_directory = 4
	unexpected_zip_entry = 5
	unzip_full_file = 6
	unknown_blob_type = 7
	unzip_strips = 8
	unzip_merge_guid = 9
	unzip_signature = 10
	apply_strips = 11
	apply_merge_guid = 12
	apply_signature = 13
	app_id_mismatch = 14
	app_id_unexpected = 15
	applied_signature_corrupt = 16
	apply_valve_signature_header = 17
	unzip_valve_signature_header = 18
	path_manipulation_error = 19
	target_locked_base = 65536
	target_locked_max = 131071
	next_base = 131072
}

enum EClientStat {
	p2pconnections_udp = 0
	p2pconnections_relay = 1
	p2pgame_connections = 2
	p2pvoice_connections = 3
	bytes_downloaded = 4
	max = 5
}

enum EClientStatAggregateMethod {
	latest_only = 0
	sum = 1
	event = 2
	scalar = 3
}

enum ELeaderboardDataRequest {
	global = 0
	global_around_user = 1
	friends = 2
	users = 3
}

enum ELeaderboardSortMethod {
	none_ = 0
	ascending = 1
	descending = 2
}

enum ELeaderboardUploadScoreMethod {
	none_ = 0
	keep_best = 1
	force_update = 2
}

enum EUdpPacketType {
	invalid = 0
	challenge_req = 1
	challenge = 2
	connect = 3
	accept = 4
	disconnect = 5
	data = 6
	datagram = 7
	// max = 8
}

struct MsgChannelEncryptRequest {
	protocol_version u32
	universe         u32
}

struct MsgChannelEncryptResponse {
mut:
	protocol_version u32
	key_size         u32
}

struct MsgChannelEncryptResult {
	result u32
}

struct MsgHeader {
mut:
	msg           u32
	target_job_id u64
	source_job_id u64
}

struct MsgBaseHeader {
	msg u32
}

fn (h MsgBaseHeader) decompose() (bool, Msg) {
	return msg_is_proto(h.msg), raw_msg(h.msg)
}

struct MsgHdrProtobuf {
mut:
	msg           u32
	header_length int
}
