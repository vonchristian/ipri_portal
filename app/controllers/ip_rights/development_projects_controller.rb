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

    def create
      @case_detail = CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
      @development_project = CaseDetails::DevelopmentProject.new(development_project_params)
      if @development_project.valid?
        @development_project.save!

        respond_to do |format|
          format.html do
            redirect_to documenters_case_details_path, notice: "Case Factsheet submitted successfully."
          end
        end
      else
        respond_to do |format|
          format.html do
            render :new, status: :unprocessable_entity
          end
        end
      end
    end

    private

    def development_project_params
      params
        .require(:case_details_development_project)
        .permit(:project_name, :project_description)
    end
  end
end
