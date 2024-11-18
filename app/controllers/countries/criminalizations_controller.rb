# frozen_string_literal: true

module Countries
  class CriminalizationsController < ApplicationController
    layout "documenter"
    def index
      @country = Country.find(params[:country_id])
      @pagy, @criminalizations = pagy(@country.criminalizations.includes(:case_detail).order(:created_at))
    end
  end
end
