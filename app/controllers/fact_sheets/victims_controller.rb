# frozen_string_literal: true

module FactSheets
  class VictimsController < ApplicationController
    def index
      @temp_fact_sheet = Tmps::FactSheet.find(params.fetch(:temp_fact_sheet_id))
    end
  end
end