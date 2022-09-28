# frozen_string_literal: true

module Portal
  class VictimsController < BaseController
    def index
      @case_detail = CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
    end
  end
end
