# frozen_string_literal: true

module CaseDetails
  class DevelopmentProject
    include ActiveModel::Model

    attr_accessor :project_category_ids, :project_name, :project_description, :start_of_operation_year, :project_documents, :project_data_sources,
    :company_profile_known, :company_info_status, :parent_company_country_id, :parent_company_description, :parent_company_documents, :parent_company_data_sources, :funding_profile_known, :funding_description, :funding_source_ids,
    :funding_source_description, :funding_source_documents, :funding_source_data_sources

    validates :project_name, :project_description, presence: true

    def save!
      if valid?
        ApplicationRecord.transaction do
        end
      end
    end

  end
end
