# Shiro Ruby Library

This is the official [Shiro API](https://openshiro.com/api/v1/docs) Ruby gem maintained by [OpenShiro](https://openshiro.com).

## Documentation

See the [API docs](https://openshiro.com/api/v1/docs) and also this post on [Getting Started with the Shiro API](https://openshiro.com/docs/getting-started-with-the-shiro-api).

## Installation

To install the gem:

`gem install stripe`

Include it in your Rails gemfile with:

`bundle add shiro`

or directly in the gemfile:

`gem "shiro", "~> 0.1.1"`

## Usage

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
