# frozen_string_literal: true

module Countries
  class KillingsController < ApplicationController
    layout "documenter"
    def index
      @country = Country.find(params[:country_id])
      @killings = @country.killings
    end
  end
end
