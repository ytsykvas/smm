require_relative "boot"

require "rails/all"
require 'will_paginate'
require 'will_paginate-bootstrap'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SMM
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end

    config.active_record.legacy_connection_handling = false

    I18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.yml")]
    I18n.available_locales = %i[en uk]
    I18n.default_locale = :uk
  end
end
