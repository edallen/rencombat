require 'spec_helper'

class DiceRoller
  include Rencombat::Dice
end

describe Rencombat do
  it 'should return correct version string' do
    Rencombat.version_string.should == "Rencombat version #{Rencombat::VERSION}"
  end
end

describe Rencombat::Dice do
  it 'should roll a four sided die' do
    d = DiceRoller.new()
    40.times do
      roll = d.roll_die(4)
      [1, 2, 3, 4].should include roll
    end
  end

  it 'should default to a six sided die' do
    d = DiceRoller.new()
    60.times do
      roll = d.roll_die()
      [1, 2, 3, 4, 5, 6].should include roll
    end
  end
end

