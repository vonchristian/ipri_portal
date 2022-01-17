# frozen_string_literal: true

module FactSheets
  class DataSharingAgreementsController < ApplicationController
    def new
      @fact_sheet = FactSheet.find(params.fetch(:fact_sheet_id))
      @data_sharing_agreement = FactSheets::DataSharingAgreement.new
    end

    def create
      @fact_sheet = FactSheet.find(params.fetch(:fact_sheet_id))
      @data_sharing_agreement = FactSheets::DataSharingAgreement.new(data_sharing_agreement_params)
      if @data_sharing_agreement.valid?
        @data_sharing_agreement.process!

        redirect_to new_fact_sheets_fact_sheet_incident_detail_url(@fact_sheet)
      else
        render :new
      end
    end

    def data_sharing_agreement_params
      params.require(:fact_sheets_data_sharing_agreement)
      .permit(:data_sharing_restricted, :data_sharing_unrestricted)
      .merge!(fact_sheet_id: @fact_sheet.id)
    end
  end
end