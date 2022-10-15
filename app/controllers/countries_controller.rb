# frozen_string_literal: true

class CountriesController < Documenters::BaseController
  layout "documenter"
  def index
    @countries = Country.all.order(case_count: :desc)
  end

  def show
    @country = Country.find(params[:id])
  end
end
