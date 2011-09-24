module Rencombat
 # some code...
  def self.version_string
    "Rencombat version #{Rencombat::VERSION}"
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    #def bar
    #  puts 'class method'
    #end
  end
end
