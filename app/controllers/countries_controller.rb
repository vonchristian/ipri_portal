# frozen_string_literal: true

class CountriesController < Documenters::BaseController
  layout "documenter"
  def index
    authorize(Country)
    if params[:search].present?
      @pagy, @countries = pagy(Country.text_search(params[:search]))
    else
      @pagy, @countries = pagy(Country.all.order(name: :asc))
    end
  end

  def show
    @country = Country.find(params[:id])
  end
end
