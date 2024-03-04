# Shiro Ruby Library

This is the official [Shiro API](https://openshiro.com/api/v1/docs) Ruby library gem maintained by [OpenShiro](https://openshiro.com). The Shiro Ruby library provides convenient access to the Stripe API from applications written in the Ruby language.

## Documentation

See the [API docs](https://openshiro.com/api/v1/docs) and also this post on [Getting Started with the Shiro API](https://openshiro.com/docs/getting-started-with-the-shiro-api).

## Installation

To install the gem:

```
gem install shiro
```

Include it in your Rails gemfile with:

```
bundle add shiro
```

or directly in the gemfile:

```
gem "shiro", "~> 0.1.1"
```

## Usage

The library needs to be configured with your account's api key which is available in your Shiro account under API Keys.

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

**Update a deployment**

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

## Support

New features and bug fixes are released on the latest major version of the Shiro Python library. If you are on an older major version, we recommend that you upgrade to the latest in order to use the new features and bug fixes including those for security vulnerabilities. Older major versions of the package will continue to be available for use, but will not be receiving any updates.

## Development

Run the tests:

```
rake test
```
