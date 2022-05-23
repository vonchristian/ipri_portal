# frozen_string_literal: true

module Admin
  class DocumentersController < AdminController
    def index
      @documenters       = Users::Documenter.all
      @admin_users = Users::AdminUser.all
    end

    def new
      @documenter = Documenters::Registration.new
    end

    def create
      @documenter = Documenters::Registration.new(user_params)
      if @documenter.valid?
        @documenter.process!
        respond_to do |format|
          format.html { redirect_to admin_documenters_path, notice: "registered successfully" }
        end
      else
        respond_to do |format|
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    private

    def user_params
      params.require(:documenters_registration)
      .permit(:first_name, :last_name, :organization_name, :phone_number, :email)
    end
  end
end