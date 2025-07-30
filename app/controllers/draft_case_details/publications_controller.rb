# frozen_string_literal: true

class DraftCaseDetails::PublicationsController < ApplicationController
  layout "documenter"

  before_action :authenticate_documenter!

  def create
    @draft_case_detail = CaseDetails::DraftCaseDetail.find(params[:draft_case_detail_id])
    DraftCaseDetails::Publication.run(draft_case_detail: @draft_case_detail)
    redirect_to(draft_case_detail_path(@draft_case_detail), notice: "Published successfully.")
  end
end
