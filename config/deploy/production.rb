require "dotenv"
Dotenv.load File.expand_path(".env", __dir__)

set :application,    ENV['DEPLOY_APP']
set :deploy_server,  ENV['DEPLOY_SERVER']
set :user,           ENV['DEPLOY_USER']
set :login,          ENV['DEPLOY_LOGIN']
set :password,       ENV['DEPLOY_PASSWORD']

set :scm,       :git
set :repo_url,  ENV['DEPLOY_REPO']
set :branch,    ENV["REVISION"] || ENV["BRANCH_NAME"] || "master"

set :deploy_to,     "/home/#{fetch :user}/projects/#{fetch :application}"
set :unicorn_conf,  "/etc/unicorn/#{fetch :application}.#{fetch :login}.rb"
set :unicorn_pid,   "/var/run/unicorn/#{fetch :application}.#{fetch :login}.pid"

set :ssh_options, {
  forward_agent: true,
}
set :log_level, :info
set :keep_releases, 3
set :rvm_ruby_version, "2.1.2"

server fetch(:deploy_server),
  user: fetch(:user),
  password: fetch(:password),
  roles: %w{web app db}

set :linked_files, %w{config/environments/.production.env}

# - for unicorn - #
set :unicorn_start_cmd, "(cd #{fetch(:deploy_to)}/current; rvm use #{fetch(:rvm_ruby_version)} do bundle exec unicorn_rails -Dc #{fetch(:unicorn_conf)})"
namespace :deploy do
  desc "Start application"
  task :start do
    on roles(:app) do
      execute fetch(:unicorn_start_cmd)
    end
  end

  desc "Stop application"
  task :stop do
    on roles(:app) do
      execute "[ -f #{fetch :unicorn_pid} ] && kill -QUIT `cat #{fetch :unicorn_pid}`"
    end
  end

  desc "Restart Application"
  task :restart do
    on roles(:app) do
      execute "[ -f #{fetch :unicorn_pid} ] && kill -USR2 `cat #{fetch :unicorn_pid}` || #{fetch :unicorn_start_cmd}"
    end
  end
end
