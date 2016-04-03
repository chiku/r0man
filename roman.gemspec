# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "roman/version"

Gem::Specification.new do |s|
  s.name                     = "roman"
  s.version                  = Roman::VERSION
  s.authors                  = ["Chirantan Mitra"]
  s.email                    = ["chirantan.mitra@gmail.com"]
  s.summary                  = "Roman number conversions"
  s.description              = "Convert Roman numbers to Indian"
  s.license                  = "MIT"
  s.rubyforge_project        = "roman"
  s.files                    = Dir.glob("lib/**/*") + ["LICENSE"]
  s.test_files               = Dir.glob("spec/**/*")
  s.require_paths            = ["lib"]

  s.add_dependency "simple_validation"

  s.add_development_dependency "rake"
  s.add_development_dependency "minitest"
  s.add_development_dependency "minitest-reporters"
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'yard'
end
