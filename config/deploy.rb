# config valid only for current version of Capistrano
lock "3.4.0"

set :application, "lionstep-api"
set :repo_url, "git@github.com:cooltribes/lionstep-api.git"
set :ssh_options, {user: "deploy", forward_agent: true}
set :scm, :git
set :linked_files, %w{config/database.yml config/application.yml}
set :linked_dirs, %w{public/uploads tmp/pids tmp/sockets log}
set :keep_releases, 5

#Puma config
set :puma_init_active_record, true
set :nginx_server_name, "lionstep.com"
set :nginx_sites_available_path, "/home/deploy"
set :nginx_sites_enabled_path, "/home/deploy"

namespace :deploy do

  after :finished, :create_secrets do
    on roles(:all) do
      within current_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "app:create_secret_file"
        end
      end
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, "cache:clear"
      # end
    end
  end

end
