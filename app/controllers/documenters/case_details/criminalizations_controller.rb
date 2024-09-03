# frozen_string_literal: true

module Documenters
  module CaseDetails
    class CriminalizationsController < Documenters::BaseController
      layout "documenter"

      def index
        @case_detail = ::CaseDetails::CaseDetail.find(params[:case_detail_id])
        @criminalizations = @case_detail.criminalizations
      end

      def edit
        @case_detail = ::CaseDetails::CaseDetail.find(params[:case_detail_id])
        @criminalization = @case_detail.criminalizations.find(params[:id])
      end

      def update
        @case_detail = ::CaseDetails::CaseDetail.find(params[:case_detail_id])
        @criminalization = @case_detail.criminalizations.find(params[:id])
        @criminalization.update(criminalization_params)
        if @criminalization.valid?
          @criminalization.save!

          respond_to do |format|
            format.html do
              redirect_to documenters_case_detail_criminalizations_url(@case_detail)
            end
          end
        else
          respond_to do |format|
            format.html do
              render :edit, status: :unprocessable_entity
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
            :impact_to_community_details
          )
      end
    end
  end
end
