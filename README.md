This is the official [Shiro API](https://openshiro.com/api/v1/docs) Ruby gem maintained by [OpenShiro](https://openshiro.com).

To use the gem, include it in your Rails gemfile with:

`bundle add shiro`

or directly in the gemfile:

`gem "shiro", "~> 0.1"`

Example usage:

````
require "shiro"

Shiro.configure do |config|
  config[:api_key] = "your_api_key..."
end

# List deployments
deployments = Shiro::Deployment.list
puts deployments.body

# Retrieve single deployment
deployment = Shiro::Deployment.retrieve("dpmt_lWokJnPAwQCeV2ZWovjG7BNr")
puts deployment.body
````
