# frozen_string_literal: true

module Admin
  class UsersController < AdminController
    def index
      @users = Users::User.all
      @admin_users = Users::AdminUser.all
    end

    def new
      @user = Users::Registration.new
    end

    def create
      @user = Users::Registration.new(user_params)
      if @user.valid?
        @user.register!
        respond_to do |format|
          format.html { redirect_to admin_users_path, notice: "registered successfully" }
        end
      else
        respond_to do |format|
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    private

    def user_params
      params.require(:users_registration)
      .permit(:first_name, :last_name, :organization_name, :phone_number, :email)
    end
  end
end