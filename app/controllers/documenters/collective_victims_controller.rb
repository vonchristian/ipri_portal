# frozen_string_literal: true

module Documenters
  class CollectiveVictimsController < BaseController
    def index
      @victims = Victims::CollectiveVictim.all
    end

    def show
      @victim = Victims::CollectiveVictim.find(params.fetch(:id))
    end
  end
end
