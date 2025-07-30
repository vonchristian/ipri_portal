# frozen_string_literal: true

class CaseImportsController < ApplicationController
  layout "documenter"

  before_action :authenticate_documenter!

  def show
    @case_import = CaseImport.find(params[:id])
  end
end
