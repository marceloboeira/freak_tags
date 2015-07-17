ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require "support/code_climate"

require "rspec/rails"
require "shoulda/matchers"
require "faker"

require "support/active_record_shared_connection_patch"
require "support/capybara"
require "support/factory_girl"
require "support/public_activity"
require "support/wait_steps"
require "support/warden"

# Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.infer_spec_type_from_file_location!
end

