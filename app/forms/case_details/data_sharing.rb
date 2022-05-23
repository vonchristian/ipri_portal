# frozen_string_literal: true

module CaseDetails
  class DataSharing
    include ActiveModel::Model

    attr_accessor :data_sharing, :case_detail_id

    validates :data_sharing, presence: true

    def process!
      ApplicationRecord.transaction do
        update_case_detail
      end
    end

    private

    def update_case_detail
      CaseDetail.find(case_detail_id).update(data_sharing: data_sharing)
    end
  end
end