# frozen_string_literal: true

module IpRights
  class CollectiveVictimsController < ApplicationController
    def new
      @case_detail       = CaseDetail.find(params.fetch(:case_detail_id))
      @collective_victim = CaseDetails::Victims::Collective.new
    end

    def create
      @case_detail       = CaseDetail.find(params.fetch(:case_detail_id))
      @collective_victim = CaseDetails::Victims::Collective.new(collective_victim_params)
      if @collective_victim.valid?
        @collective_victim.process!

        redirect_to ip_rights_case_detail_victims_url(@case_detail)
      else
        render :new
      end
    end

    private

    def collective_victim_params
      params.require(:case_details_victims_collective)
            .permit(:affected_total, :refer_to_individuals, :victim_details,
                      :male_total, :female_total, age_bracket_breakdowns: [])
            .merge!(case_detail_id: @case_detail.id)
    end
  end
end
