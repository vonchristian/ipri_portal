# frozen_string_literal: true

module Victims
  class CollectiveVictim < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail", counter_cache: :collective_victims_count
    has_many :age_bracket_breakdowns, class_name: "Victims::AgeBracketBreakdown", dependent: :destroy
    accepts_nested_attributes_for :age_bracket_breakdowns
  end
end
