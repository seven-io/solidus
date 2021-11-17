module Spree
  class Sms77Configuration < Spree::Preferences::Configuration
    preference :api_key, :string

    Spree::Backend::Config.configure do |config|
      config.menu_items << config.class::MenuItem.new(
        [:sms77],
        'envelope',
        url: '/admin/sms77/sms'
      )
    end
  end
end