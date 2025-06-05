# frozen_string_literal: true

class TestHelpers::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    session_obj = Documenters::Session.new(email: params[:email], password: params[:password])

    if session_obj.valid? && session_obj.valid_password?
      user = session_obj.find_user
      session[:user_id] = user.id
      render json: { message: "Logged in successfully", user_id: user.id }, status: :ok
    else
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end
end
