$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cal_linker/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cal_linker"
  s.version     = CalLinker::VERSION
  s.authors     = ["JD Guzman"]
  s.email       = ["jdguzman@mac.com"]
  s.homepage    = "https://github.com/jdguzman/cal_linker"
  s.summary     = "Create Outlook/iCal compatible links."
  s.description = "This gem provides you with the ability to create links that will send events to calendaring apps."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "icalendar", "~> 2.1.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "faker", "~> 1.4.0"
  s.add_development_dependency "better_errors"
  s.add_development_dependency "binding_of_caller"
end
