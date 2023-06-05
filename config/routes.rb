# frozen_string_literal: true

Spree::Core::Engine.routes.draw do
  namespace :admin do
    get '/seven/sms', to: 'sms#index', as: :seven_sms_index
    post '/seven/sms', to: 'sms#submit', as: :seven_sms_submit
  end
end
