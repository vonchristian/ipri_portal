# frozen_string_literal: true

module Criminalizations
  class AccuserCategory < ApplicationRecord
    validates :title, presence: true, uniqueness: true
  end
end
