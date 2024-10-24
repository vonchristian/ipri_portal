# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  helper_method :current_documenter

  around_action :switch_locale

  def switch_locale(&action)
    locale = current_documenter ? current_documenter.locale : I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def current_documenter
    true

    if session[:user_id]
      @documenter = Users::Documenter.find(session[:user_id])
    end
  end

  def current_user
    current_documenter
  end

  def logged_in?
    !!current_documenter
  end

  def authenticate_documenter!
    redirect_to documenters_login_path unless logged_in?
  end

  def user_not_authorized
    redirect_to "/", notice: "Not authorized to access this page"
  end
end
