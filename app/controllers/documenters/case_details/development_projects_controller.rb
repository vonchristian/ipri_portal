# frozen_string_literal: true

module Documenters
  module CaseDetails
    class DevelopmentProjectsController < Documenters::BaseController
      layout "documenter"

      def index
        @case_detail = ::CaseDetails::CaseDetail.find(params[:case_detail_id])
        @development_projects = @case_detail.development_projects
      end

      def show
        @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
        @development_project = @case_detail.development_projects.find(params[:id])
      end

      def new
        @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
        @development_project = ::CaseDetails::DevelopmentProject.new
      end

      def edit
        @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
        @development_project = DevelopmentProjects::DevelopmentProject.find(params[:id])
      end

      def create
        @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
        @development_project = ::CaseDetails::DevelopmentProject.new(development_project_params)
        if @development_project.valid?
          @development_project.save!
          redirect_to(documenters_case_detail_development_projects_url(@case_detail))
        else
          render(:new, status: :unprocessable_entity)
        end
      end

      def update
        @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
        @development_project = @case_detail.development_projects.find(params[:id])
        @development_project.update(edit_development_project_params)
        if @development_project.valid?
          @development_project.save
          redirect_to(documenters_case_detail_development_project_url(id: @development_project.id, case_detail_id: @case_detail.id))
        else
          render(:edit, status: :unprocessable_entity)
        end
      end

      private

      def edit_development_project_params
        params.require(:development_projects_development_project).permit(
          :development_project_category_id,
          :name,
          :description,
          :project_start_year,
          :website_sources,
          :parent_company_name,
          :parent_company_description,
          :parent_company_data_sources,
          :parent_company_country_id,
          :funding_source_description,
          :funding_source_data_sources,
        )
      end

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
end
