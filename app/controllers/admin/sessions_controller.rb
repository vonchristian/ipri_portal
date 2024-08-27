# frozen_string_literal: true

module Admin
  class SessionsController < ApplicationController
    def new
      if session[:admin_user_id]
        redirect_to admin_dashboard_index_path
      else
        @session = AdminUsers::Session.new
      end
    end

    def create
      @session = AdminUsers::Session.new(session_params)
      if @session.valid? && @session.valid_password?
        session[:admin_user_id] = @session.find_admin_user.id
        respond_to do |format|
          format.html { redirect_to admin_dashboard_index_path, notice: "signed in successfully" }
        end
      else
        respond_to do |format|
          format.html do
            flash.now[:alert] = "Invalid email or password"
            render :new, status: :unprocessable_entity
          end
        end
      end
    end

    def destroy
      session[:admin_user_id] = nil
      redirect_to admin_login_path
    end

    private

    def session_params
      params.require(:admin_users_session)
        .permit(:email, :password)
    end
  end
end
