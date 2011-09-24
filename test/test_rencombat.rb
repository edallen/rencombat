require "test/unit"
require "rencombat"
require "rencombat/version"

class TestRencombat < Test::Unit::TestCase
  def test_version_string
    assert_equal  "Rencombat version #{Rencombat::VERSION}", Rencombat.version_string
  end

end


