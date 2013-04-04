$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ember-oauth2-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ember-oauth2-rails"
  s.version     = EmberOauth2Rails::VERSION
  s.authors     = ["Kristian Mandrup"]
  s.email       = ["kmandrup@gmail.com"]
  s.homepage    = "https://github.com/kristianmandrup/ember-oauth2-rails"
  s.summary     = "Ember OAuth 2 for Rails Asset pipeline"
  s.description = "Use Ember OAuth 2 in your Rails app"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 3.1"
end
