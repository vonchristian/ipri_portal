# frozen_string_literal: true

module Documenters
  module CaseDetails
    class CollectiveVictimsController < Documenters::BaseController
      layout "documenter"

      before_action :set_case_detail
      before_action :set_collective_victim, only: [:show, :edit, :update]

      def new
        @collective_victim = ::CaseDetails::Victims::Collective.new
      end

      def create
        @collective_victim = ::CaseDetails::Victims::Collective.new(collective_victim_params)

        if @collective_victim.valid?
          @collective_victim.process!
          redirect_to documenters_case_detail_victims_url(@case_detail)
        else
          render :new, status: :unprocessable_entity
        end
      end

      def show; end

      def edit
        build_missing_age_bracket_breakdowns
      end

      def update
        if @collective_victim.update(update_params)
          redirect_to documenters_case_detail_collective_victim_url(@case_detail, @collective_victim)
        else
          build_missing_age_bracket_breakdowns if @collective_victim.age_bracket_breakdowns.empty?
          render :edit, status: :unprocessable_entity
        end
      end

      private

      def set_case_detail
        @case_detail = ::CaseDetails::CaseDetail.find(params[:case_detail_id])
      end

      def set_collective_victim
        @collective_victim = Victims::CollectiveVictim.find(params[:id])
      end

      def collective_victim_params
        base_params(:case_details_victims_collective)
          .merge(case_detail_id: @case_detail.id)
      end

      def update_params
        base_params(:victims_collective_victim)
      end

      def base_params(key)
        params.require(key).permit(
          :affected_total,
          :collective_victim_category_id,
          :indigenous_group_description,
          :refer_to_individuals,
          :victim_details,
          :male_total,
          :female_total,
          age_bracket_breakdowns_attributes: [:id, :age_bracket_id, :total, :_destroy]
        )
      end

      def build_missing_age_bracket_breakdowns
        existing_ids = @collective_victim.age_bracket_breakdowns.map(&:age_bracket_id)
        AgeBracket.where.not(id: existing_ids).each do |ab|
          @collective_victim.age_bracket_breakdowns.build(age_bracket_id: ab.id)
        end
      end
    end
  end
end
