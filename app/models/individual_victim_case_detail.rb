class IndividualVictimCaseDetail < ApplicationRecord
  belongs_to :individual_victim
  belongs_to :case_detail
end
