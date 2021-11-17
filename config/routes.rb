# frozen_string_literal: true

Spree::Core::Engine.routes.draw do
  namespace :admin do
    get '/sms77/sms', to: 'sms#index', as: :sms77_sms_index
    post '/sms77/sms', to: 'sms#submit', as: :sms77_sms_submit
  end
end
