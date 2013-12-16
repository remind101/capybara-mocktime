# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capybara/mocktime/version'

Gem::Specification.new do |spec|
  spec.name          = "capybara-mocktime"
  spec.version       = Capybara::Mocktime::VERSION
  spec.authors       = ["Eric J. Holmes"]
  spec.email         = ["eric@ejholmes.net"]
  spec.description   = %q{Ruby gem to synchronize times between the tests and the browser with capybara}
  spec.summary       = %q{Ruby gem to synchronize times between the tests and the browser with capybara}
  spec.homepage      = "https://github.com/remind101/capybara-mocktime"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "capybara"
  spec.add_dependency "timecop"
  spec.add_dependency "chronic"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
