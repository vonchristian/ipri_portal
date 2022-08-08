# frozen_string_literal: true

module IpRights
  class ImpactAndActionsController < ApplicationController
    layout "documenter"

    def new
      @case_detail       = CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
      @impact_and_action = CaseDetails::ImpactAndAction.new
    end

    def create
      @case_detail       = CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
      @impact_and_action = CaseDetails::ImpactAndAction.new(impact_and_action_params)
      if @impact_and_action.valid?
        @impact_and_action.process!

        respond_to do |format|
          format.html do
            redirect_to ip_rights_case_detail_development_projects_url(@case_detail)
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

    def impact_and_action_params
      params.require(:case_details_impact_and_action).
      permit(
        :impact_to_victim_details,
        :impact_to_community_details,
        :actions_taken_status,
        :actions_taken_details
      ).merge!(case_detail_id: @case_detail.id)
    end
  end
end
