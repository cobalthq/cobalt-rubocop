# frozen_string_literal: true

require_relative 'lib/rubocop/cobalt/version'

Gem::Specification.new do |s|
  s.name = 'cobalt-rubocop'
  s.version = RuboCop::Cobalt::VERSION
  s.authors = 'Cobalt Engineering'

  s.summary = 'Cobalt RuboCop'
  s.description = 'Ruby code linting for Cobalt Ruby repositories'
  s.homepage = 'https://github.com/cobalthq/cobalt-rubocop'
  s.license = 'MIT'

  s.metadata['allowed_push_host'] = 'https://rubygems.pkg.github.com'
  s.metadata['changelog_uri'] = "#{s.homepage}/blob/main/CHANGELOG.md"
  s.metadata['github_repo'] = 'ssh://github.com/cobalthq/cobalt-rubocop.git'
  s.metadata['homepage_uri'] = s.homepage
  s.metadata['rubygems_mfa_required'] = 'true'
  s.metadata['source_code_uri'] = s.homepage

  s.files = Dir['README.md', 'LICENSE', 'CHANGELOG.md', 'config/*.yml', 'lib/**/*.rb']
  s.required_ruby_version = '>= 3.2.0'

  s.add_dependency 'rubocop', '~> 1.30'
  s.add_dependency 'rubocop-performance', '~> 1.14'
  s.add_dependency 'rubocop-rails', '~> 2.15'
  s.add_dependency 'rubocop-rspec', '>= 2.11', '< 4.0'

  s.add_development_dependency 'rspec', '~> 3.10'
end
