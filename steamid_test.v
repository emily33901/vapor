module vapor

fn test_steamid() {
	mut s := steamid(76561198059856976)
	{
		// Test the initial steamid
		assert s.id() == 99591248
		universe := s.universe()
		assert universe == .public
		instance := s.instance()
		assert instance == 1
		@type := s.@type()
		assert @type == .individual
	}
	{
		// test modification
		s.set_universe(.rc)
		universe := s.universe()
		assert universe == .rc
		s.set_type(.chat)
		@type := s.@type()
		assert @type == .chat
		s.set_id(0)
		id := s.id()
		assert id == 0
	}
}
