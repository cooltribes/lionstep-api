server 'lionstep.com', roles: %w{web app db}
set :deploy_to, '/home/deploy/staging/lionstep-api'
set :branch, 'dev'

#### Sidekiq options for capistrano-sidekiq
set :sidekiq_queue, ['high', 'mailers', 'default', 'low']