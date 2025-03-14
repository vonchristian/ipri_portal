# frozen_string_literal: true

module CaseDetails
  module Victims
    class Collective
      include ActiveModel::Model

      attr_accessor :case_detail_id,
        :collective_victim_category_id,
        :victim_details,
        :affected_total,
        :refer_to_individuals,
        :male_total,
        :female_total,
        :age_bracket_breakdowns,
        :indigenous_group_description

      validates :affected_total, :victim_details, presence: true

      def process!
        ApplicationRecord.transaction do
          create_collective_victim
        end
      end

      private

      def create_collective_victim
        collective_victim = ::Victims::CollectiveVictim.create!(
          collective_victim_category_id: collective_victim_category_id,
          case_detail_id: case_detail_id,
          affected_total: affected_total,
          refer_to_individuals: refer_to_individuals,
          victim_details: victim_details,
          male_total: male_total,
          female_total: female_total,
        )

        if age_bracket_breakdowns.present?
          age_bracket_breakdowns.each do |age_bracket_breakdown|
            collective_victim.age_bracket_breakdowns.create!(
              age_bracket_id: age_bracket_breakdown.age_bracket_id,
              total: age_bracket_breakdown.total,
            )
          end
        end
      end
    end
  end
end
