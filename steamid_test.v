module vapor

fn test_steamid() {
	mut s := steamid(76561198059856976)
	{
		assert s.id() == 99591248
		universe := s.universe()
		assert universe == .public
		instance := s.instance()
		assert instance == 1
		@type := s.@type()
		assert @type == .individual
	}
	{
		s.set_universe(.rc)
		universe := s.universe()
		assert universe == .rc
		s.set_type(.chat)
		println('${u64(s)}')
		@type := s.@type()
		assert @type == .chat
	}
}
