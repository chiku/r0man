# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rubocop/rake_task'

::Rake::TestTask.new(:test) do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

::RuboCop::RakeTask.new(:lint)

task default: %i[lint test]
