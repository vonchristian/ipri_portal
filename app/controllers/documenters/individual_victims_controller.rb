# frozen_string_literal: true

module Documenters
  class IndividualVictimsController < BaseController
    def index
      @victims = Victims::IndividualVictim.all
    end
  end
end