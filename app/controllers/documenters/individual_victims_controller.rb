# frozen_string_literal: true

module Documenters
  class IndividualVictimsController < BaseController
    def index
      @individual_victims = Victims::IndividualVictim.all.includes(:age_bracket)
    end

    def show
      @individual_victim = Victims::IndividualVictim.find(params.fetch(:id))
    end

    def edit
      @individual_victim = Victims::IndividualVictim.find(params.fetch(:id))
    end

    def update
      @individual_victim = Victims::IndividualVictim.find(params.fetch(:id))
      @individual_victim.update(individual_victim_params)
      respond_to do |format|
        if @individual_victim.save
          format.html { redirect_to documenters_individual_victim_url(@individual_victim) }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    private

    def individual_victim_params
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
