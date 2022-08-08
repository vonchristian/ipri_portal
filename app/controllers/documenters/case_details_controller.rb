# frozen_string_literal: true

module Documenters
  class CaseDetailsController < BaseController
    def index
      if params[:search].present?
        @case_details = CaseDetails::CaseDetail.text_search(params[:search])
      else
        @case_details = CaseDetails::CaseDetail.all
      end
    end
  end
end