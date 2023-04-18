# frozen_string_literal: true

require "roo"

module Spreadsheets
  class Import < ActiveInteraction::Base
    string :spreadsheet_path
    string :documenter_id

    def execute
      data = Roo::Spreadsheet.open(spreadsheet_path)
      data.each_with_index do |row, idx|
        next if idx.zero?

        create_case_details(Hash[[column_names(data), row].transpose])
      end
    end

    private

    def create_case_details(case_data)
      ApplicationRecord.transaction do
        @case_detail = create_case_detail(case_data)
        create_victims(case_data)
        create_criminalizations(case_data)
        create_killings(case_data)
        create_human_rights_violations(case_data)
        create_development_projects(case_data)
      end
    end

    def column_names(data)
      data.row(1).map(&:strip)
    end

    def create_victims(case_data)
      if individual_victims?(case_data)
        create_individual_victims(case_data)
      end
      if collective_victims?(case_data)
        create_collective_victims(case_data)
      end
    end

    def create_case_detail(case_data)
      Spreadsheets::Imports::CaseDetail.run(case_data: case_data, documenter_id: documenter_id).result
    end

    def create_individual_victims(case_data)
      Spreadsheets::Imports::IndividualVictim.run(case_detail_id: @case_detail.id, case_data: case_data)
    end

    def create_collective_victims(case_data)
      Spreadsheets::Imports::CollectiveVictim.run(case_detail_id: @case_detail.id, case_data: case_data)
    end

    def create_criminalizations(case_data)
      return unless criminalizations_category?(case_data["Categories of Incidents of Human Rights Violations"])

      Spreadsheets::Imports::Criminalization.run(case_detail_id: @case_detail.id, case_data: case_data)
    end

    def create_human_rights_violations(case_data)
      return unless human_rights_violations_category?(case_data["Categories of Incidents of Human Rights Violations"])

      Spreadsheets::Imports::HumanRightsViolation.run(case_detail_id: @case_detail.id, case_data: case_data)
    end

    def create_killings(case_data)
      return unless killings_category?(case_data["Categories of Incidents of Human Rights Violations"])

      Spreadsheets::Imports::Killing.run(case_detail_id: @case_detail.id, case_data: case_data)
    end

    def create_development_projects(case_data)
      return unless has_related_development_project?(case_data)

      Spreadsheets::Imports::DevelopmentProject.run(case_detail_id: @case_detail.id, case_data: case_data)
    end

    def has_related_development_project?(case_data)
      case_data["Is the case related to (a) development project/s?"].to_s.downcase == "yes"
    end

    def individual_victims?(case_data)
      value = case_data["Does the case involve individual/s or group/s of people (E.g., an entire village, members of an ethnic community, etc.)?"]

      value.to_s == "Individual - (Choose this category if the name/s of the victim/s is/are known)"
    end

    def collective_victims?(case_data)
      value = case_data["Does the case involve individual/s or group/s of people (E.g., an entire village, members of an ethnic community, etc.)?"]

      value.to_s.include?("Group of People")
    end

    def criminalizations_category?(value)
      value.to_s.include?("Criminalization")
    end

    def killings_category?(value)
      value.to_s.include?("Killing")
    end

    def human_rights_violations_category?(value)
      value.to_s.include?("Human Rights Violation")
    end
  end
end
