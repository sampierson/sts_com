#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

StsCom::Application.load_tasks

def execute(command)
  puts "executing: #{command}"
  puts %x[ #{command} ]
  raise "Command \"#{command}\" returned exit code #{$?.exitstatus}" unless $?.success?
end
