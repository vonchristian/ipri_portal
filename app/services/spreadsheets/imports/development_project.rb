# frozen_string_literal: true

module Spreadsheets
  module Imports
    class DevelopmentProject < ActiveInteraction::Base
      string :case_detail_id
      hash :case_data, strip: false

      validates :case_detail_id, :case_data, presence: true

      def execute
        create_development_project
      end

      private

      def create_development_project
        development_project = DevelopmentProjects::DevelopmentProject.create!(
          name: case_data["Name of development project/s"],
          description: case_data["Description of development project/s"],
          project_start_year: case_data["Indicate year of project's start of operation on the country where the incident of human rights violation happened"],
          website_sources: case_data["Source of information on development project"],
          development_project_category_id: category&.id
        )

        if related_company.present?
          associate_companies(development_project)
        end

        if related_funding_sources.present?
          associate_funding_sources(development_project)
        end

        development_project
      end

      def categories
        case_data["Type of Development Project"].to_s.split("\n").first
      end

      def category
        DevelopmentProjects::Category.find_by(name:  case_data["Type of Development Project"].to_s.split("\n").first)
      end

      def associate_companies(development_project)
        company = DevelopmentProjects::Company.create(
          country_id: Country.find_by(name: case_data["Country of parent company"])&.id,
          description: case_data["Description of parent company"],
          information_source: case_data["Source of information on parent company"],
        )

        if company.present?
          development_project.companies << company
        end
      end

      def associate_funding_sources(development_project)
      end

      def related_funding_sources
        case_data["Do you know if the development project/s is/are linked to any financial institution/s?"].to_s.downcase == "yes"
      end

      def related_company
        case_data["Do you know if the development project/s has/have a parent company offshore?"].to_s.downcase == "yes"
      end
    end
  end
end
