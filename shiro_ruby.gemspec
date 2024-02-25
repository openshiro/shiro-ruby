# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "shiro_ruby/version"

Gem::Specification.new do |gem|
  gem.name          = "shiro_ruby"
  gem.version       = ShiroRuby::VERSION
  gem.authors       = ["Duncan Miller"]
  gem.email         = ["ruby@openshiro.com"]
  gem.description   = "Wrapper for the Shiro API"
  gem.summary       = "A system for consuming the Shiro API"
  gem.homepage      = "https://github.com/OpenShiro/shiro_ruby"

  # Runtime dependencies
  gem.add_dependency "httparty", ">= 0.17.3"

  # Development dependencies
  gem.add_development_dependency "minitest", "~> 5.0"
  gem.add_development_dependency "vcr", "~> 6.2"
  gem.add_development_dependency "standardrb", "~> 1.31.0"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]
  gem.test_files    = gem.files.grep(%r{^test/})
end
