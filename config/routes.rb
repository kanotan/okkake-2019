require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  # Sidekiq
  mount Sidekiq::Web => '/sidekiq'
end
