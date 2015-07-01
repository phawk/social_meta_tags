$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "social_meta_tags/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "social_meta_tags"
  s.version     = SocialMetaTags::VERSION
  s.authors     = ["Pete Hawkins"]
  s.email       = ["pete@phawk.co.uk"]
  s.homepage    = "https://github.com/phawk/social_meta_tags"
  s.summary     = "Easy integration of Open graph and twitter meta tags in your Rails app"
  s.description = "Easy integration of Open graph and twitter meta tags in your Rails app"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.2"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.3.1"
  s.add_development_dependency "capybara", "~> 2.0"
  s.add_development_dependency "byebug"
end
