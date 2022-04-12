# frozen_string_literal: true

module Killings
  class Killing < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail"
  end
end
