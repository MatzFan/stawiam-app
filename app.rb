ENV["RACK_ENV"] ||= "development"

require "bundler"
Bundler.require(:default, ENV["RACK_ENV"])
class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure :development do
    register Sinatra::Reloader
  end

  set :app_file, __FILE__
  set :haml, format: :html5
  set :root, File.dirname(__FILE__)
  set :views, File.join(root, "app/views")

  # Load all initializers
  require File.join(root, "/config/initializers/auto_loader.rb")
end
