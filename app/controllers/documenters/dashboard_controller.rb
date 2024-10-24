# frozen_string_literal: true

module Documenters
  class DashboardController < BaseController
    def index
      @criminalizations_count = Criminalizations::Criminalization.all.size
      @killings_count = Killings::Killing.all.size
      @human_rights_violations_count = HumanRightsViolations::HumanRightsViolation.all.size
      @cases_count = ::CaseDetails::CaseDetail.all.size
    end
  end
end
