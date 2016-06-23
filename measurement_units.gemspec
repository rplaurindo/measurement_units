# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'measurement_units/version'

Gem::Specification.new do |spec|
  spec.name           = "measurement_units"
  spec.version        = MeasurementUnits::VERSION
  spec.authors        = ["Rafael Laurindo"]
  spec.email          = ["rafaelplaurindo@gmail.com"]
  spec.homepage       = "https://rubygems.org/gems/measurement_units"
  spec.summary        = %q{Summary of MeasurementUnits}
  spec.description    = %q{Provides a way to convert measurement units.}
  spec.license        = "MIT"

  spec.test_files     = Dir["test/**/*"]

  spec.files          = Dir["{bin,lib,vendor}/**/*", "CODE_OF_CONDUCT.md", "MIT-LICENSE", "README.md", "Rakefile"]
  spec.require_paths  = %w{bin lib vendor}
end
