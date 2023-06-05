module Spree
  class SevenConfiguration < Spree::Preferences::Configuration
    preference :api_key, :string

    Spree::Backend::Config.configure do |config|
      config.menu_items << config.class::MenuItem.new(
        [:seven],
        'envelope',
        url: '/admin/seven/sms'
      )
    end
  end
end