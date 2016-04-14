require "simplecov"
SimpleCov.start

if ENV["CI"] == "true"
  require "codecov"
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require "webmock/rspec"

dti_response = {
  result: "success",
  story_ids: [1],
  stories: [{
    "id" => "1",
    "url" => "http://theadvocate.com/example",
    "Headline" => "Test Headline",
    "Body" => "Test body."
  }]
}.to_json

# http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.example_status_persistence_file_path = "tmp/rspec_examples.txt"
  config.order = :random

  config.before(:each) do
    stub_request(:get, /theadvocate.com/).
      with(headers: { "Accept" => "*/*", "User-Agent" => "Ruby" }).
      to_return(status: 200, body: dti_response, headers: {})
  end
end

WebMock.disable_net_connect!(allow_localhost: true)
