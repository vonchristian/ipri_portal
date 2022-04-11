# frozen_string_literal: true

module Criminalizations
  class Criminalization < ApplicationRecord
    has_many :criminalization_accuser_categories
  end
end
