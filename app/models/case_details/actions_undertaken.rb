# frozen_string_literal: true

module CaseDetails
  class ActionsUndertaken < ApplicationRecord
    belongs_to :case_detail
  end
end
