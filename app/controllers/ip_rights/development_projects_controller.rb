# frozen_string_literal: true

module IpRights
  class DevelopmentProjectsController < ApplicationController
    layout "documenter"

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
            redirect_to ip_rights_case_detail_development_projects_url(@case_detail)
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
        .permit(:project_name,
          :development_project_category_id,
          :project_description,
          :start_of_operation_year,
          :project_documents,
          :project_data_sources,
          :company_profile_known,
          :company_info_status,
          :parent_company_country_id,
          :parent_company_description,
          :parent_company_documents,
          :parent_company_data_sources,
          :funding_profile_known,
          :funding_description,
          :funding_source_ids,
          :funding_source_description,
          :funding_source_documents,
          :funding_source_data_sources,
          :parent_company_name,
          documents: [])
        .merge!(case_detail_id: @case_detail.id)
    end
  end
end
