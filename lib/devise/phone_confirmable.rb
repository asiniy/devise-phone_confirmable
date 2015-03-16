require 'devise'
require 'devise/phone_confirmable/version'

module Devise
  module Models
    module PhoneConfirmable
      extend ActiveSupport::Concern

      included do
        before_save :send_confirmation_sms, if: :phone_confirmation_required?
      end

      def send_confirmation_sms
        self.phone_confirmation_token = token
        SmsRu.sms.send(to: phone, text: I18n.t('devise.phone_confirmable.confirmation_token_for_user', token: phone_confirmation_token))
        self.phone_confirmation_sent_at = Time.now.utc
      end

      def token
        rand.to_s[2..7]
      end

      def phone_confirmation_required?
        @phone_confirmation_required ||= phone_changed?
      end

      def phone_confirm!
        self.phone_confirmed_at = Time.now.utc
        self.phone_confirmation_token = nil
        save
      end

      def active_for_authentication?
        super && phone_confirmed?
      end

      def inactive_message
        phone_confirmed? ? super : :phone_should_be_confirmed
      end

      def phone_confirmed?
        phone_confirmed_at.present? || phone_confirmation_sent_at.blank?
      end

      def skip_phone_confirmation!
        self.phone_confirmed_at = Time.now.utc
      end
    end
  end
end

Devise.add_module :phone_confirmable, controller: :phone_confirmations#, route: { phone_confirmation: [nil, ] }
