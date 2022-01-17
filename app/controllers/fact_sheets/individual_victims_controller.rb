# frozen_string_literal: true

module FactSheets
  class IndividualVictimsController < ApplicationController
    def new
      @temp_fact_sheet = Tmps::FactSheet.find(params.fetch(:temp_fact_sheet_id))
      @individual_victim = FactSheets::Victims::Individual.new
    end

    def create
      @temp_fact_sheet = Tmps::FactSheet.find(params.fetch(:temp_fact_sheet_id))
      @individual_victim = FactSheets::Victims::Individual.new(individual_victim_params)
      if @individual_victim.valid?
        @individual_victim.process!

        redirect_to fact_sheets_temp_fact_sheet_victims_url(@temp_fact_sheet)
      else
        render :new
      end
    end

    private

    def individual_victim_params
      params.require(:fact_sheets_victims_individual)
      .permit(:temp_fact_sheet_id, :gender, :full_name, :dependent_type, :ethnic_identity, :victim_role, :dependent_details,
        :age_bracket_id, :date_of_birth_day, :date_of_birth_month, :date_of_birth_year)
      .merge!(temp_fact_sheet_id: @temp_fact_sheet.id)
    end
  end
end