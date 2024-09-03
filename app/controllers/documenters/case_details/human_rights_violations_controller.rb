# frozen_string_literal: true

module Documenters
  module CaseDetails
    class HumanRightsViolationsController < Documenters::BaseController
      layout "documenter"

      def index
        @case_detail = ::CaseDetails::CaseDetail.find(params[:case_detail_id])
        @human_rights_violations = @case_detail.human_rights_violations
      end

      def new
        @case_detail = ::CaseDetails::CaseDetail.find(params[:case_detail_id])
        @categories = HumanRightsViolations::Category.all
        @human_rights_violation = @case_detail.human_rights_violations.build
        @human_rights_violation.categorizations.build
        @human_rights_violation.perpetratorizations.build
      end

      def create
        @case_detail            = ::CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
        @categories             = HumanRightsViolations::Category.all
        @human_rights_violation = @case_detail.human_rights_violations.create(human_rights_violation_params)
        if @human_rights_violation.valid?
          @human_rights_violation.save!

          respond_to do |format|
            format.html do
              redirect_to documenters_case_detail_human_rights_violations_url(@case_detail)
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

      def edit
        @case_detail            = ::CaseDetails::CaseDetail.find(params[:case_detail_id])
        @categories             = HumanRightsViolations::Category.all
        @human_rights_violation = @case_detail.human_rights_violations.find(params[:id])
      end

      def update
        @case_detail            = ::CaseDetails::CaseDetail.find(params[:case_detail_id])
        @human_rights_violation = @case_detail.human_rights_violations.find(params[:id])
        @categories             = HumanRightsViolations::Category.all
        if @human_rights_violation.update(human_rights_violation_params)
          @human_rights_violation.save!

          respond_to do |format|
            format.html do
              redirect_to documenters_case_detail_human_rights_violations_url(@case_detail)
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

      def human_rights_violation_params
        params.require(:human_rights_violations_human_rights_violation)
        .permit(
          :violation_details,
          :alleged_perpetrators_known,
          :alleged_perpetrator_details,
          :case_filing_status,
          :case_filing_details,
          :state_action_to_address_violation,
          :state_action_to_address_violation_details,
          :investigation_on_violation,
          :investigation_on_violation_details,
          :impact_to_victim_details,
          :impact_to_community_details,
          categorizations_attributes: [:human_rights_violation_category_id],
          perpetratorizations_attributes: [:perpetrator_category_id],
        )
      end
    end
  end
end
