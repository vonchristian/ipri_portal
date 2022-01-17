# frozen_string_literal: true

module FactSheets
  class CriminalizationsController < ApplicationController
    def new
      @temp_fact_sheet = Tmps::FactSheet.find(params.fetch(:temp_fact_sheet_id))
      @criminalization = @temp_fact_sheet.criminalizations.build
    end

    def create
      @temp_fact_sheet = Tmps::FactSheet.find(params.fetch(:temp_fact_sheet_id))
      @criminalization = @temp_fact_sheet.criminalizations.create(criminalization_params)
      if @criminalization.valid?
        @criminalization.save!

        redirect_to new_fact_sheets_temp_fact_sheet_incident_detail_url(@temp_fact_sheet)
      else
        render :new
      end
    end

    private

    def criminalization_params
      params.require(:criminalization)
      .permit(
        :criminalization_details,
        :experienced_harrassment_or_intimidation,
        :harrassment_or_intimidation_details,
        :accusation_or_charges_details,
        :policies_or_laws_used,
        :accuser_details,
        :case_filing_status,
        :case_filing_details,
        :case_decision_status,
        :case_decision_details,
        :victims_in_detention,
        :victims_in_detention_details,
        :case_filing_against_perpetrator,
        :case_filing_against_perpetrator_details,
        :state_action_to_address_criminalization,
        :state_action_to_address_criminalization_details,
        :investigation_on_criminalization,
        :investigation_on_criminalization_details,
        :impact_to_victim_details,
        :impact_to_community_details,
        criminalization_accuser_categories_attributes: []
      )
    end
  end
end