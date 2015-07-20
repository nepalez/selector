$:.push File.expand_path("../lib", __FILE__)
require "selector/version"

Gem::Specification.new do |gem|

  gem.name        = "selector"
  gem.version     = Selector::VERSION.dup
  gem.author      = "Andrew Kozin"
  gem.email       = "andrew.kozin@gmail.com"
  gem.homepage    = "https://github.com/nepalez/selector"
  gem.summary     = "Composable multi-type conditions."
  gem.license     = "MIT"

  gem.files            = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.test_files       = Dir["spec/**/*.rb"]
  gem.extra_rdoc_files = Dir["README.md", "LICENSE"]
  gem.require_paths    = ["lib"]

  gem.required_ruby_version = "~> 1.9.3"

  gem.add_runtime_dependency "ice_nine", "~> 0.11"

  gem.add_development_dependency "hexx-rspec", "~> 0.5"

end # Gem::Specification
