module Rencombat
 # some code...
  def die sides
    roll =  1 + rand(sides)
    puts roll
    roll
  end

  def d12
    die 12
  end
end
