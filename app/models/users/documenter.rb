# frozen_string_literal: true

module Users
  class Documenter < ApplicationRecord
    has_secure_password

    enum role: {
      ipri_employee: "IPRI Employee",
      country_partner: "Country Partner",
    }

    validates :email, :first_name, :last_name, presence: true

    has_many :case_details, class_name: "CaseDetails::CaseDetail", dependent: :nullify
  end
end
