# frozen_string_literal: true

module Killings
  class Killing < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail"
    has_many :perpetratorizations
    has_many :killing_perpetrator_categories, through: :perpetratorizations
  end
end
