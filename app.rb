ENV["RACK_ENV"] ||= "development"

require "bundler"
Bundler.require(:default, ENV["RACK_ENV"].to_sym)

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register WillPaginate::Sinatra
  use Rollbar::Middleware::Sinatra

  configure :development do
    register Sinatra::Reloader
  end

  set :app_file, __FILE__
  set :haml, format: :html5, layout: :application
  set :root, File.dirname(__FILE__)
  set :sprockets, Sprockets::Environment.new
  set :views, File.join(root, "app/views")

  # Assets
  sprockets.append_path "app/assets/stylesheets"
  sprockets.append_path "app/assets/javascripts"
  sprockets.js_compressor  = Uglifier.new(harmony: true)
  sprockets.css_compressor = :scss
  get "/app/assets/*" do
    env["PATH_INFO"].sub!("/app/assets", "")
    settings.sprockets.call(env)
  end

  # Root path
  get "/" do
    redirect "/entries"
  end

  not_found do
    redirect "/entries"
  end

  def self.staging?
    environment == :staging
  end

  # Load all initializers
  require File.join(root, "/config/initializers/auto_loader.rb")
end
