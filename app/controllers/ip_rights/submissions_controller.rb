# frozen_string_literal: true

module IpRights
  class SubmissionsController < Documenters::BaseController
    layout "documenter"
    def create
      @case_detail = CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
      @case_detail.update(willing_to_share_more_info: params[:case_details_case_detail][:willing_to_share_more_info])
      redirect_to(documenters_case_detail_url(@case_detail), notice: "Case factsheet recorded successfully.")
    end
  end
end
