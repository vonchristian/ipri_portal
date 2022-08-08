# frozen_string_literal: true

class Country < ApplicationRecord
  has_many :case_details, class_name: "CaseDetails::CaseDetail"

  validates :name, presence: true, uniqueness: true
end