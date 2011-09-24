require "test/unit"
require "rencombat/dice"

class DiceRoller
  include Rencombat::Dice
end

class TestDice < Test::Unit::TestCase

  def test_dice_roller_gets_methods_from_module
    # resolving a test loading issue
    d = DiceRoller.new()
    assert d.methods.include?(:roll_die)
    assert d.methods.include?(:roll_d12)
  end

  def test_die_returns_integers_in_range_1_to_sides_inclusive
     d = DiceRoller.new()
     40.times do
        roll = d.roll_die(4)
        assert [1,2,3,4].include? roll
     end
  end

  def test_die_defaults_to_six_sides
     d = DiceRoller.new()
     60.times do
        roll = d.roll_die()
        assert [1,2,3,4,5,6].include? roll
     end
  end

end