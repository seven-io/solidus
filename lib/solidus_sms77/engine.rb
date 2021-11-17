# frozen_string_literal: true

require 'solidus_core'
require 'solidus_support'

module SolidusSms77
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace ::Spree

    engine_name 'solidus_sms77'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer "spree.sms77.environment", before: :load_config_initializers do |app|
      SolidusSms77::Config = Spree::Sms77Configuration.new
      SolidusSms77::Config.use_static_preferences!
    end


  end
end
