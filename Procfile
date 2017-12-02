web: bundle exec puma -p $PORT -e $RACK_ENV -t 0:5
worker: bundle exec sidekiq -e $RACK_ENV -r ./app.rb
