# frozen_string_literal: true

class CriminalizationsController < ApplicationController
  layout "documenter"

  def index
    @pagy, @criminalizations = pagy(Criminalizations::Criminalization.order(created_at: :desc))
  end
end
