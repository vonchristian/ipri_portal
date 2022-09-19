# frozen_string_literal: true

module Portal
  class DataSharingsController < BaseController
    def new
      @case_detail  = CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
      @data_sharing = CaseDetails::DataSharing.new
    end

    def create
      @case_detail =  CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
      @data_sharing = CaseDetails::DataSharing.new(data_sharing_params)
      if @data_sharing.valid?
        @data_sharing.process!
        respond_to do |format|
          format.html do
            redirect_to new_portal_case_detail_incident_detail_url(@case_detail)
          end
        end
      else
        respond_to do |format|
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def data_sharing_params
      params.require(:case_details_data_sharing)
        .permit(:data_sharing)
        .merge!(case_detail_id: @case_detail.id)
    end
  end
end
