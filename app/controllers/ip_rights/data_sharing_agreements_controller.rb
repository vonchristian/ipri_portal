# frozen_string_literal: true

module IpRights
  class DataSharingAgreementsController < ApplicationController
    def new
      @case_detail = CaseDetail.find(params.fetch(:case_detail_id))
      @data_sharing_agreement = CaseDetails::DataSharingAgreement.new
    end

    def create
      @case_detail = CaseDetail.find(params.fetch(:case_detail_id))
      @data_sharing_agreement = CaseDetails::DataSharingAgreement.new(data_sharing_agreement_params)
      if @data_sharing_agreement.valid?
        @data_sharing_agreement.process!

        redirect_to new_ip_rights_case_detail_incident_detail_url(@case_detail)
      else
        render :new
      end
    end

    def data_sharing_agreement_params
      params.require(:case_details_data_sharing_agreement)
      .permit(:data_sharing_restricted, :data_sharing_unrestricted)
      .merge!(case_detail_id: @case_detail.id)
    end
  end
end