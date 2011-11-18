$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "angular-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "angular-rails"
  s.version     = AngularRails::VERSION
  s.authors     = ["Nate Kidwell"]
  s.email       = ["nate@ludicast.com"]
  s.homepage    = "http://github.com/ludicast/angular-rails"
  s.summary     = "Helpers for angularjs in a rails project"
  s.description = "Helpers for angularjs in a rails project (ripped from backbone-rails)"

  s.files = Dir["{app,config,db,lib,vendor}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.0"
  s.add_dependency "coffee-script", '~> 2.2.0'

end
