# frozen_string_literal: true

module Countries
  class HumanRightsViolationsController < ApplicationController
    layout "documenter"
    def index
      @country = Country.find(params[:country_id])
      @pagy, @human_rights_violations = pagy(@country.human_rights_violations.includes(:case_detail).order(:created_at))
    end
  end
end
