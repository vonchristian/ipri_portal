# frozen_string_literal: true

module Countries
  class KillingsController < ApplicationController
    layout "documenter"
    def index
      @country = Country.find(params[:country_id])
      @pagy, @killings = pagy(@country.killings.includes(:case_detail).order(:created_at))
    end
  end
end
