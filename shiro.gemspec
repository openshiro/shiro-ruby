lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "shiro/version"

Gem::Specification.new do |gem|
  gem.name = "shiro"
  gem.version = Shiro::VERSION
  gem.authors = ["Duncan Miller"]
  gem.email = ["ruby@openshiro.com"]
  gem.description = "Wrapper for the Shiro API"
  gem.summary = "A system for consuming the Shiro API"
  gem.homepage = "https://github.com/OpenShiro/shiro-ruby"

  # Runtime dependencies
  gem.add_dependency "httparty", ">= 0.17.3"

  # Development dependencies
  gem.add_development_dependency "minitest", "~> 5.0"
  gem.add_development_dependency "vcr", "~> 6.2"
  gem.add_development_dependency "standardrb"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "webmock", "~> 3.0"

  gem.files = `git ls-files`.split($/)
  gem.executables = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.require_paths = ["lib"]
end
