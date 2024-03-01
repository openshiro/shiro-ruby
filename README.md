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

First, configure Shiro with your API key:

```ruby
require "shiro"

Shiro.configure do |config|
  config[:api_key] = "your_api_key..."
end
```

### Deployment Actions

**List deployments**

```ruby
deployments = Shiro::Deployment.list
```

**Retrieve a single deployment**

```ruby
deployment = Shiro::Deployment.retrieve("dpmt_lWokJnPAwQCeV2ZWovjG7BNr")
```

**Update a deployment name**

```ruby
updated_deployment = Shiro::Deployment.update("dpmt_lWokJnPAwQCeV2ZWovjG7BNr", { name: "New Deployment Name" })
```

### Generating Completions

**Generate a completion for a deployment**

```ruby
content = Shiro::GenerateCompletion.create("dpmt_lWokJnPAwQCeV2ZWovjG7BNr",
  environment: "PRODUCTION",
  prompt_id: "prmt_WnAlbE5lEMtxAG2Qly6jo2dV", # optional
  input_variables: { "key": "value" }
)
```

### User Account Actions

**Retrieve current user's details**

```ruby
current_user = Shiro::Me.retrieve
```

**Delete current user's account**

```ruby
response = Shiro::Me.destroy
puts response # The response might be empty if the account is successfully deleted.
```

### Prompt Actions

**List prompts**

```ruby
prompts = Shiro::Prompt.list
```

**Retrieve a single prompt**

```ruby
prompt = Shiro::Prompt.retrieve("prmt_WnAlbE5lEMtxAG2Qly6jo2dV")
```

## Development

Run the tests:

```
rake test
```
