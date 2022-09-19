# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :switch_locale

  def switch_locale(&action)
    locale = current_documenter.locale
    I18n.with_locale(locale, &action)
    Rails.logger.info(locale)
  end
end
