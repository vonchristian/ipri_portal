# frozen_string_literal: true

module CaseDetails
  class DevelopmentProject
    include ActiveModel::Model

    attr_accessor :project_category_ids, :project_name, :project_description, :start_of_operation_year, :project_documents, :project_data_sources,
    :company_info_status, :country_id, :company_description, :company_documents, :company_data_sources, :funding_info_status, :funding_source_ids,
    :funding_description, :funding_documents, :funding_data_sources
  end
end
