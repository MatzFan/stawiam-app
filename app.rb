require "app_konfig"
require "haml"
require "httparty"
require "pry"
require "puma"
require "sidekiq"
require "sinatra/activerecord"
require "sinatra/base"
require "sinatra/reloader"

ENV["RACK_ENV"] ||= "development"

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
