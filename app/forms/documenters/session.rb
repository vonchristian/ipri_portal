# frozen_string_literal: true

module Documenters
  class Session
    include ActiveModel::Model

    attr_accessor :email, :password

    validates :email, email: true
    validates :email, :password, presence: true

    def find_user
      Users::Documenter.find_by(email: email)
    end

    def valid_password?
      find_user&.authenticate(password)
    end
  end
end
