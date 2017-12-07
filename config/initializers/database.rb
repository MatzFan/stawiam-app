ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"]) if App.production? || App.staging?
