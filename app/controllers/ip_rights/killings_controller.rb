# frozen_string_literal: true

module IpRights
  class KillingsController < ApplicationController
    def new
      @case_detail = CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
      @killing     = @case_detail.killings.build
    end

    def create
      @case_detail = CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
      @killing     = @case_detail.killings.build(killing_params)
      if @killing.valid?
        @killing.save!

        respond_to do |format|
          format.html do
            redirect_to ip_rights_case_detail_human_rights_violations_url(@case_detail)
          end
        end
      else
        respond_to do |format|
          format.html do
            render :new, status: :unprocessable_entity
          end
        end
      end
    end

    private

    def killing_params
      params.require(:killings_killing)
      .permit(
        :killing_details,
        :killing_carried_out,
        :experienced_harrassment_or_intimidation,
        :harrassment_or_intimidation_details,
        :alleged_perpetrators_known,
        :alleged_perpetrator_details,
        :case_filing_status,
        :case_filing_details,
        :state_action_to_address_killing,
        :state_action_to_address_killing_details,
        :investigation_on_killing,
        :investigation_on_killing_details,
        killing_perpetrator_categories_attributes: []
      )
    end
  end
end