require "bundler/setup"

Bundler.require(:default, :test)
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

puts lib = File.expand_path('../../lib', __FILE__)
$:.unshift lib unless $:.include?(lib)
