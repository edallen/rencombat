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
   before(:all) do
      @dr = DiceRoller.new()
  end

  it 'should roll a four sided die' do
    40.times do
      roll = @dr.roll_die(4)
      (1..4).should include roll
    end
  end

  it 'should default to a six sided die' do
    60.times do
      roll = @dr.roll_die()
      (1..6).should include roll
    end
  end

    it 'should roll a 12 sided die for roll_d12 convenience method' do
    60.times do
      roll = @dr.roll_d12
      (1..12).should include roll
    end
  end
end

class CombatCalculator
  include Rencombat::Resolver
  include Rencombat::Dice
end

describe "the combat resolver" do
  describe 'rolls a number of D12 dice against a target number and returns a hit if all are less than or equal to the target' do
    before(:all) do
      @cc = CombatCalculator.new()
    end

    it 'rolls 1 die and gets a 7 for a target of 6 and misses' do
      @cc.should_receive(:roll_d12).and_return(7)
      @cc.resolve(1, 6).should match "miss"
    end

    it 'rolls a 6 and a 7 for target of 6 and misses' do
      @cc.should_receive(:roll_d12).twice.and_return(6,7)
      @cc.resolve(4, 6).should match "miss"
    end

    it 'rolls 6,6,6,6 for a target of 6 and hits' do
      @cc.should_receive(:roll_d12).exactly(4).times.and_return(6)
      @cc.resolve(4, 6).should match "hit"
    end

    it 'rolls up to 2 - dice requested when request 0 or less and hits if any succeed' do
      @cc.should_receive(:roll_d12).exactly(3).times.and_return(7,7,6)
      @cc.resolve(-1, 6).should match "hit"
     end

    it 'rolls 2 - dice requested when request is 0 or less and misses if all fail' do
      @cc.should_receive(:roll_d12).twice.and_return(7,7)
      @cc.resolve(0, 6).should match "miss"
    end
  end
end