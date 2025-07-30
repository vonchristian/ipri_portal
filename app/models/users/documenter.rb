# frozen_string_literal: true

module Users
  class Documenter < ApplicationRecord
    has_secure_password
    belongs_to :country, optional: true

    enum :role, {
      ipri_employee: "IPRI Employee",
      country_partner: "Country Partner",
    }

    validates :email, :first_name, :last_name, presence: true

    has_many :case_details, class_name: "CaseDetails::CaseDetail", dependent: :nullify

    def full_name
      "#{first_name} #{last_name}"
    end

    def self.ransackable_associations(auth_object = nil)
      ["case_details"]
    end

    def self.ransackable_attributes(auth_object = nil)
      ["country_id", "created_at", "email", "first_name", "id", "id_value", "last_name", "locale", "password_digest", "phone_number", "role", "updated_at"]
    end
  end
end
