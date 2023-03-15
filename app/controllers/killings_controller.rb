# frozen_string_literal: true

class KillingsController < ApplicationController
  layout "documenter"

  def index
    @pagy, @killings = pagy(Killings::Killing.order(created_at: :desc))
  end
end
