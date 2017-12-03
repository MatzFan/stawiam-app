ENV["RACK_ENV"] ||= "development"

require "bundler"
Bundler.require(:default, ENV["RACK_ENV"])
class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set :app_file, __FILE__
  set :haml, format: :html5
  set :environment, Sprockets::Environment.new
  set :root, File.dirname(__FILE__)
  set :views, File.join(root, "app/views")

  # Load all initializers
  require File.join(root, "/config/initializers/auto_loader.rb")

  # Assets
  environment.append_path "app/assets/stylesheets"
  environment.append_path "app/assets/javascripts"
  # Workaround https://github.com/glebm/popper_js-rubygem/issues/5
  environment.append_path(
    File.join(Gem::Specification.find_by_name("popper_js").gem_dir, "assets", "javascripts"),
  )
  environment.js_compressor  = Uglifier.new(harmony: true)
  environment.css_compressor = :scss
  get "/app/assets/*" do
    env["PATH_INFO"].sub!("/app/assets", "")
    settings.environment.call(env)
  end
end
