# frozen_string_literal: true

module Criminalizations
  class Criminalization < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail"
    has_many :accuserizations, dependent: :destroy
    has_many :accuser_categories, through: :accuserizations
  end
end
