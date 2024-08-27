# frozen_string_literal: true

class CountryPolicy < ApplicationPolicy
  def index?
    documenter.ipri_employee?
  end
end
