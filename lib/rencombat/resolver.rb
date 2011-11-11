module Rencombat
  module Resolver
    def resolve(dice, target)
      if dice > 0 # a normal roll of N dice and all must hit
        return "miss" if (1..dice).any? { |d| roll_d12 > target }
      else  # A zero or less dice roll means very high odds of success, so roll 2 minus number requested and all must fail to miss.
        any_dice = 2 - dice
        return "miss" if (1..any_dice).all? { |d| roll_d12 > target }
      end
      "hit"
    end
  end
end