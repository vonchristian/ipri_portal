# frozen_string_literal: true

module Documenters
  class LocalesController < Documenters::BaseController
    def create
      current_documenter.update(locale: params.fetch(:locale))
      redirect_to request.referer
    end
  end
end
