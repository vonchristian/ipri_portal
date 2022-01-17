# frozen_string_literal: true

module FactSheets
  class Incident
    include ActiveModel::Model

    attr_accessor :country_id, :fact_sheet_id, :subnational_location, :location_details_1, :location_details_2,
    :incident_start_month, :incident_start_year, :incident_start_day,
    :incident_end_month, :incident_end_year, :incident_end_day,
    :incident_hour, :incident_minute

    def process!
      ApplicationRecord.transaction do
        update_fact_sheet
      end
    end

    private

    def update_fact_sheet
      FactSheet.find(fact_sheet_id).update(
        country_id:           country_id,
        subnational_location: subnational_location,
        location_details_1:   location_details_1,
        location_details_2:   location_details_2,
        incident_start_day:   incident_start_day,
        incident_start_month: incident_start_month,
        incident_start_year:  incident_start_year,
        incident_start_day:   incident_start_day,
        incident_end_month:   incident_end_month,
        incident_end_year:    incident_end_year,
        incident_end_day:     incident_end_day,
        incident_hour:        incident_hour,
        incident_minute:      incident_minute
      )
    end
  end
end