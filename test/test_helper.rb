require "bundler/setup"
Bundler.require(:default, :test)

require "minitest/autorun"
require "vcr"
require "webmock/minitest"

VCR.configure do |config|
  config.cassette_library_dir = "test/vcr_cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data("<SHIRO_API_KEY>") { ENV["SHIRO_API_KEY"] }
  config.default_cassette_options = {record: :new_episodes}
end
