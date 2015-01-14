require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(*Rails.groups)

module FreakTags
  class Application < Rails::Application
    
    config.i18n.default_locale = :en    
    config.assets.paths << Rails.root.join('app', 'assets', 'components')
  end
end
