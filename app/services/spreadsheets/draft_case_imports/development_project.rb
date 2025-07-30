# frozen_string_literal: true

module Spreadsheets
  module DraftCaseImports
    class DevelopmentProject < ActiveInteraction::Base
      object :draft_case_detail, class: "CaseDetails::DraftCaseDetail"
      hash :case_data, strip: false

      def execute
        draft_case_detail.update!(
          project_name: case_data["Name of development project/s"],
          project_description: case_data["Description of development project/s"],
          project_start_year: case_data["Indicate year of project's start of operation on the country where the incident of human rights violation happened"],
          project_website_sources: case_data["Source of information on development project"],
          development_project_category: case_data["Type of Development Project"].to_s.split("\n").first,
        )
      end
    end
  end
end
