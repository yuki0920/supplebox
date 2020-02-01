# frozen_string_literal: true

require 'simplecov'
SimpleCov.start 'rails'

require 'vcr'

RSpec.configure do |config|
  require 'capybara/rspec'

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:each, type: :system) do
    driven_by :selenium_chrome_headless
  end
end

# VCRの設定追加
VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = false
  c.default_cassette_options = {
    match_requests_on: [:method, VCR.request_matchers.uri_without_param(:Timestamp, :Signature)]
  }
end
