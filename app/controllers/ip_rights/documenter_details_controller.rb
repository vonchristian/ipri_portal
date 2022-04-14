# frozen_string_literal: true

module IpRights
  class DocumenterDetailsController < Documenters::BaseController
    layout "application"
    def new
      @documenter = CaseDetails::Documenter.new
    end

    def create
      @reference_number = SecureRandom.uuid
      @documenter       = CaseDetails::Documenter.new(documenter_params)
      if @documenter.valid?
        @documenter.process!
        @case_detail = CaseDetail.find_by(reference_number: @reference_number)

        redirect_to new_ip_rights_case_detail_data_sharing_agreement_url(@case_detail)
      else
        render :new
      end
    end

    private

    def documenter_params
      params
      .require(:case_details_documenter)
      .permit(:first_name, :last_name, :submission_date_day, :submission_date_month,
        :submission_date_year, :documenter_organization, :email,
        :phone_number, :primary_data, :organization_name)
        .merge!(reference_number: @reference_number, user_id: current_documenter.id)
    end
  end
end