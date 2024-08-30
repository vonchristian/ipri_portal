# frozen_string_literal: true

ActiveAdmin.register HumanRightsViolations::HumanRightsViolation, as: "Human Rights Violations" do
  menu false
  actions :all, except: [:new, :index, :destroy]

end