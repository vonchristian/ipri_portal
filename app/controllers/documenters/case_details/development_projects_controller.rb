# frozen_string_literal: true

module Documenters
  module CaseDetails
    class DevelopmentProjectsController < Documenters::BaseController
      layout "documenter"

      def index
        @case_detail = ::CaseDetails::CaseDetail.find(params[:case_detail_id])
        @development_projects = @case_detail.development_projects
      end
    end
  end
end
