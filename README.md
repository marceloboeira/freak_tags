FreakTags [![Codeship Status for freaktags/core](https://img.shields.io/codeship/55647cb0-2fe7-0132-1216-3ad622bf587e/master.svg?style=flat)](https://codeship.io/projects/39670)
====

## Statistics
[![Stories in Ready](https://badge.waffle.io/freaktags/core.png?label=ready&title=Ready)](https://waffle.io/freaktags/core)
[![Stories in Roadmap](https://badge.waffle.io/freaktags/core.png?label=roadmap&title=Roadmap)](https://waffle.io/freaktags/core)
[![$$](http://img.shields.io/gratipay/marceloboeira.svg?style=flat)](https://gratipay.com/marceloboeira/)
[![Dependency Status](https://gemnasium.com/freaktags/core.svg)](https://gemnasium.com/freaktags/core)

[![Throughput Graph](https://graphs.waffle.io/freaktags/core/throughput.svg)](https://waffle.io/freaktags/core/metrics)

### Coverage

[![Code Climate](https://codeclimate.com/github/freaktags/core/badges/gpa.svg)](https://codeclimate.com/github/freaktags/core)
[![Test Coverage](https://codeclimate.com/github/freaktags/core/badges/coverage.svg)](https://codeclimate.com/github/freaktags/core)



## Let's run it

### Preparing environment

* Install rvm, ruby(2.2), rails(4.2), nodejs(>0.10), bower
* Get inside the project folder and run:
  * `bundle`
  * `rake db:create db:migrate`
  * `rake db:seed`

Problems? see our [FAQ.md](https://github.com/freaktags/core/blob/master/FAQ.md)

### Showtime

Now that everything is set, lets start the server:

  * `rails s`
  * Open `http://localhost:3000` on your favorite browser and see the magic


## Open source stack

  * Core - App's main base
    * [Ruby](https://www.ruby-lang.org) - A dynamic, open source and elegant syntax programming language
      * [rvm](http://rvm.io) - Ruby version manager
    * [Rails](http://rubyonrails.org) - an Open-source web framework optimized for programmer happiness and sustainable productivity
      * Models
        * [enumarate_it](https://github.com/cassiomarques/enumerate_it) - Awesome enum support gem
    * [PostgreSQL](http://www.postgresql.org) -  A powerful, open source object-relational database system.
    * Server
      * [Puma](http://puma.io) - A modern, concurrent ruby web server
      * [Sidekiq](http://sidekiq.org) - Simple, efficient background processing for Ruby
  * Authentication
    * [Devise](https://github.com/plataformatec/devise) - Flexible authentication solution for Rails with Warden
  * Authorizatoin
    * [CanCanCan](https://github.com/CanCanCommunity/cancancan) - Authorization gem for RoR
  * Social
    * [Amistad](https://github.com/raw1z/amistad) - Adds friendships management into a rails application
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
