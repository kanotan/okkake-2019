source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'rails', '~> 7.0'

gem 'activerecord-postgis-adapter'
gem 'bootsnap', require: false
gem 'hiredis'
gem 'image_processing'
gem 'jbuilder'
gem 'pg'
gem 'puma'
gem 'psych'
gem 'redis'
gem 'sass-rails'
gem 'shrine'
gem 'sidekiq'
gem 'sidekiq-cron'
gem 'sinatra', require: false
gem 'turbolinks'
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
  gem 'rubocop', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rspec', require: false
end

group :development do
  gem 'annotate'
  gem 'listen'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

group :test do
  gem 'capybara'
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
