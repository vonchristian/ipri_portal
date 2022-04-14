# frozen_string_literal: true

module AdminUsers
  class Session
    include ActiveModel::Model

    attr_accessor :email, :password
    validates :email, email: true
    validates :email, :password, presence: true

    def find_admin_user
      Users::AdminUser.find_by(email: email)
    end

    def valid_password?
      find_admin_user&.authenticate(password)
    end
  end
end
