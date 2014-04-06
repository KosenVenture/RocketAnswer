# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'kaitoushare'

set :repo_url, 'git@github.com:kosen-venture/KaitouShare.git'
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, "/var/www/kaitoushare"
set :pty, true
set :keep_releases, 5

set :log_level, :debug

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do
  desc 'Prepare'
  task :prepare do
    on roles(:all) do
      execute :sudo, :mkdir, '-p', fetch(:deploy_to)
      execute :sudo, :chown, "#{fetch(:uid)}:#{fetch(:gid)}", fetch(:deploy_to)
    end
  end

  desc 'Restart application'
  task :restart do
    invoke :'god:restart'
    invoke :'god:unicorn:restart'
    invoke :'nginx:reload'
  end

  after :publishing, :restart
  before :starting, :prepare
end

namespace :db do
  desc "Upload database yaml in shared path"
  task :upload_config do
    on roles(:all) do
      execute :mkdir, '-p', "#{shared_path}/config"
      upload!("config/database.yml", "#{shared_path}/config/")
      execute :ln, '-nfs', "#{shared_path}/config/database.yml",
        "#{release_path}/config/database.yml"
    end
  end

  desc 'Create database'
  task :create do
    on roles(:db) do
      within release_path do
        execute :bundle, "exec rake db:create RAILS_ENV=#{fetch(:rails_env)}"
      end
    end
  end
end

before "deploy:updated", "db:upload_config"
before "deploy:migrate", "db:create"
before 'deploy:updated', 'god:setup'
before 'deploy:updated', 'nginx:setup'
