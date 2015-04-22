![logo](https://raw.githubusercontent.com/FreakTags/core/master/public/assets/images/logo/readme-logo.png)
====
> What have you been watching ?

FreakTags is a simple *media-tracker* for you to keep up with all your favorite shows.

## Statistics
[![Codeship Status for freaktags/core](https://img.shields.io/codeship/55647cb0-2fe7-0132-1216-3ad622bf587e/master.svg?style=flat)](https://codeship.io/projects/39670)
[![Stories in Ready](https://badge.waffle.io/freaktags/core.png?label=ready&title=Ready)](https://waffle.io/freaktags/core)
[![Stories in Roadmap](https://badge.waffle.io/freaktags/core.png?label=roadmap&title=Roadmap)](https://waffle.io/freaktags/core)
[![$$](http://img.shields.io/gratipay/marceloboeira.svg?style=flat)](https://gratipay.com/marceloboeira/)
[![Dependency Status](https://gemnasium.com/freaktags/core.svg)](https://gemnasium.com/freaktags/core)
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/FreakTags/core/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

[![IssueStats](http://issuestats.com/github/freaktags/core/badge/pr?style=flat)](http://issuestats.com/github/freaktags/core "IssueStats")
[![IssueStats](http://issuestats.com/github/freaktags/core/badge/issue?style=flat)](http://issuestats.com/github/freaktags/core "IssueStats")


[![Throughput Graph](https://graphs.waffle.io/freaktags/core/throughput.svg)](https://waffle.io/freaktags/core/metrics)

### Coverage

[![Code Climate](https://codeclimate.com/github/freaktags/core/badges/gpa.svg)](https://codeclimate.com/github/freaktags/core)
[![Test Coverage](https://codeclimate.com/github/freaktags/core/badges/coverage.svg)](https://codeclimate.com/github/freaktags/core)

### Contribute

* [Triage](http://www.codetriage.com/freaktags/core)
* Contributor Guide - Coming soon

## Let's run it

### Preparing environment

* Install rvm, Ruby(2.2), Rails(4.2), PostgreSQL
* Get inside the project folder and run:
  * `bundle`
  * `rake db:create db:migrate rake db:seed`

Problems? see our [FAQ.md](https://github.com/freaktags/core/blob/master/FAQ.md)

### Showtime

Now that everything is set, lets start the server:

  * `rails s`
  * Open `http://localhost:3000` on your favorite browser and see the magic


### .env

In order to create non-hard-coded use of params we use environment variables to manage several stuff, if you need to setup a server or test a specific feature please remember to set the .env file.

Check out the environment params you can set:

* `RAILS_ENV` - Rails environment. Ex.:`development`, `test`, `beta`, `production`.
* `CODECLIMATE_REPO_TOKEN` - Code Climate token.
* `FT_LOCALE` - Locale to language and currencies. Currently support: `en`, `pt-BR`.
* `FT_NEWRELIC_KEY` - NewRelic API Key to monitor the app.
* `FT_DEVISE_SECRET` - Devise unique secret to generate secure tokens.
* `FT_HOST` - Server host domain or ip address.
* `FT_MAIL_SENDER` - Default address to send email from. Ex.: `noreply@yourhost.com`
* `FT_MAIL_SERVER` - Default mail server. Ex.: `mail.yourhost.com`
* `FT_MAIL_PORT` - Default mail port. Ex.: `587`
* `FT_MAIL_TTLS` - Use TTLS. Ex.: `true`, `false`
* `FT_MAIL_USERNAME` - Default mail username. Ex.: `root@yourhost.com`
* `FT_MAIL_PASSWORD` - Default mail password. Ex.: `my$ecureP4$$w0rd`
* `FT_MAIL_AUTH` - Default mail authentication style. Ex.: `text`, `login`
* `FT_MAIL_DOMAIN` - Default mail domain. Ex.: `beta.yourhost.com`, `yourhost.com`
* `FT_DATABSE_URL` - Database URL to connect with your DB.
$ `FT_GA_ID` - Google Analytics Tracking ID.


## Open source stack

  * Core - App's main base
    * [Ruby](https://www.ruby-lang.org) - A dynamic, open source and elegant syntax programming language
      * [rvm](http://rvm.io) - Ruby version manager
    * [Rails](http://rubyonrails.org) - an Open-source web framework optimized for programmer happiness and sustainable productivity
      * Models
        * [enumerate_it](https://github.com/cassiomarques/enumerate_it) - Awesome enum support gem
        * [friendly_id](https://github.com/norman/friendly_id) - Create slugs like a boss
        * [paranoia](https://github.com/radar/paranoia) - act_as_paranoid for rails 4
        * [birthday](https://github.com/railslove/birthday) - look for birthdays without a hassle.
    * [PostgreSQL](http://www.postgresql.org) -  A powerful, open source object-relational database system.
    * Server
      * [Puma](http://puma.io) - A modern, concurrent ruby web server
      * [Sidekiq](http://sidekiq.org) - Simple, efficient background processing for Ruby
  * Authentication
    * [Devise](https://github.com/plataformatec/devise) - Flexible authentication solution for Rails with Warden
  * Authorizatoin
    * [CanCanCan](https://github.com/CanCanCommunity/cancancan) - Authorization gem for RoR
  * Social
    * [PublicActivity](https://github.com/pokonski/public_activity) - Easy activity tracking for models - similar to Github's Public Activity.
    * [ActsAsFollower](https://github.com/tcocca/acts_as_follower) - A Gem to add Follow functionality for models

  * Tests
    * [Rspec](https://github.com/rspec/rspec) - RSpec meta-gem that depends on the other components
    * [Faker](https://github.com/stympy/faker) - A library for generating fake data such as names, addresses, and phone numbers
    * [FactoryGirl](https://github.com/thoughtbot/factory_girl) - A library for setting up Ruby objects as test data
    * [Capybara](https://github.com/thoughtbot/capybara-webkit) - Headless WebKit so you can test Javascript web apps
    * [Shoulda](https://github.com/thoughtbot/shoulda) - Makes tests easy on the fingers and the eyes
    * [Poltergeist](https://github.com/teampoltergeist/poltergeist) -  PhantomJS driver for Capybara
    * [PhantonJS](http://phantomjs.org) - A headless WebKit scriptable with a JavaScript API
    * [CodeClimate](http://codeclimate.com) - Awesome test coverage tool
  * Development
    * [Bullet](https://github.com/flyerhzm/bullet) - Monitoring N+1 queries and unused eager loading
    * [Letter Opener](https://github.com/ryanb/letter_opener) - Preview mail in the browser instead of sending
    * [dotenv](https://github.com/bkeepers/dotenv) - Loads environment variables from `.env`
  * Assets
    * [Rails Assets](http://rails-assets.org) - Best solution to assets management in Rails
  * Deployment
    * [CodeShip](http://codeship.io) - Our awesome CI Server
    * [Heroku](http://heroku.com) - Our Application server
  * Monitoring
    * [NewRelic](http://newrelic.com) - Really awesome app monitoring system
