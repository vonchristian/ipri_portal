# frozen_string_literal: true


module Criminalizations
  class Accuserization < ApplicationRecord
    belongs_to :criminalization
    belongs_to :accuser_category
  end
end
