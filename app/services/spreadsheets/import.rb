# frozen_string_literal: true

require "roo"

module Spreadsheets
  class Import < ActiveInteraction::Base
    object :case_import
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
        @draft_case_detail = create_draft_case_detail(case_data)
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

    def create_draft_case_detail(case_data)
      Spreadsheets::Imports::DraftCaseDetail.run(case_data: case_data, documenter_id: documenter_id, case_import: case_import).result
    end

    def create_individual_victims(case_data)
      Spreadsheets::DraftCaseImports::IndividualVictim.run(draft_case_detail: @draft_case_detail, case_data: case_data)
    end

    def create_collective_victims(case_data)
      Spreadsheets::DraftCaseImports::CollectiveVictim.run(draft_case_detail: @draft_case_detail, case_data: case_data)
    end

    def create_criminalizations(case_data)
      if case_data["Categories of Incidents of Human Rights Violations"].to_s.include?("Criminalization")
        Spreadsheets::DraftCaseImports::Criminalization.run(draft_case_detail: @draft_case_detail, case_data: case_data)
      end
    end

    def create_human_rights_violations(case_data)
      if case_data["Categories of Incidents of Human Rights Violations"].to_s.include?("Human Rights Violation")
        Spreadsheets::DraftCaseImports::HumanRightsViolation.run(draft_case_detail: @draft_case_detail, case_data: case_data)
      end
    end

    def create_killings(case_data)
      if case_data["Categories of Incidents of Human Rights Violations"].to_s.include?("Killing")
        Spreadsheets::DraftCaseImports::Killing.run(draft_case_detail: @draft_case_detail, case_data: case_data)
      end
    end

    def create_development_projects(case_data)
      if case_data["Is the case related to (a) development project/s?"].to_s.downcase == "yes"
        Spreadsheets::DraftCaseImports::DevelopmentProject.run(draft_case_detail: @draft_case_detail, case_data: case_data)
      end
    end

    def individual_victims?(case_data)
      value = case_data["Does the case involve individual/s or group/s of people (E.g., an entire village, members of an ethnic community, etc.)?"]

      value.to_s == "Individual - (Choose this category if the name/s of the victim/s is/are known)"
    end

    def collective_victims?(case_data)
      value = case_data["Does the case involve individual/s or group/s of people (E.g., an entire village, members of an ethnic community, etc.)?"]

      value.to_s.include?("Group of People")
    end

    def human_rights_violations_category?(value)
      value.to_s.include?("Human Rights Violation")
    end
  end
end
