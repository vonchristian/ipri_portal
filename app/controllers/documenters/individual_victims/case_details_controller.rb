# frozen_string_literal: true

module Documenters
  module IndividualVictims
    class CaseDetailsController < ApplicationController
      def index
        @individual_victim = IndividualVictim.find(params.fetch(:individual_victim_id))
        @case_details      = @individual_victim.case_details
      end
    end
  end
end