# frozen_string_literal: true

module CaseDetails
  class ImpactAndAction
    include ActiveModel::Model

    attr_accessor :impact_to_victim_details,
      :impact_to_community_details,
      :actions_taken_status,
      :incident_investigation_status,
      :incident_investigation_details,
      :actions_taken_details,
      :case_detail_id

    validates :impact_to_victim_details, :impact_to_community_details, :actions_taken_details, :incident_investigation_details, presence: true

    def process!
      if valid?
        set_impact_and_actions_taken
      end
    end

    private

    def set_impact_and_actions_taken
      find_case_detail.update_columns(
        impact_to_victim_details:    impact_to_victim_details,
        impact_to_community_details: impact_to_community_details,
        actions_taken_details:       actions_taken_details,
        actions_taken_status:        actions_taken_status,
        incident_investigation_status: incident_investigation_status,
        incident_investigation_details: incident_investigation_details
      )
    end

    def find_case_detail
      CaseDetails::CaseDetail.find(case_detail_id)
    end
  end
end
