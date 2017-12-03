Rollbar.configure do |config|
  config.access_token = AppConfig.rollbar.access_token
  config.use_sidekiq "queue" => "rollbar"
  config.sidekiq_threshold = 3
  config.environment = App.environment
  
  if App.test? || App.development?
    config.enabled = false
  end
end
