# frozen_string_literal: true

module FactSheets
  class DataSharingAgreementsController < ApplicationController
    def new
      @temp_fact_sheet = Tmps::FactSheet.find(params.fetch(:temp_fact_sheet_id))
      @data_sharing_agreement = FactSheets::DataSharingAgreement.new
    end

    def create
      @temp_fact_sheet = Tmps::FactSheet.find(params.fetch(:temp_fact_sheet_id))
      @data_sharing_agreement = FactSheets::DataSharingAgreement.new(data_sharing_agreement_params)
      if @data_sharing_agreement.valid?
        @data_sharing_agreement.process!

        redirect_to new_fact_sheets_temp_fact_sheet_incident_detail_url(@temp_fact_sheet)
      else
        render :new
      end
    end

    def data_sharing_agreement_params
      params.require(:fact_sheets_data_sharing_agreement)
      .permit(:data_sharing_restricted, :data_sharing_unrestricted)
      .merge!(temp_fact_sheet_id: @temp_fact_sheet.id)
    end
  end
end