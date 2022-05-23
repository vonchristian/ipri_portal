# frozen_string_literal: true

module IpRights
  class DevelopmentProjectsController < ApplicationController
    def index
      @case_detail = CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
    end

    def new
      @case_detail = CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
      @development_project = CaseDetails::DevelopmentProject.new
    end
  end
end
