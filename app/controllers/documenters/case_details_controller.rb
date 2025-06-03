# frozen_string_literal: true

module Documenters
  class CaseDetailsController < BaseController
    def index
      outcome = ::CaseDetails::Index.run(params.merge!(documenter: current_documenter))
      @country = Country.find_by(id: params[:country_id])
      @pagy, @case_details = pagy(outcome.result)

      respond_to do |format|
        format.html
        format.turbo_stream 
      end
    end

    def show
      @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:id))
      respond_to do |format|
        format.html
        format.turbo_stream do 
          render partial: "documenters/case_details/partials/show", 
          locals: { case_detail: @case_detail } 
        end
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
