class CriminalizationAccuserCategory < ApplicationRecord
  belongs_to :criminalization
  belongs_to :accuser_category
end
