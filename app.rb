ENV["RACK_ENV"] ||= "development"

require "bundler"
Bundler.require(:default, ENV["RACK_ENV"].to_sym)

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register WillPaginate::Sinatra

  set :app_file, __FILE__
  set :haml, format: :html5, layout: :application
  set :root, File.dirname(__FILE__)
  set :sprockets, Sprockets::Environment.new
  set :views, File.join(root, "app/views")

  # Load all initializers
  require File.join(root, "/config/initializers/auto_loader.rb")

  # Assets
  sprockets.append_path "app/assets/stylesheets"
  sprockets.append_path "app/assets/javascripts"
  # Workaround https://github.com/glebm/popper_js-rubygem/issues/5
  sprockets.append_path(
    File.join(Gem::Specification.find_by_name("popper_js").gem_dir, "assets", "javascripts"),
  )
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
end
