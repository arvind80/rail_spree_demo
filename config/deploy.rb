set :use_sudo, false
set :git_shallow_clone,  1
set :keep_releases,      5
set :application, "demo"
set :scm_passphrase, "root"
set :repository,  "git@github.com:arvind80/rail_spree_demo.git"
set :user, "deployer"
set :scm, :git
set :branch, 'master'

set :deploy_to, "/home/deployer/demo"
set :runner, "deployer"
ssh_options[:paranoid] = false
ssh_options[:forward_agent] = true
default_run_options[:pty]= true
 #Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "108.171.177.115"                          # Your HTTP server, Apache/etc
role :app,"108.171.177.115"                          # This may be the same as your `Web` server
role :db,  "108.171.177.115", :primary => true # This is where Rails migrations will run

namespace :deploy do
 task :start do
  sudo "/etc/init.d/unicorn start"
 end

 task :stop do
  sudo "/etc/init.d/unicorn reload"
 end
 
 task :restart do
  sudo "/etc/init.d/unicorn reload"
 end

end
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
