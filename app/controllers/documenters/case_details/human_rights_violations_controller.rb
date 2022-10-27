# frozen_string_literal: true

module Documenters
  module CaseDetails
    class HumanRightsViolationsController < Documenters::BaseController
      layout "documenter"

      def index
        @case_detail = ::CaseDetails::CaseDetail.find(params[:case_detail_id])
        @killings = @case_detail.killings
        @criminalizations = @case_detail.criminalizations
      end
    end
  end
end
