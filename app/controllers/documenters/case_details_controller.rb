# frozen_string_literal: true

module Documenters
  class CaseDetailsController < BaseController
    def index
      case_details = if params[:search].present?
        ::CaseDetails::CaseDetail.text_search(params[:search])
      else
        ::CaseDetails::CaseDetail.all
      end

      @pagy, @case_details = pagy(case_details)
    end

    def show
      @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:id))
    end
  end
end
