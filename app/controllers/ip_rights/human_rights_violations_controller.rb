# frozen_string_literal: true

module IpRights
  class HumanRightsViolationsController < ApplicationController
    def index
      @case_detail = CaseDetail.find(params.fetch(:case_detail_id))
    end

    def new
      @case_detail            = CaseDetail.find(params.fetch(:case_detail_id))
      @human_rights_violation = @case_detail.human_rights_violations.build
    end
  end
end