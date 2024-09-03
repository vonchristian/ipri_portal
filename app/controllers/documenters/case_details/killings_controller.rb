# frozen_string_literal: true

module Documenters
  module CaseDetails
    class KillingsController < Documenters::BaseController
      layout "documenter"

      def index
        @case_detail = ::CaseDetails::CaseDetail.find(params[:case_detail_id])
        @killings = @case_detail.killings
      end
      def new
        @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
        @killing     = @case_detail.killings.build
        @killing.perpetratorizations.build
        @perpetrator_categories = Killings::PerpetratorCategory.all
      end

      def create
        @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
        @killing     = @case_detail.killings.build(killing_params)
        @perpetrator_categories = Killings::PerpetratorCategory.all
        if @killing.save!
          # @killing.save!

          respond_to do |format|
            format.html do
              redirect_to documenters_case_detail_killings_url(@case_detail)
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

      def edit
        @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
        @killing = Killings::Killing.find(params[:id])
      end

      def update
        @case_detail = ::CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
        @killing = Killings::Killing.find(params[:id])
        @killing.update(killing_params)
        if @killing.valid?
          @killing.save!

          respond_to do |format|
            format.html do
              redirect_to documenters_case_detail_killings_url(@case_detail)
            end
          end
        else
          respond_to do |format|
            format.html do
              render :edit, status: :unprocessable_entity
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
            perpetratorizations_attributes: [:perpetrator_category_id],
          )
      end
    end
  end
end
