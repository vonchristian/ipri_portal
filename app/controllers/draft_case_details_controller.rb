# frozen_string_literal: true

class DraftCaseDetailsController < ApplicationController
  layout "documenter"

  before_action :authenticate_documenter!

  def show
    @draft_case_detail = CaseDetails::DraftCaseDetail.find(params[:id])
  end

  def update
    @draft_case_detail = CaseDetails::DraftCaseDetail.find(params[:id])
    if @draft_case_detail.update(draft_case_detail_params)
      render(json: { success: true })
    else
      render(json: { success: false, errors: @draft_case_detail.errors.full_messages }, status: :unprocessable_entity)
    end
  end

  private

  def draft_case_detail_params
    params.require(:draft_case_detail).permit(*CaseDetails::DraftCaseDetail.column_names.map(&:to_sym))
  end
end
