# require "bundler/setup"

# Bundler.require(:default, :test)
# MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

# puts lib = File.expand_path('../../lib', __FILE__)
# $:.unshift lib unless $:.include?(lib)


begin
  require 'simplecov'
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new [
    SimpleCov::Formatter::HTMLFormatter
  ]
  SimpleCov.start do
    add_filter '/spec|test|vendor/'
  end
rescue LoadError
  puts "\nPlease install simplecov to generate coverage report!\n\n"
end

require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/reporters'

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new
