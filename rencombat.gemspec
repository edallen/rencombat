Gem::Specification.new do |s|
 s.name        = "rencombat"
 s.version     = Rencombat::VERSION
 s.authors     = ["Ed Allen"]
 s.email       = ["edallen1@gmail.com"]

 s.summary     = "Skirmish game combat calculator"
 s.description = "Define some  game characters. Resolve fights. Look at the stats and figure out if the probability model sucks."
 s.homepage    = "http://github.com/edallen/rencombat"
 s.files       = Dir.glob("lib/**/*.rb")
 s.test_files  = Dir.glob("test/**/*.rb")
end