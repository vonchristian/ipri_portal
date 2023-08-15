# frozen_string_literal: true

module Documenters
  module CaseDetails
    class IndividualVictimsController < Documenters::BaseController
      layout "documenter"

      def new
        @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
        @individual_victim = ::CaseDetails::Victims::Individual.new
      end

      def create
        @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
        @individual_victim = ::CaseDetails::Victims::Individual.new(individual_victim_params)
        if @individual_victim.valid?
          @individual_victim.process!

          respond_to do |format|
            format.html do
              redirect_to ip_rights_case_detail_victims_url(@case_detail)
            end
          end
        else
          respond_to do |format|
            format.html do
              render :new, status: :unprocessable_entity
            end
          end
        end
      end

      private

      def individual_victim_params
        params.require(:case_details_victims_individual)
          .permit(:gender,
            :full_name,
            :dependent_type,
            :ethnic_identity,
            :victim_role,
            :dependent_details,
            :age_bracket_id,
            :date_of_birth_day,
            :date_of_birth_month,
            :date_of_birth_year)
          .merge!(case_detail_id: @case_detail.id)
      end
    end
  end
end
