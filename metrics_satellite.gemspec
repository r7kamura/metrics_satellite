# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'metrics_satellite/version'

Gem::Specification.new do |gem|
  gem.name          = "metrics_satellite"
  gem.version       = MetricsSatellite::VERSION
  gem.authors       = ["Ryo Nakamura"]
  gem.email         = ["ryo-nakamura@cookpad.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "nokogiri"
  gem.add_dependency "activesupport"
  gem.add_dependency "brakeman"
  gem.add_dependency "flay"
  gem.add_dependency "hotspots"
  gem.add_dependency "rails_best_practices"
  gem.add_dependency "rake"
  gem.add_dependency "guideline", "~> 0.2.0"

  gem.add_development_dependency "rspec", "2.12.0"
  gem.add_development_dependency "simplecov"
end
