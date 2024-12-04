# frozen_string_literal: true

module CaseDetails
  class DevelopmentProject
    include ActiveModel::Model

    attr_accessor :development_project_category_id,
      :project_name,
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
      :case_detail_id,
      :willing_to_share_more_info,
      :documents

    validates :project_name, :project_description, :development_project_category_id, presence: true

    def save!
      if valid?
        ApplicationRecord.transaction do
          create_development_project
          update_case_detail
        end
      end
    end

    private

    def create_development_project
      development_project = DevelopmentProjects::DevelopmentProject.create!(
        development_project_category_id: development_project_category_id,
        name: project_name,
        description: project_description,
        project_start_year: start_of_operation_year,
        website_sources: project_data_sources,
        parent_company_name: parent_company_name,
        parent_company_description: parent_company_description,
        parent_company_data_sources: parent_company_data_sources,
        funding_source_description: funding_source_description,
        funding_source_data_sources: funding_source_data_sources,
        parent_company_country_id: parent_company_country_id,
      )
      attach_to_case(development_project)
      if documents.present?
        development_project.documents.attach(documents)
      end
    end

    def attach_to_case(development_project)
      case_detail.development_projects << development_project
    end

    def case_detail
      @case_detail ||= CaseDetails::CaseDetail.find(case_detail_id)
    end

    def update_case_detail
      case_detail.update(willing_to_share_more_info: willing_to_share_more_info)
    end
  end
end
