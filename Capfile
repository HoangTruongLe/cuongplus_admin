# Load DSL and set up stages
require "capistrano/setup"
require 'capistrano/rails'
require 'capistrano/passenger'
require "capistrano/deploy"
require "capistrano/scm/git"
require "capistrano/rvm"
install_plugin Capistrano::SCM::Git

# require "capistrano/chruby"
# require "capistrano/bundler"
# require "capistrano/rails/assets"
# require "capistrano/rails/migrations"
# require "capistrano/passenger"
set :rvm_type, :user
set :rvm_ruby_version, '2.5.0'
# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
