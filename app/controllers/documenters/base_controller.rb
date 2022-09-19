# frozen_string_literal: true

module Documenters
  class BaseController < ApplicationController
    before_action :authenticate_documenter!
    helper_method :current_documenter
    layout "documenter"
    around_action :switch_locale

    def switch_locale(&action)
      locale = current_documenter ? current_documenter.locale : I18n.default_locale
      I18n.with_locale(locale, &action)
    end

    def current_documenter
      if session[:user_id]
        @documenter = Users::Documenter.find(session[:user_id])
      end
    end

    def logged_in?
      !!current_documenter
    end

    def authenticate_documenter!
      redirect_to documenters_login_path unless logged_in?
    end
  end
end
