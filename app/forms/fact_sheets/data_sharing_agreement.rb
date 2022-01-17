# frozen_string_literal: true

module FactSheets
  class DataSharingAgreement
    include ActiveModel::Model

    attr_accessor :data_sharing_restricted, :data_sharing_unrestricted, :fact_sheet_id

    def process!
      ApplicationRecord.transaction do
        update_fact_sheet
      end
    end

    private

    def update_fact_sheet
      FactSheet.find(fact_sheet_id).update(data_sharing_restricted: data_sharing_restricted, data_sharing_unrestricted: data_sharing_unrestricted)
    end
  end
end