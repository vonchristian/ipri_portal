# frozen_string_literal: true

module IpRights
  class DocumenterDetailsController < Documenters::BaseController
    layout "documenter"

    def new
      @documenter = CaseDetails::Documenter.new
    end

    def create
      @reference_number = SecureRandom.uuid
      @documenter       = CaseDetails::Documenter.new(documenter_params)
      if @documenter.valid?
        @documenter.process!
        respond_to do |format|
          format.html do
            case_detail = CaseDetails::CaseDetail.find_by(reference_number: @reference_number)
            redirect_to new_ip_rights_case_detail_data_sharing_url(case_detail)
          end
        end
      else
        respond_to do |format|
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    private

    def documenter_params
      params
        .require(:case_details_documenter)
        .permit(:first_name,
          :last_name,
          :submission_date_day,
          :submission_date_month,
          :submission_date_year,
          :documenter_organization,
          :email,
          :phone_number,
          :primary_data,
          :organization_name,
          :data_sources,
          :locale,
          documents: [])
        .merge!(reference_number: @reference_number, documenter_id: current_documenter.id)
    end
  end
end
