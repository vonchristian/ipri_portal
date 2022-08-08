# frozen_string_literal: true

module IpRights
  class HumanRightsViolationsController < ApplicationController
    layout "documenter"

    def index
      @case_detail = CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
    end

    def new
      @case_detail            = CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
      @human_rights_violation = @case_detail.human_rights_violations.build
    end

    def create
      @case_detail            = CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
      @human_rights_violation = @case_detail.human_rights_violations.create(violation_params)
      if @human_rights_violation.valid?
        @human_rights_violation.save!

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

    def violation_params
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
        human_rights_violation_categories_attributes: [],
        human_rights_violation_perpetrator_categories_attributes: [],
      )
    end
  end
end