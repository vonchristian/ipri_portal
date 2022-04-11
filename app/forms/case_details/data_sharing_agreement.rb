# frozen_string_literal: true

module CaseDetails
  class DataSharingAgreement
    include ActiveModel::Model

    attr_accessor :data_sharing_restricted, :data_sharing_unrestricted, :case_detail_id

    def process!
      ApplicationRecord.transaction do
        update_case_detail
      end
    end

    private

    def update_case_detail
      CaseDetail.find(case_detail_id).update(data_sharing_restricted: data_sharing_restricted, data_sharing_unrestricted: data_sharing_unrestricted)
    end
  end
end