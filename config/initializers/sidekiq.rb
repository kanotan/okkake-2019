Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'], namespace: 'sidekiq' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'], namespace: 'sidekiq' }
end

if Sidekiq.server?
  hash = YAML.load_file(Rails.root.join('config', 'sidekiq_schedule.yml'))
  Sidekiq::Cron::Job.load_from_hash(hash) if hash
end
