# frozen_string_literal: true

module FactSheets
  class IndividualVictimsController < ApplicationController
    def new
      @fact_sheet = FactSheet.find(params.fetch(:fact_sheet_id))
      @individual_victim = FactSheets::Victims::Individual.new
    end

    def create
      @fact_sheet = FactSheet.find(params.fetch(:fact_sheet_id))
      @individual_victim = FactSheets::Victims::Individual.new(individual_victim_params)
      if @individual_victim.valid?
        @individual_victim.process!

        redirect_to fact_sheets_fact_sheet_victims_url(@fact_sheet)
      else
        render :new
      end
    end

    private

    def individual_victim_params
      params.require(:fact_sheets_victims_individual)
      .permit(:gender, :full_name, :dependent_type, :ethnic_identity, :victim_role, :dependent_details,
        :age_bracket_id, :date_of_birth_day, :date_of_birth_month, :date_of_birth_year)
      .merge!(fact_sheet_id: @fact_sheet.id)
    end
  end
end