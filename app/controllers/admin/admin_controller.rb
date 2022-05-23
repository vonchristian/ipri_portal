# frozen_string_literal: true

module Admin
  class AdminController < ApplicationController
    before_action :authenticate_admin_user!
    helper_method :current_admin_user
    layout "admin"

    def current_admin_user
      if session[:admin_user_id]
        @admin_user ||= Users::AdminUser.find(session[:admin_user_id])
      end
    end

    def logged_in?
      !!current_admin_user
    end

    def authenticate_admin_user!
      redirect_to admin_login_path unless logged_in?
    end
  end
end