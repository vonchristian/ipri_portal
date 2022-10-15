# frozen_string_literal: true

require "roo"

module Spreadsheets
  class Import < ActiveInteraction::Base
    string :spreadsheet_path

    def execute
      data = Roo::Spreadsheet.open(spreadsheet_path)
      data.each_with_index do |row, idx|
        next if idx.zero?

        create_case_details(Hash[[headers(data), row].transpose])
      end
    end

    private

    def create_case_details(case_data)
      ApplicationRecord.transaction do
        @case_detail = create_case_detail(case_data)
        create_victims(case_data)
      end
    end

    def headers(data)
      data.row(1).map(&:strip)
    end

    def create_victims(case_data)
      if individual_victims?(case_data)
        create_individual_victims(case_detail_id: @case_detail.id, case_data: case_data)
      end
      if collective_victims?(case_data)
        create_collective_victims(case_detail_id: @case_detail.id, case_data: case_data)
      end
    end

    def create_case_detail(case_data)
      Spreadsheets::Imports::CaseDetail.run(case_data: case_data).result
    end

    def create_individual_victims(case_detail_id:, case_data:)
      Spreadsheets::Imports::IndividualVictim.run(case_detail_id: case_detail_id, case_data: case_data)
    end

    def create_collective_victims(case_detail_id:, case_data:)
      Spreadsheets::Imports::CollectiveVictim.run(case_detail_id: case_detail_id, case_data: case_data)
    end

    def individual_victims?(case_data)
      value = case_data["Does the case involve individual/s or group/s of people (E.g., an entire village, members of an ethnic community, etc.)?"]

      value.to_s == "Individual - (Choose this category if the name/s of the victim/s is/are known)"
    end

    def collective_victims?(case_data)
      value = case_data["Does the case involve individual/s or group/s of people (E.g., an entire village, members of an ethnic community, etc.)?"]

      value.to_s == "Group of People - (Choose this category if the name/s of the victims are too many to identify and are not known, e.g., 100 of members of an entire indigenous community or an entire village etc)"
    end
  end
end
