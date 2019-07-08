require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bittomo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.

    # 日本語化
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # rails g 実行時にやることやらないことを定義
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.test_framework :rspec, view_specs: false, routing_specs: false, fixture: true
      g.fixture_replacement :factory_bot, dir: "spec/support/factories"
    end
  end
end
