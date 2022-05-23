class CompanyProject < ApplicationRecord
  belongs_to :company
  belongs_to :development_project
end
