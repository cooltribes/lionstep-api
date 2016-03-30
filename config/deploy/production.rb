server 'lionstep.com', roles: %w{web app db}
set :deploy_to, '/home/deploy/production/lionstep-api'
set :branch, 'master'

#### Sidekiq options for capistrano-sidekiq
set :sidekiq_queue, ['high', 'mailers', 'default', 'low']