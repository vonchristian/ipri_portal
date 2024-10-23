# frozen_string_literal: true

module Documenters
  module CaseDetails
    class DevelopmentProjectsController < Documenters::BaseController
      layout "documenter"

      def index
        @case_detail = ::CaseDetails::CaseDetail.find(params[:case_detail_id])
        @development_projects = @case_detail.development_projects
      end

      def new
        @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
        @development_project = ::CaseDetails::DevelopmentProject.new
      end
    end
  end
end
