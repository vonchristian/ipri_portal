# frozen_string_literal: true

module Spreadsheets
  module Imports
    class CollectiveVictim < ActiveInteraction::Base
      string :case_detail_id
      hash :case_data, strip: false

      def execute
        create_collective_victim
      end

      private

      def create_collective_victim
        binding.pry
        Victims::CollectiveVictim.create!(
          case_detail_id:      case_detail_id,
          affected_total:      case_data,
          victim_details:      case_data,
          refer_to_individual: case_data,
          male_total:          case_data,
          female_total:        case_data,
        )
      end
    end
  end
end
