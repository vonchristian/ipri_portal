# frozen_string_literal: true

module Documenters
  module CaseDetails
    class CriminalizationsController < Documenters::BaseController
      layout "documenter"
      
      before_action :set_case_detail

      def index
        @criminalizations = @case_detail.criminalizations
      end

      def new
        @criminalization = @case_detail.criminalizations.build
        @criminalization.accuserizations.build
       
      end

      def create
        @criminalization = @case_detail.criminalizations.create!(criminalization_params)
        if @criminalization.valid?
          @criminalization.save

          respond_to do |format|
            format.html do
              redirect_to documenters_case_detail_criminalization_url(case_detail_id: @case_detail.id, id: @criminalization.id)
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

      def show
        @criminalization = @case_detail.criminalizations.find(params[:id])
      end

      def edit
        @criminalization = @case_detail.criminalizations.find(params[:id])
        Criminalizations::AccuserCategory.all.each do |category|
    unless @criminalization.accuserizations.exists?(accuser_category_id: category.id)
      @criminalization.accuserizations.build(accuser_category_id: category.id)
    end
  end
      end

      def update
        @criminalization = @case_detail.criminalizations.find(params[:id])
        
        if @criminalization.update!(criminalization_params)
          
              redirect_to documenters_case_detail_criminalization_url(case_detail_id: @case_detail.id, id: @criminalization.id)
            
        else
         
              render :edit, status: :unprocessable_entity
           

        end
      end

      private
      def set_case_detail
        @case_detail = ::CaseDetails::CaseDetail.find(params[:case_detail_id])
      end

      def criminalization_params
        params.require(:criminalizations_criminalization)
          .permit(
            :criminalization_details,
            :experienced_harrassment_or_intimidation,
            :harrassment_or_intimidation_details,
            :accusation_or_charges_details,
            :policies_or_laws_used,
            :accuser_details,
            :case_filing_status,
            :case_filing_details,
            :case_decision_status,
            :case_decision_details,
            :victims_in_detention,
            :victims_in_detention_details,
            :case_filing_against_perpetrator,
            :case_filing_against_perpetrator_details,
            :state_action_to_address_criminalization,
            :state_action_to_address_criminalization_details,
            :investigation_on_criminalization,
            :investigation_on_criminalization_details,
            :impact_to_victim_details,
            :impact_to_community_details,
            accuser_category_ids: []
          )
      end
    end
  end
end
