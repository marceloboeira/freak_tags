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
  * `bundle` -> It will install all packages (Gems), check the Gemfile
  * `rake db:create` -> It will create the database, check the credentials at `config/database.yml`
  * `rake db:migrate` -> It will run all migrations placed at `db/migrate`
  * `rake db:seed` -> It will create the database records basic needs to run, check `db/seeds.rb` for more info

### Showtime
Now that you successfuylly

  * rails s -> To start the server
  * Open `http://localhost:3000` on your favorite browser and see the magic.


