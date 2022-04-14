# frozen_string_literal: true

module Users
  class Registration
    include ActiveModel::Model

    attr_accessor :first_name, :last_name, :email, :organization_name, :phone_number

    validates :first_name, :last_name, :organization_name, :email, presence: true

    def register!
      if valid?
        create_user
        send_activation_email
      end
    end

    private

    def create_user
      Users::User.create!(
        first_name: first_name,
        last_name: last_name,
        email: email,
        password: 'Simple123',
        password_confirmation: "Simple123",
        phone_number: phone_number
      )
    end

    def send_activation_email
    end
  end
end
