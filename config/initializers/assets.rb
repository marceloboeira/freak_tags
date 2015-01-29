Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( core.css )
Rails.application.config.assets.precompile += %w( landing.css ) #TODO -> remove after landing-time
Rails.application.config.assets.precompile += %w( core.js )
Rails.application.config.assets.precompile += %w[*.png *.jpg *.jpeg *.gif]
Rails.application.config.assets.precompile += %w[*.woff *.ttf *.svg *.otf *.eot]
