require "sinatra/base"
require "sinatra/reloader"

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  set :app_file, __FILE__
  set :root, File.dirname(__FILE__)

  get "/" do
    "Hello world!"
  end
end
