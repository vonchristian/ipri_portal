# frozen_string_literal: true

module Users
  class Documenter < ApplicationRecord
    has_secure_password

    validates :email, :first_name, :last_name, presence: true
  end
end
