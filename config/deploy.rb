# config valid for current version and patch releases of Capistrano
lock "~> 3.10.0"

set :application, 'raan'
set :repo_url, "git@bitbucket.org:novahub/besm.git"
set :user, 'raan'
set :ssh_options,     {user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
#set :linked_files, %w{config/database.yml config/secrets.yml .env}
set :stages, ["staging", "production"]
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"