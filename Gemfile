source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.2'

gem 'activerecord-postgis-adapter'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'hiredis'
gem 'image_processing', '~> 1.12'
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 1.1.4'
gem 'puma', '~> 4.1'
gem 'redis', '~> 4.0'
gem 'sass-rails', '>= 6'
gem 'shrine'
gem 'sidekiq'
gem 'sidekiq-cron'
gem 'sinatra', require: false
gem 'turbolinks', '~> 5'
gem 'whenever'

group :production do
  gem 'dotenv-rails'
end

group :development, :test do
  gem 'awesome_print'
  gem 'bullet'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop', '~> 0.77.0', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rspec', require: false
end

group :development do
  gem 'annotate'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'meta_request'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webdrivers'
  gem 'webmock'
end

group :deployment do
  gem 'cap-ec2'
  gem 'capistrano', require: false
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'itamae-secrets'
end
