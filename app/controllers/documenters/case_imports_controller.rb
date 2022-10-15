# frozen_string_literal: true

module Documenters
  class CaseImportsController < BaseController
    def new
      @case_import = CaseImport.new
    end

    def create
      @case_import = CaseImport.create(case_import_params)
      respond_to do |format|
        format.html { redirect_to documenters_dashboard_index_path }
      end
    end

    private

    def case_import_params
      params.require(:case_import).permit(:spreadsheet)
    end
  end
end
