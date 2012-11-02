load 'deploy/assets'
set :rake,      "bundle exec rake"

set :application, "Beijing Rubyist"
set :repository,  "https://github.com/beijing-rubyist/bjrubyist.git"

set :scm, :git

role :web, "bjrubyist.org"                          # Your HTTP server, Apache/etc
role :app, "bjrubyist.org"                          # This may be the same as your `Web` server
role :db,  "bjrubyist.org", :primary => true # This is where Rails migrations will run
role :db,  "bjrubyist.org"

set :deploy_to, "/sg552/apps/bjrubyist/"
default_run_options[:pty] = true

# change to your username
set :user, "wenyang"

namespace :deploy do
  task :start do
    "sudo nginx"
  end
  task :stop do
    "sudo nginx -s stop"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

#https://github.com/capistrano/capistrano/blob/master/lib/capistrano/recipes/deploy/assets.rb#L10
# if have loaded 'deploy/assets', don't need the following

# namespace :assets do
#   task :precompile do
#     run "cd #{release_path} && bundle exec rake RAILS_ENV=production RAILS_GROUPS=assets assets:precompile "
#   end
# end

desc "Copy database.yml to release_path"
  task :cp_database_yml do
    puts "=== executing my customized command: "
    #puts "cp -r #{shared_path}/config/* #{release_path}/config/"
    run "cp -r #{shared_path}/config/* #{release_path}/config/"
    run "ln -s #{shared_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3"
  end

before "deploy:assets:precompile", :cp_database_yml

