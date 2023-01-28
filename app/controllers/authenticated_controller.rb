# frozen_string_literal: true

class AuthenticatedController < ActionController::Base
  before_action :authenticate_documenter!

  def logged_in?
    !!current_documenter
  end

  def authenticate_documenter!
    redirect_to documenters_login_path unless logged_in?
  end

  def current_documenter
    if session[:user_id]
      @documenter = Users::Documenter.find(session[:user_id])
    end
  end
end
