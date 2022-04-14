# frozen_string_literal: true

module Documenters
  class BaseController < ApplicationController
    before_action :authenticate_documenter!
    helper_method :current_documenter
    layout "documenter"

    def current_documenter
      if session[:user_id]
        @documenter = Users::User.find(session[:user_id])
      end
    end

    def logged_in?
      !!current_documenter
    end

    def authenticate_documenter!
      redirect_to documenter_login_path unless logged_in?
    end
  end
end