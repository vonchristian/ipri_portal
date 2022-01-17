# frozen_string_literal: true

module FactSheets
  class DataSharingAgreement
    include ActiveModel::Model

    attr_accessor :data_sharing_restricted, :data_sharing_unrestricted, :temp_fact_sheet_id

    def process!
      update_temp_fact_sheet
    end

    def update_temp_fact_sheet
      Tmps::FactSheet.find(temp_fact_sheet_id).update(data_sharing_restricted: data_sharing_restricted, data_sharing_unrestricted: data_sharing_unrestricted)
    end
  end
end