# frozen_string_literal: true

module Documenters
  class CaseDetailsController < BaseController
    def index
      outcome = ::CaseDetails::Index.run(documenter: current_documenter, search: params[:search])

      @pagy, @case_details = pagy(outcome.result)
    end

    def show
      @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:id))
    end
  end
end
