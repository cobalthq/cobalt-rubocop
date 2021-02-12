# frozen_string_literal: true

require 'rubocop'
require 'rubocop/rspec/support'
require 'rubocop/cop/cobalt'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
    mocks.syntax = :expect
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.warnings = true

  # https://github.com/rubocop-hq/rubocop/blob/master/lib/rubocop/rspec/expect_offense.rb
  config.include RuboCop::RSpec::ExpectOffense
end
