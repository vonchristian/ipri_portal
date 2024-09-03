# frozen_string_literal: true

class KillingsController < ApplicationController
  layout "documenter"

  def index
    @pagy, @killings = pagy(Killings::Killing.order(created_at: :desc))
  end

  def show
    @killing = Killings::Killing.find(params[:id])
  end

  def edit
    @killing = Killings::Killing.find(params[:id])
  end

  def update
    @killing = Killings::Killing.find(params[:id])
    @killing.update(killing_params)
    if @killing.valid?
      @killing.save!

      respond_to do |format|
        format.html do
          redirect_to killing_url(@killing)
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
        :investigation_on_killing_details
      )
  end
end
