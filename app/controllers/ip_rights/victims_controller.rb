# frozen_string_literal: true

module IpRights
  class VictimsController < ApplicationController
    def index
      @case_detail = CaseDetail.find(params.fetch(:case_detail_id))
    end
  end
end