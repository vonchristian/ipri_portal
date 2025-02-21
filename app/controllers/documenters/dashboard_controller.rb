# frozen_string_literal: true

module Documenters
  class DashboardController < BaseController
    def index
      @dashboard = "#{current_user.role.titleize.delete(" ")}Dashboard".constantize.run!
      respond_to do |format|
        format.html
        format.xlsx
      end
    end
  end
end
