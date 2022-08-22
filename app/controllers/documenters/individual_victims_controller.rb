# frozen_string_literal: true

module Documenters
  class IndividualVictimsController < BaseController
    def index
      @individual_victims = Victims::IndividualVictim.all
    end

    def show
      @individual_victim = Victims::IndividualVictim.find(params.fetch(:id))
    end
  end
end