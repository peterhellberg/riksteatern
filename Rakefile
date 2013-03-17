# encoding: utf-8

require 'rake/testtask'
require 'bundler/gem_tasks'

task :default => :spec

Rake::TestTask.new(:spec) do |t|
  t.test_files = FileList['spec/**/*_spec.rb']
end

desc "Console"
task :console do
  Bundler.with_clean_env do
    exec 'pry -r./lib/riksteatern'
  end
end
