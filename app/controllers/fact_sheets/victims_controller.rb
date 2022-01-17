# frozen_string_literal: true

module FactSheets
  class VictimsController < ApplicationController
    def index
      @fact_sheet = FactSheet.find(params.fetch(:fact_sheet_id))
    end
  end
end