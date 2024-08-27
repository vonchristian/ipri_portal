# frozen_string_literal: true

module Admin
  class KillingsController < ApplicationController
    layout "admin"

    def index
      @killings = Killings::Killing.all
    end
  end
end
