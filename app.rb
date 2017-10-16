require "pry"
require "sinatra/base"
require "sinatra/reloader"

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  set :app_file, __FILE__
  set :root, File.dirname(__FILE__)

  # Load all initializers
  require File.join(root, '/config/initializers/auto_loader.rb')

  get "/" do
    "Hello world!"
  end
end
