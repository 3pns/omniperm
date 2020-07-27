# encoding: UTF-8
# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"

desc "Run all the tests"
task default: :test

desc 'Run unit tests.'
Rake::TestTask.new(:test) do |t|
  puts "running tests"
  #t.libs << 'lib'
  t.libs << 'test'
  # t.pattern = 'test/**/*_test.rb'
  t.test_files = FileList["test/**/*_test.rb", "test/**/spec_*.rb", "test/gemloader.rb"]
  t.verbose = true
  t.warning = false
end
