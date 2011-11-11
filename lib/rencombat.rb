$LOAD_PATH.push File.expand_path(".")
require 'rencombat/version'
require 'rencombat/dice'
require 'rencombat/resolver'

module Rencombat
 # some code...


  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    #def bar
    #  puts 'class method'
    #end
  end
end
