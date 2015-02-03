require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(*Rails.groups)

module FreakTags
  class Application < Rails::Application
    #19 - Enumerations - https://github.com/freaktags/core/issues/19
    config.autoload_paths << "#{Rails.root}/app/models/enumerations/"

    #35 - Personal Validators - https://github.com/freaktags/core/issues/35
    config.autoload_paths << "#{Rails.root}/lib/validators/"

    # TimeZone
    config.time_zone = 'Brasilia'

    # Locales
    config.i18n.default_locale = config.i18n.locale = :"en"

    # Assets
    config.assets.paths << Rails.root.join('app', 'assets')

    config.generators do |g|
      g.test_framework :rspec,
        :fixtures => true,
        :view_specs => false,
        :helper_specs => true,
        :routing_specs => false,
        :controller_specs => false,
        :request_specs => true
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end

    #44 - Mail settings - https://github.com/freaktags/core/issues/44
    config.action_mailer.default_url_options = { :host => ENV['FT_HOST'] }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      :address   => ENV['FT_MAIL_SERVER'],
      :port      => ENV['FT_MAIL_PORT'],
      :enable_starttls_auto => ENV['FT_MAIL_TTLS'],
      :user_name => ENV['FT_MAIL_USERNAME'],
      :password  => ENV['FT_MAIL_PASSWORD'],
      :authentication => ENV['FT_MAIL_AUTH'],
      :domain => ENV['FT_MAIL_DOMAIN']
    }

  end
end
