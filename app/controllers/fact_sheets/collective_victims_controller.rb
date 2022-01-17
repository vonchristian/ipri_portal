# frozen_string_literal: true

module FactSheets
  class CollectiveVictimsController < ApplicationController
    def new
      @temp_fact_sheet = Tmps::FactSheet.find(params.fetch(:temp_fact_sheet_id))
      @collective_victim = FactSheets::Victims::Collective.new
    end

    def create
      @temp_fact_sheet = Tmps::FactSheet.find(params.fetch(:temp_fact_sheet_id))
      @collective_victim = FactSheets::Victims::Collective.new(collective_victim_params)
      if @collective_victim.valid?
        @collective_victim.process!

        redirect_to fact_sheets_temp_fact_sheet_victims_url(@temp_fact_sheet)
      else
        render :new
      end
    end

    private

    def collective_victim_params
      params.require(:fact_sheets_victims_collective)
      .permit(:temp_fact_sheet_id, :affected_total, :refer_to_individuals, :victim_details, :male_total, :female_total,  age_bracket_breakdowns: [])
      .merge!(temp_fact_sheet_id: @temp_fact_sheet.id)
    end
  end
end