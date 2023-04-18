class CountryPolicy < ApplicationPolicy
  def index?
    documenter.ipri_employee?
  end
end
