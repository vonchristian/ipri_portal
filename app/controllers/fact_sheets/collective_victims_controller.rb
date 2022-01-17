# frozen_string_literal: true

module FactSheets
  class CollectiveVictimsController < ApplicationController
    def new
      @fact_sheet = FactSheet.find(params.fetch(:fact_sheet_id))
      @collective_victim = FactSheets::Victims::Collective.new
    end

    def create
      @fact_sheet = FactSheet.find(params.fetch(:fact_sheet_id))
      @collective_victim = FactSheets::Victims::Collective.new(collective_victim_params)
      if @collective_victim.valid?
        @collective_victim.process!

        redirect_to fact_sheets_fact_sheet_victims_url(@fact_sheet)
      else
        render :new
      end
    end

    private

    def collective_victim_params
      params.require(:fact_sheets_victims_collective)
      .permit(:affected_total, :refer_to_individuals, :victim_details, :male_total, :female_total,  age_bracket_breakdowns: [])
      .merge!(fact_sheet_id: @fact_sheet.id)
    end
  end
end