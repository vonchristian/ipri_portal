# frozen_string_literal: true

module Documenters
  module CaseDetails
    class TagsController < Documenters::BaseController
      layout "documenter"

      before_action :set_case_detail

      def create
        tag = params[:tag]
        @case_detail.tag_list.add(tag)
        @case_detail.save

        respond_to do |format|
          format.turbo_stream
        end
      end

      def destroy
        @case_detail.tag_list.remove(params[:id])
        @case_detail.save!

        respond_to do |format|
          format.turbo_stream
          format.html { redirect_to(@case_detail) }
        end
      end

      private

      def set_case_detail
        @case_detail = ::CaseDetails::CaseDetail.find(params[:case_detail_id])
      end
    end
  end
end
