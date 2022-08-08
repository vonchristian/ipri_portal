# frozen_string_literal: true

module IpRights
  class IncidentDetailsController < ApplicationController
    layout "documenter"

    def new
      @case_detail = CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
      @incident_detail = CaseDetails::Incident.new
    end

    def create
      @case_detail = CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
      @incident_detail = CaseDetails::Incident.new(incident_params)
      if @incident_detail.valid?
        @incident_detail.process!
        respond_to do |format|
          format.html do
            redirect_to ip_rights_case_detail_victims_url(@case_detail)
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

    def incident_params
      params.require(:case_details_incident)
      .permit(:country_id, :subnational_location, :location_details_1, :location_details_2,
        :incident_start_month, :incident_start_year, :incident_start_day,
        :incident_end_month, :incident_end_year, :incident_end_day,
        :incident_hour, :incident_minute)
      .merge!(case_detail_id: @case_detail.id)
    end
  end
end
