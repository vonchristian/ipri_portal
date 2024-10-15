# frozen_string_literal: true

module Documenters
  module CaseDetails
    class TagsController < Documenters::BaseController
      layout "documenter"

      def index
        @case_detail = ::CaseDetails::CaseDetail.find(params[:case_detail_id])
      end

      def create
        @case_detail = ::CaseDetails::CaseDetail.find(params[:case_detail_id])
        if params[:tagging][:action_type] == 'add'
          @case_detail.tag_list.add(params[:tagging][:tag_name])
        else
          @case_detail.tag_list.remove(params[:tagging][:tag_name])
        end
        @case_detail.save
        respond_to do |format|
          format.html do
            redirect_to documenters_case_detail_tags_url(@case_detail.reload)
          end
        end
      end
    end
  end
end
