# frozen_string_literal: true

require 'sms77/client'

module Spree
  module Admin
    class SmsController < Spree::Admin::BaseController
      attr_accessor :user_errors

      def initialize
        super
        @user_errors = []
      end

      def index(user_message = nil)
        @user_message = user_message
        render 'spree/admin/sms'
      end

      def submit
        index(send_sms)
      end

      private

      def build_recipients(as_array: false)
        to = []

        Rails.logger.debug params.inspect

        Spree::UserAddress.all.each { |a|
          next if a.archived && params[:filter_include_archived_addresses] == '0'
          next if params[:filter_address_country] && !params[:filter_address_country].include?(a.address.country_id.to_s)

          to.push(a.address.phone)
        }

        if to.empty?
          @user_errors.push(I18n.t 'spree.no_recipients')
        end

        to.uniq!

        as_array ? to : to.join(',')
      end

      def api_key
        if SolidusSms77::Config[:api_key]
          return SolidusSms77::Config[:api_key]
        end

        if ENV['SMS77_DUMMY_API_KEY']
          return ENV['SMS77_DUMMY_API_KEY']
        end

        ENV['SMS77_API_KEY']
      end

      def build_params
        params.to_unsafe_h.slice(
          :debug,
          :flash,
          :foreign_id,
          :from,
          :label,
          :no_reload,
          :performance_tracking,
          :text,
        ).merge({ json: true, to: build_recipients })
      end

      def send_sms
        if @user_errors.empty?
          Sms77::Resources::Sms.new(api_key).retrieve(build_params)
        end
      end
    end
  end
end
