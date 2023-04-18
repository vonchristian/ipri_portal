# frozen_string_literal: true

module Admin
  class CaseDetailsController < Admin::AdminController
    def index
      case_details = CaseDetails::List.run(user: current_user, params: params)
      # case_details = if params[:search].present?
      #   ::CaseDetails::CaseDetail.text_search(params[:search])
      # else
      #   ::CaseDetails::CaseDetail.all
      # end

      @pagy, @case_details = pagy(case_details)
    end

    def show
      @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:id))
    end
  end
end
