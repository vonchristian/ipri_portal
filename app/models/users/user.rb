# frozen_string_literal: true

module Users
  class User < ApplicationRecord
    has_secure_password
  end
end
