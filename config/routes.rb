require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth', skip: %i[password confirmation], controllers: {
    sessions: 'api/v1/auth/sessions',
    registrations: 'api/v1/auth/registrations',
    token_validations: 'api/v1/auth/token_validations',
    omniauth_callbacks: 'api/v1/auth/omniauth_callbacks'
  }
  # Sidekiq
  mount Sidekiq::Web => '/sidekiq'
end
