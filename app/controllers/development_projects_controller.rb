# frozen_string_literal: true

class DevelopmentProjectsController < ApplicationController
  layout "documenter"

  def show
    @development_project = DevelopmentProjects::DevelopmentProject.find(params[:id])
  end

  def edit
    @development_project = DevelopmentProjects::DevelopmentProject.find(params[:id])
  end

  def update
    @development_project = DevelopmentProjects::DevelopmentProject.find(params[:id])
    @development_project.update(development_project_params)
    if @development_project.valid?
      @development_project.save!

      respond_to do |format|
        format.html do
          redirect_to development_project_url(@development_project)
        end
      end
    else
      respond_to do |format|
        format.html do
          render :edit, status: :unprocessable_entity
        end
      end
    end
  end

  def development_project_params
    params.require(:development_projects_development_project).permit(
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
end
