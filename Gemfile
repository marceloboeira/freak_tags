source 'https://rubygems.org'

gem 'rails', '4.1.8'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.0'
gem 'bower-rails', '~> 0.3.0'
gem 'birthday', '~> 0.3.0'
gem 'enumerate_it', '>= 1.2.3'
gem 'validates_existence', '0.4'


# To Implement
# gem 'cancan', '1.6.10'
# gem 'kaminary', '0.16.1'
# gem 'validates_timeliness', '3.0'

group :development, :test do
  gem 'spring'
  gem 'sqlite3'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'rspec-expectations'

  gem 'capistrano'
  gem 'capistrano-rails'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'guard-rspec'
  gem "codeclimate-test-reporter", require: false
  gem 'coveralls', require: false
end

group :production do
  gem 'newrelic_rpm'
  gem 'unicorn'
  gem 'sidekiq'
end

