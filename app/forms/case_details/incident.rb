# frozen_string_literal: true

module CaseDetails
  class Incident
    include ActiveModel::Model

    attr_accessor :country_id,
      :case_detail_id,
      :subnational_location,
      :location_details_1,
      :location_details_2,
      :incident_start_month,
      :incident_start_year,
      :incident_start_day,
      :incident_end_month,
      :incident_end_year,
      :incident_end_day,
      :ongoing_case,
      :incident_time

    validates :country_id, :subnational_location, presence: true

    def process!
      ApplicationRecord.transaction do
        update_case
      end
    end

    private

    def update_case
      CaseDetail.find(case_detail_id).update(
        country_id:           country_id,
        subnational_location: subnational_location,
        location_details_1:   location_details_1,
        location_details_2:   location_details_2,
        incident_start_day:   incident_start_day,
        incident_start_month: incident_start_month,
        incident_start_year:  incident_start_year,
        incident_end_month:   incident_end_month,
        incident_end_year:    incident_end_year,
        incident_end_day:     incident_end_day,
        incident_hour:        incident_time.present? ? incident_time.split(":").first : nil,
        incident_minute:      incident_time.present? ? incident_time.split(":").last : nil,
      )
    end
  end
end
