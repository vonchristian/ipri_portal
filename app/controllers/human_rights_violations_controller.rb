# frozen_string_literal: true

class HumanRightsViolationsController < ApplicationController
  layout "documenter"

  def index
    @pagy, @human_rights_violations = pagy(HumanRightsViolations::HumanRightsViolation.order(created_at: :desc))
  end
end
