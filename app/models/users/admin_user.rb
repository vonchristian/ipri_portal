# frozen_string_literal: true

module Users
  class AdminUser < ApplicationRecord
    has_secure_password

    validates :email, presence: true
  end
end
