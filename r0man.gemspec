# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'r0man/version'

Gem::Specification.new do |s|
  s.name                     = 'r0man'
  s.version                  = R0man::VERSION
  s.authors                  = ['Chirantan Mitra']
  s.email                    = ['chirantan.mitra@gmail.com']
  s.summary                  = 'Roman number conversions'
  s.description              = 'Convert Roman numbers to Indian'
  s.license                  = 'MIT'
  s.rubyforge_project        = 'roman'
  s.files                    = Dir.glob('lib/**/*') + ['LICENSE']
  s.require_paths            = ['lib']
  s.required_ruby_version    = '>= 2.7'

  s.add_runtime_dependency('simple_validation', '~> 0.2.1')

  s.metadata['rubygems_mfa_required'] = 'true'
end
