# frozen_string_literal: true

module Documenters
  module CaseDetails
    class IndividualVictimsController < Documenters::BaseController
      layout "documenter"

      def index
        @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
        @individual_victims = @case_detail.individual_victims
      end

      def show
        @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
        @individual_victim = @case_detail.individual_victims.find(params.fetch(:id))
      end

      def new
        @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
        @individual_victim = ::CaseDetails::Victims::Individual.new
      end

      def edit
        @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
        @individual_victim = Victims::IndividualVictim.find(params.fetch(:id))
      end

      def create
        @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
        @individual_victim = ::CaseDetails::Victims::Individual.new(individual_victim_params)
        if @individual_victim.valid?
          @individual_victim.execute
          redirect_to(documenters_case_detail_individual_victims_url(@case_detail))
        else
          render(:new, status: :unprocessable_entity)
        end
      end

      def update
        @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
        @individual_victim = Victims::IndividualVictim.find(params.fetch(:id))
        if @individual_victim.update(update_params)
          redirect_to(documenters_case_detail_individual_victim_url(id: @individual_victim.id, case_detail_id: @case_detail.id))
        else
          render(:edit, status: :unprocessable_entity)
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
          .merge!(case_detail: @case_detail)
      end

      def update_params
        params.require(:victims_individual_victim)
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
      end
    end
  end
end
