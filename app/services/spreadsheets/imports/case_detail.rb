# frozen_string_literal: true

module Spreadsheets
  module Imports
    class CaseDetail < ActiveInteraction::Base
      hash :case_data, strip: false

      def execute
        create_case_detail

        @case_detail
      end

      private

      def create_case_detail
        @case_detail = CaseDetails::CaseDetail.create!(
          reference_number: SecureRandom.uuid,
          organization_name: case_data["Organization / Affiliation"] || "No Organization",
          submission_date_year: parse_submission_date(case_data["Submission Date"]).year,
          submission_date_day: parse_submission_date(case_data["Submission Date"]).day,
          submission_date_month: parse_submission_date(case_data["Submission Date"]).strftime("%B"),
          primary_data: primary_data(case_data["Is the documenter submitting this case factsheet as primary data?"]),
          data_sharing: data_sharing(case_data["As the documenter, I understand that Indigenous Peoples Rights International (IPRI) will record the information detailed in this case factsheet in its database. I am submitting this case factsheet with the following restrictions: (tick as preferred)"]),
          country: find_country(case_data["Country of incident"]),
          subnational_location: case_data["Subnational location"],
          location_details_1: case_data["Other Location Details (1)"],
          location_details_2: case_data["Other Location Details (2)"],
          incident_start_year: case_data["Start Date of Incident"]&.split&.last || Date.current.year,
          incident_start_day: case_data["Start Date of Incident"]&.split&.second,
          incident_start_month: case_data["Start Date of Incident"]&.split&.first,
          documenter_first_name: case_data["First Name"],
          documenter_last_name: case_data["Last Name"],
          documenter_email: case_data["Email"],
          documenter_id: Users::Documenter.last.id,
          documenter_phone_number: case_data["Phone Number"],
          data_sources: case_data["Provide relevant website/link"],
          impact_to_victim_details: case_data["How did the incident/s affect the victim/s and his/her/their family?"],
          impact_to_community_details: case_data["How did the incident/s affect the Indigenous Peoples group/s or community/ies and/or
            organization of the victim/s?"],
          actions_taken_details: actions_taken_details(case_data),
        )
      end

      def primary_data(value)
        value.to_s.downcase == "yes" ? true : false
      end

      def data_sharing(value)
        return "unrestricted" if value.to_s == "The information in this case factsheet can be used by IPRI in understanding broad trends of criminalization, violence and impunity against Indigenous Peoples and can specifically refer to any of the details of this case."

        "restricted"
      end

      def find_country(country_name)
        Country.find_by(name: country_name)
      end

      def actions_taken_details(case_data)
        case_data["Please elaborate on any action/s at national level and indicate the actor who initiated the action/s."].presence ||
          case_data["If no, please provide more information on actions undertaken."]
      end

      def parse_submission_date(date)
        puts "DATA: #{date}"

        date.is_a?(String) ? Date.parse(date) : date
      end
    end
  end
end
