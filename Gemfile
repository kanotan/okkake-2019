source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.2'

gem 'activerecord-postgis-adapter'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'image_processing', '~> 1.2'
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 1.1.4'
gem 'puma', '~> 4.1'
gem 'redis', '~> 4.0'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop', '~> 0.77.0', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rspec', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
