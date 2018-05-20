require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load

ENV.update YAML.load(File.read(File.expand_path('../application.yml', __FILE__)))

module EzyPortal
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators do |g|
      g.test_framework  nil
      g.assets  false
      g.helper false
      g.stylesheets false
      g.test_unit false
      g.jbuilder false
    end
  end
end
