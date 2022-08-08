# frozen_string_literal: true

module IpRights
  class VictimsController < ApplicationController
    layout "documenter"

    def index
      @case_detail = CaseDetails::CaseDetail.find(params.fetch(:case_detail_id))
    end
  end
end