# frozen_string_literal: true

module FactSheets
  class DocumenterDetailsController < ApplicationController
    def new
      @documenter = FactSheets::Documenter.new
    end

    def create
      @documenter = FactSheets::Documenter.new(documenter_params)
      if @documenter.valid?
        @documenter.process!
        @temp_fact_sheet = Tmps::FactSheet.find_by(reference_number: params[:fact_sheets_documenter][:reference_number])

        redirect_to new_fact_sheets_temp_fact_sheet_data_sharing_agreement_url(@temp_fact_sheet)
      else
        render :new
      end
    end

    private

    def documenter_params
      params
      .require(:fact_sheets_documenter)
      .permit(:first_name, :last_name, :submission_date_day, :submission_date_month, :submission_date_year, :documenter_organization, :reference_number, :email, :phone_number, :check_phone_number, :check_email, :primary_data)
    end

  end
end