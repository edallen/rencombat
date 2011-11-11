module Rencombat
  module Resolver
     def resolve(dice,target)
       return "miss" if (1..dice).any?{|d| roll_d12 > target }
       "hit"
     end
  end
end