This is the official [Shiro API](https://openshiro.com/api/v1/docs) Ruby gem maintained by [OpenShiro](https://openshiro.com).

To use the gem, include it in your Rails gemfile with:

`bundle add shiro_ruby`

or directly in the gemfile:

`shiro_ruby ~> 0.1`
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
