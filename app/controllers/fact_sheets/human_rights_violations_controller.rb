# frozen_string_literal: true

module FactSheets
  class HumanRightsViolationsController < ApplicationController
    def index
      @fact_sheet = FactSheet.find(params.fetch(:fact_sheet_id))
    end
  end
end