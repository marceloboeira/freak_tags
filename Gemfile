source "https://rubygems.org"
ruby "2.2.0"

gem "rails", "4.2.0"
gem "bundler", ">= 1.7.0"
gem "sass-rails", "~> 5.0.1"
gem "uglifier", ">= 1.3.0"
gem "therubyracer"

# Validators / Enumeration
gem "validates_existence", ">= 0.9.2"
gem "email_validator"
gem "date_validator"
gem "enumerate_it"

# Authentication and Authorization
gem "cancancan", "~> 1.10"
gem "devise"

# Database resources
gem "paranoia"
gem "friendly_id"
gem "pg"

# Social
gem "public_activity"
gem "acts-as-taggable-on", "~> 3.4"
gem "acts_as_follower"
gem "birthday", "~> 0.3.0"


group :development do
  gem "spring"
  gem "bullet"
  gem "letter_opener"
  gem "rubocop", require: false
end

group :test do
  gem "sqlite3"
  gem "faker"
  gem "capybara"
  gem "poltergeist"
  gem "guard-rspec"
  gem "codeclimate-test-reporter", require: false
  gem "shoulda-matchers"
  gem "factory_girl_rails"
  gem "rspec-rails"
  gem "rspec-expectations"
end

group :development, :test do
  gem "dotenv-rails"
end

group :production, :beta do
  gem "newrelic_rpm"
  gem "puma"
  gem "sidekiq"
  gem "rails_12factor"
end

source "https://rails-assets.org" do
  gem "rails-assets-underscore"
  gem "rails-assets-jquery"
  gem "rails-assets-bootstrap"
  gem "rails-assets-font-awesome"
  gem "rails-assets-animate.css"
  gem "rails-assets-moment"
  gem "rails-assets-bootbox"
  gem "rails-assets-medium-editor"
  gem "rails-assets-bootstrap-tagsinput"
end
