require "English"

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth-asana/version"

Gem::Specification.new do |gem|
  gem.name          = "omniauth-asana"
  gem.version       = Omniauth::Asana::VERSION
  gem.authors       = ["Isaac Wolkerstorfer"]
  gem.email         = ["isaac@asana.com"]
  gem.description   = "Official OmniAuth strategy for Asana."
  gem.summary       = "Official OmniAuth strategy for Asana. Based on the OmniAuth strategy for GitHub."
  gem.homepage      = "https://github.com/asana/omniauth-asana"

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "omniauth", "~> 2.0"
  gem.add_dependency "omniauth-oauth2", "~> 1.1"
  gem.metadata = {
    "rubygems_mfa_required" => "true",
  }
end
