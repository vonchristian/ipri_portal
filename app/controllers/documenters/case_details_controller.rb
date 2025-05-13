# frozen_string_literal: true

module Documenters
  class CaseDetailsController < BaseController
    def index
      outcome = ::CaseDetails::Index.run(params.merge!(documenter: current_documenter))
      if outcome.valid?
        @pagy, @case_details = pagy(outcome.result)
      end
    end

    def show
      @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:id))
      respond_to do |format|
        format.html
        format.pdf do
          pdf = CaseDetailPdf.new(@case_detail, view_context)
          send_data pdf.render, filename: "case_detail_#{@case_detail.id}.pdf",
                                type: "application/pdf",
                                disposition: "inline"
        end
      end
    end
  end
end
