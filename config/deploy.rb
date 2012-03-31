$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
require "bundler/capistrano"
# load 'deploy/assets'

set :application, "demo"
set :user, 'spree'
set :group, 'www-data'

set :rvm_ruby_string, '1.8.7-p352' 

set :scm, :git

role :web, "50.57.126.60"
role :app, "50.57.126.60"
role :db,  "50.56.104.24", :primary => true

set :repository,  "git://github.com/spree/demo.git"
set :branch,      "master"
set :deploy_to,   "/data/#{application}"
set :deploy_via,  :remote_cache
set :use_sudo,    false

default_run_options[:pty] = true
set :ssh_options, { :forward_agent => true }


namespace :foreman do
  desc "Export the Procfile to Ubuntu's upstart scripts"
  task :export, :roles => :app do
    run "cd #{current_path} && bundle exec foreman export upstart /etc/init -a #{application} -u spree"
  end

  desc "Start the application services"
  task :start, :roles => :app do
    sudo "start #{application}"
  end

  desc "Stop the application services"
  task :stop, :roles => :app do
    sudo "stop #{application}"
  end

  desc "Restart the application services"
  task :restart, :roles => :app do
    sudo "restart #{application}"
  end
end

namespace :deploy do
  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/s3.yml #{release_path}/config/s3.yml"
    run "ln -nfs #{shared_path}/config/newrelic.yml #{release_path}/config/newrelic.yml"
    run "ln -nfs #{shared_path}/config/Procfile #{release_path}/Procfile"
  end

  desc "Compile assets"
  task :precompile_assets, :roles => :app do
    run "cd #{release_path} && bundle exec rake assets:precompile"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'
after 'deploy:symlink_shared', 'deploy:precompile_assets'
after 'deploy:update', 'foreman:export'
after 'deploy:update', 'foreman:restart'

        require './config/boot'
        require 'airbrake/capistrano'
