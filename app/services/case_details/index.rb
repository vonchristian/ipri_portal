# frozen_string_literal: true

module CaseDetails
  class Index < ActiveInteraction::Base
    object :documenter, class: Users::Documenter

    string :search, :incident_start_year, :submission_date_year, :tag, :category_class, default: nil
    uuid :country_id, :category_id, default: nil

    def execute
      @case_details = case_details.text_search(search) if search.present?
      @case_details = case_details.where(country_id: country_id) if country_id.present?
      @case_details = case_details.where(incident_start_year: incident_start_year) if incident_start_year.present?
      @case_details = case_details.where(submission_date_year: submission_date_year) if submission_date_year.present?
      @case_details = case_details.tagged_with(tag) if tag.present?
      @case_details = case_details.joins(human_rights_violations: :categories).where("human_rights_violation_categories.id" => category_id) if category_id.present? && category_class.to_s == "HumanRightsViolations::Category"
      @case_details = case_details.joins(development_projects: :category).where("development_project_categories.id" => category_id) if category_id.present? && category_class.to_s == "DevelopmentProjects::Category"

      case_details.reorder(submission_date_year: :desc, submission_date_month: :desc, submission_date_day: :desc).distinct
    end

    private

    def case_details
      @case_details ||= if documenter.country_partner?
        documenter.case_details
      elsif documenter.ipri_employee?
        ::CaseDetails::CaseDetail.all
      end
    end
  end
end
