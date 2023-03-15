# frozen_string_literal: true

module DevelopmentProjects
  class Company < ApplicationRecord
    belongs_to :country, optional: true
  end
end
