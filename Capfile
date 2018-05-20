# Load DSL and set up stages
require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/passenger'
require "capistrano/rvm"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"
require "capistrano/scm/git"

install_plugin Capistrano::SCM::Git

set :rvm_type, :user
set :rvm_ruby_version, '2.5.1'
set :passenger_environment_variables, { :path => '/usr/bin:$PATH' }
set :passenger_restart_command, '/usr/passenger-config restart-app'
# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
