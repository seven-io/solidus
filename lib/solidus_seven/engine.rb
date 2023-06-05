# frozen_string_literal: true

require 'solidus_core'
require 'solidus_support'

module SolidusSeven
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace ::Spree

    engine_name 'solidus_seven'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer "spree.seven.environment", before: :load_config_initializers do |app|
      SolidusSeven::Config = Spree::SevenConfiguration.new
      SolidusSeven::Config.use_static_preferences!
    end


  end
end
