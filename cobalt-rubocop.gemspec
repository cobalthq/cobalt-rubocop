# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = "cobalt-rubocop"
  s.version = "0.1.0"
  s.summary = "Cobalt RuboCop"
  s.description = "Ruby code linting for Cobalt Ruby repositories"
  s.homepage = "https://github.com/cobalthq/cobalt-rubocop"
  s.license = "MIT"

  s.files = Dir["README.md", "LICENSE", "config/*.yml"]

  s.add_dependency "rubocop", "1.9.1"
  s.add_dependency "rubocop-performance", "1.9.2"
  s.add_dependency "rubocop-rails", "2.9.1"
  s.add_dependency "rubocop-rspec", "2.2.0"

  s.required_ruby_version = ">= 2.5.0"

  s.authors = "Cobalt"
end
