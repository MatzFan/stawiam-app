require "./app"
require "sidekiq"
require "sidekiq/web"

Sidekiq.configure_client do |config|
  config.redis = { size: 1 }
end

run Rack::URLMap.new("/" => App, "/sidekiq" => Sidekiq::Web)
