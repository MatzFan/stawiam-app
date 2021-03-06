# Stawiam App

[![](https://img.shields.io/circleci/project/netguru/PROJECTNAME.svg?style=flat-square)](https://circleci.com/gh/netguru/PROJECTNAME)

It's a Sinatra application that automates Grzegorz's work in terms of writing down all Netguru folks
that don't lock their computers.

### Technology stack

* Sinatra 2.0
* PostgreSQL 9.6.5
* Redis server 4.0.1

## Prerequisites

 * `brew install postgresql`
 * `brew install redis`

## Installation

* `rake db:create`
* `bundle install`

## Running / Development

* Basic command to run the server is `rackup` which will run the app at `localhost:9292`. You can
also provide a different port, e.g. `rackup -p 3000`. This app already contains `Sinatra::Reloader`
but it doesn't see new files automatically so it requires to restart the server. If you want to
reload the app automatically you can use `shotgun`, however it may slow down the app a bit.
* `bundle exec sidekiq -r ./app.rb`
* Console: `irb -r ./app.rb`

### Running Tests

In the future. :grin:

### Slack integration

There are two things to cover:
1. Slack apps so it's possible to use slash commands, [more here](https://api.slack.com/slack-apps).
Once it's created please use OAuth access token and set permission scopes as `users.read`
to fetch users' data properly. The endpoint for slash command should point to `/entries`.
2. Custom integrations, namely `incoming webhooks` so the app is able to send messages via Slackbot.

### Deploying

Before a deploy you need to be a collaborator of the app on Heroku. If you are then you can follow
[this guide](https://devcenter.heroku.com/articles/collab#set-up).

### Code style

Just [ruby-style-guide](https://github.com/bbatsov/ruby-style-guide).

## Further Reading / Useful Links

[Sinatra](http://sinatrarb.com/)

## Contributing

* Fork it ( https://github.com/netguru/stawiam-app/fork )
* Create your feature branch (git checkout -b my-new-feature)
* Commit your changes (git commit -am 'Add some feature')
* Push to the branch (git push origin my-new-feature)
* Create a new Pull Request

## License

Stawiam App is [MIT Licensed](LICENSE).
