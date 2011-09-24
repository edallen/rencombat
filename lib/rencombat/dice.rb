module Rencombat
  module Dice
    def roll_die(sides=6)
      roll = 1 + rand(sides)
      roll
    end

    def roll_d12
      die 12
    end
  end
end