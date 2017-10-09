require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MercuryAdmin
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.filepicker_rails.api_key = Rails.application.secrets.filepicker_api_key
    config.action_cable.url = Rails.application.secrets.action_cable_url
  end
end
