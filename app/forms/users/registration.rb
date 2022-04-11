# frozen_string_literal: true

module Users
  class Registration
    include ActiveModel::Model

    attr_accessor :first_name, :last_name, :email, :password, :password_confirmation, :phone_number
    validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true

    def process!
      if valid?
        create_user
        send_activation_email
      end
    end

    private

    def create_user
    end

    def send_activation_email
    end
  end
end
