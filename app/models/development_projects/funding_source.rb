module DevelopmentProjects
  class FundingSource < ApplicationRecord
    validates :name, presence: true, uniqueness: true
  end
end

