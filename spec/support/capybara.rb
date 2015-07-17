require "capybara/rails"
require "capybara/rspec"
require "capybara/poltergeist"

Capybara.javascript_driver = :poltergeist
Capybara.default_selector = :css
Capybara.default_wait_time = 5
Capybara.ignore_hidden_elements = false
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, { js_errors: false, js_warnings: false })
end
