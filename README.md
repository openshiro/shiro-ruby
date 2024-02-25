````
require 'shiro_ruby'

ShiroRuby.configure do |config|
  config[:api_key] = 'your_api_key...'
end

# List deployments
deployments = ShiroRuby::Deployment.list
puts deployments.body

# Retrieve single deployment
deployment = ShiroRuby::Deployment.retrieve('dpmt_lWokJnPAwQCeV2ZWovjG7BNr')
puts deployment.body
````
