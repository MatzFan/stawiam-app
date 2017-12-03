Sidekiq.configure_client do |config|
  config.redis = { url: AppConfig.redis.url }
end

Sidekiq.configure_server do |config|
  config.redis = { url: AppConfig.redis.url }
end
