# frozen_string_literal: true

module Documenters
  class SessionsController < ApplicationController
    def new
      if session[:user_id]
        redirect_to documenters_dashboard_index_path
      else
        @session = Documenters::Session.new
      end
    end

    def create
      @session = Documenters::Session.new(session_params)
      if @session.valid? && @session.valid_password?
        session[:user_id] = @session.find_user.id
        respond_to do |format|
          format.html { redirect_to documenters_dashboard_index_path }
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
      session[:user_id] = nil
      redirect_to documenters_login_path
    end

    private

    def session_params
      params.require(:documenters_session)
        .permit(:email, :password)
    end
  end
end
