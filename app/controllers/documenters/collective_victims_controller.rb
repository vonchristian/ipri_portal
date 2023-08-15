# frozen_string_literal: true

module Documenters
  class CollectiveVictimsController < BaseController
    def index
      @victims = Victims::CollectiveVictim.all
    end

    def show
      @collective_victim = Victims::CollectiveVictim.find(params.fetch(:id))
    end

    def edit
      @collective_victim = Victims::CollectiveVictim.find(params.fetch(:id))
    end

    def update
      @collective_victim = Victims::CollectiveVictim.find(params.fetch(:id))
      @collective_victim.update(victim_params)
      respond_to do |format|
        if @collective_victim.save
          format.html { redirect_to documenters_collective_victim_url(@collective_victim) }
        else
          render :edit, status: :unprocessable_entity
        end
      end
    end

    private

    def victim_params
      params.require(:victims_collective_victim)
          .permit(:affected_total,
            :refer_to_individuals,
            :victim_details,
            :male_total,
            :female_total,
            age_bracket_breakdowns: [])
          end
  end
end
