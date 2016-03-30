source 'https://rubygems.org'

gem 'rails', '4.2.6'
gem 'rails-api', '0.4.0'
gem 'pg'
gem 'rack-cors', :require => 'rack/cors'
gem 'devise_token_auth', git: 'https://github.com/ArmandoMendoza/devise_token_auth.git', branch: 'fix_for_lionstep'
gem 'omniauth'
gem 'versionist', '1.4.1'
gem 'kaminari', '0.16.3'
gem 'active_model_serializers', git: 'https://github.com/rafael/active_model_serializers.git', branch: 'resource-level-meta'
gem 'paranoia', '~> 2.0'
gem 'carrierwave', '0.10.0'
gem 'mini_magick'
gem 'smarter_csv', '1.1.0'
gem 'settingslogic'
gem 'pundit'
gem 'puma'
gem 'ransack', '1.7.0'
gem 'sidekiq', '4.1.1'
gem 'redis-namespace'
gem 'sinatra', :require => nil

group :development do
  gem 'spring'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'lol_dba'
  gem 'rails-rename', '~> 1.0.0'
  gem 'foreman'
  gem 'subcontractor'
  gem 'mailcatcher'
  gem 'capistrano', '~> 3.4'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
  gem 'capistrano-rails-collection'
  gem 'capistrano-sidekiq'
end

group :test, :development do
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'machinist'
  gem 'faker'
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false
  gem 'webmock'
  gem 'vcr'
  gem 'rspec-activejob'
end
