# frozen_string_literal: true

module FactSheets
  class IncidentDetailsController < ApplicationController
    def new
      @fact_sheet = FactSheet.find(params.fetch(:fact_sheet_id))
      @incident_detail = FactSheets::Incident.new
    end

    def create
      @fact_sheet = FactSheet.find(params.fetch(:fact_sheet_id))
      @incident_detail = FactSheets::Incident.new(incident_params)
      if @incident_detail.valid?
        @incident_detail.process!
        redirect_to fact_sheets_fact_sheet_victims_url(@fact_sheet)
      else
        render :new
      end
    end

    private

    def incident_params
      params.require(:fact_sheets_incident)
      .permit(:country_id, :fact_sheet_id, :subnational_location, :location_details_1, :location_details_2,
        :incident_start_month, :incident_start_year, :incident_start_day,
        :incident_end_month, :incident_end_year, :incident_end_day,
        :incident_hour, :incident_minute)
      .merge!(fact_sheet_id: @fact_sheet.id)
    end
  end
end
