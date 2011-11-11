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

class CombatCalculator
  include Rencombat::Resolver
  include Rencombat::Dice
end

describe "the combat resolver" do
  describe 'rolls a number of D12 dice against a target number and returns a hit if all are less than or equal to the target' do
    it "rolls 1 die for a seven and misses" do
      cc = CombatCalculator.new()
      cc.should_receive(:roll_d12).and_return(7)
      cc.resolve(1, 6).should match "miss"
    end

    it 'rolls a 6 and a 7 for target 6 and misses' do
      cc = CombatCalculator.new()
      cc.should_receive(:roll_d12).twice.and_return(6,7)
      cc.resolve(4, 6).should match "miss"
    end

    it 'rolls 6,6,6,6 for a target of 6 and hits' do
      cc = CombatCalculator.new()
      cc.should_receive(:roll_d12).exactly(4).times.and_return(6)
      cc.resolve(4, 6).should match "hit"
    end

    #it 'rolls 2 - dice requested when request 0 or less and hits if any succeed' do
    #
    #end
    #
    #it 'rolls 2 - dice requested when request is 0 or less and misses if all fail' do
    #
    #end
  end
end