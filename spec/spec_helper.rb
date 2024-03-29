# frozen_string_literal: true

begin
  require('simplecov')
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::HTMLFormatter])
  SimpleCov.start do
    add_filter('/spec|test|vendor/')
  end
rescue LoadError
  puts("\nPlease install simplecov to generate coverage report!\n\n")
end

require 'minitest/autorun'
require 'minitest/spec'
