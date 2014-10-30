$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "user_interface/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "user_interface"
  s.version     = UserInterface::VERSION
  s.authors     = ["Alban Peignier", "Florent Peyraud"]
  s.email       = ["alban@tryphon.eu", "florent@tryphon.eu"]
  s.homepage    = "http://projects.tryphon.eu/user_interface"
  s.summary     = "Tryphon UI resources"
  s.description = "Rails engine used to share user interface resources between Tryphon web applications"

  s.files = Dir["{app,config,db,lib}/**/*"] + %w{COPYING COPYRIGHT Rakefile}
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1.3"
  s.add_dependency "will_paginate", "~> 3.0.2"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
end

