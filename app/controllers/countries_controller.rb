# frozen_string_literal: true

class CountriesController < Documenters::BaseController
  layout "documenter"
  def index
    @pagy, @countries = pagy(Country.all.order(priority: :desc).order(case_count: :desc))
  end

  def show
    @country = Country.find(params[:id])
  end
end
