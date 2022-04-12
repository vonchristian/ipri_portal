class ProjectFunding < ApplicationRecord
  belongs_to :funding_source
  belongs_to :development_project
end
