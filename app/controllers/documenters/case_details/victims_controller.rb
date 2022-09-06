# frozen_string_literal: true

module Documenters
  module CaseDetails
    class VictimsController < Documenters::BaseController
      layout "documenter"

      def index
        @case_detail = ::CaseDetails::CaseDetail.find(params[:case_detail_id])
      end
    end
  end
end
