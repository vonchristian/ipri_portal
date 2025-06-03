# frozen_string_literal: true

class CaseDetailsController < Documenters::BaseController
  layout "documenter"
  def index
    outcome = ::CaseDetails::Index.run(params.merge!(documenter: current_documenter))
    @country = Country.find_by(id: params[:country_id])
    @pagy, @case_details = pagy(outcome.result)

    respond_to do |format|
      format.html
      format.turbo_stream 
    end
  end

  def show
    @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:id))
    respond_to do |format|
      format.html
      format.turbo_stream do 
        render partial: "documenters/case_details/partials/show", 
        locals: { case_detail: @case_detail } 
      end
      format.pdf do
        pdf = CaseDetailPdf.new(@case_detail, view_context)
        send_data pdf.render, filename: "case_detail_#{@case_detail.id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end
  
  def edit
    @case_detail = CaseDetails::CaseDetail.find(params[:id])
  end

  def update
    @case_detail = CaseDetails::CaseDetail.find(params[:id])
    @case_detail.update(case_detail_params)
    if @case_detail.valid?
      @case_detail.save
      respond_to do |format|
        format.html { redirect_to documenters_case_detail_url(@case_detail) }
      end
    else
      respond_to do |_format|
        render :edit, status: :unprocessable_entity
      end
    end
  end

  private

  def case_detail_params
    params.require(:case_details_case_detail)
      .permit(
        :documenter_first_name,
        :documenter_last_name,
        :organization_name,
        :submission_date_year,
        :submission_date_month,
        :submission_date_day,
        :documenter_email,
        :documenter_phone_number,
        :data_sources,
        :data_sharing,
        :primary_data,
        :country_id,
        :subnational_location,
        :location_details_1,
        :location_details_2,
        :incident_start_month,
        :incident_start_day,
        :incident_start_year,
        :incident_end_month,
        :incident_end_day,
        :incident_end_year,
        :incident_hour,
        :incident_minute,
        :actions_taken_details,
        :incident_investigation_details
      )
  end
end
