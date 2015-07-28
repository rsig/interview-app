require 'yarjuf'
require 'simplecov'
require 'simplecov-rcov'
SimpleCov.start 'rails' do
  add_group "Libraries" do |src_file|
    src_file.filename.match(/\/lib\//)
  end
  add_group "Models" do |src_file|
    src_file.filename.match(/\/app\/models\//)
  end
  add_group "API" do |src_file|
    ( src_file.filename.match(/\/app\/api\//) || src_file.filename.match(/\/app\/serializers\//) )
  end
end
SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
