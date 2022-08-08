# frozen_string_literal: true

module IpRights
  class CriminalizationsController < ApplicationController
    layout "documenter"

    def new
      @case_detail     = CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
      @criminalization = @case_detail.criminalizations.build
    end

    def create
      @case_detail     = CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
      @criminalization = @case_detail.criminalizations.create(criminalization_params)
      if @criminalization.valid?
        @criminalization.save!

        respond_to do |format|
          format.html do
            redirect_to ip_rights_case_detail_human_rights_violations_url(@case_detail)
          end
        end
      else
        respond_to do |format|
          format.html do
            render :new, status: :unprocessable_entity
          end
        end
      end
    end

    private

    def criminalization_params
      params.require(:criminalizations_criminalization)
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