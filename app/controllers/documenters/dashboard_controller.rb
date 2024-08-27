# frozen_string_literal: true

module Documenters
  class DashboardController < BaseController
    def index
      @criminalizations_count = Criminalizations::Criminalization.all.size
      @killings_count = Killings::Killing.all.size
      @human_rights_violations_count = HumanRightsViolations::HumanRightsViolation.all.size
      @cases_count = @criminalizations_count + @killings_count + @human_rights_violations_count
    end
  end
end
