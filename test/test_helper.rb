require "bundler/setup"
Bundler.require(:default, :test)

require "minitest/autorun"
require "vcr"
require "webmock/minitest"

Shiro.configure do |config|
  config[:api_key] = ENV["SHIRO_API_KEY"]
end

VCR.configure do |config|
  config.cassette_library_dir = "test/vcr_cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data("<SHIRO_API_KEY>") { ENV["SHIRO_API_KEY"] }
  config.filter_sensitive_data('<SHIRO_PROMT_ID>') { ENV['SHIRO_PROMT_ID'] }
  config.filter_sensitive_data('<SHIRO_DEPLOYMENT_ID>') { ENV['SHIRO_DEPLOYMENT_ID'] }
  config.default_cassette_options = {record: :new_episodes}
end
