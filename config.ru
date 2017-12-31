require "./app"
require "sidekiq/web"

if App.production? || App.staging?
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == AppConfig.sidekiq.username && password == AppConfig.sidekiq.password
  end
end

run App

run Rack::URLMap.new("/" => App, "/sidekiq" => Sidekiq::Web)
