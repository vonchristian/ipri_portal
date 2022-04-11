# frozen_string_literal: true

module IpRights
  class IndividualVictimsController < ApplicationController
    def new
      @case_detail = CaseDetail.find(params.fetch(:case_detail_id))
      @individual_victim = CaseDetails::Victims::Individual.new
    end

    def create
      @case_detail = CaseDetail.find(params.fetch(:case_detail_id))
      @individual_victim = CaseDetails::Victims::Individual.new(individual_victim_params)
      if @individual_victim.valid?
        @individual_victim.process!

        redirect_to ip_rights_case_detail_victims_url(@case_detail)
      else
        render :new
      end
    end

    private

    def individual_victim_params
      params.require(:case_details_victims_individual)
      .permit(:gender, :full_name, :dependent_type, :ethnic_identity, :victim_role, :dependent_details,
        :age_bracket_id, :date_of_birth_day, :date_of_birth_month, :date_of_birth_year)
      .merge!(case_detail_id: @case_detail.id)
    end
  end
end