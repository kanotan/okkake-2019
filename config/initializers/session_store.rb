# Be sure to restart your server when you modify this file.

if Rails.env.test?
  Rails.application.config.session_store :cookie_store, key: '_session'
else
  cache_store = ActiveSupport::Cache::RedisCacheStore.new(url: ENV['SESSION_REDIS_URL'])
  Rails.application.config.session_store :cache_store,
                                         cache: cache_store,
                                         expire_after: 2.weeks,
                                         secure: Rails.env.production?
end
