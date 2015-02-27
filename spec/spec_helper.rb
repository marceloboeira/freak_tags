ENV["RAILS_ENV"] ||= "test"

require "codeclimate-test-reporter"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "capybara/rails"
require "capybara/rspec"
require "capybara/poltergeist"
require "shoulda/matchers"
require "factory_girl_rails"
require "faker"

include Warden::Test::Helpers
CodeClimate::TestReporter.start if ENV["CODECLIMATE_REPO_TOKEN"].present?
Warden.test_mode!

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.infer_spec_type_from_file_location!
  Capybara.javascript_driver = :poltergeist
  Capybara.default_wait_time = 5
end
