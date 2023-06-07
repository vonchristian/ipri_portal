# frozen_string_literal: true

ActiveAdmin.register(Users::Documenter) do
  menu label: "Documenters"
  permit_params :email, :first_name, :last_name, :role, :password, :country_id
  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
  end

  form do |f|
    f.inputs do
      f.input(:first_name)
      f.input(:last_name, required: false)
      f.input(:email)
      f.input(:password)
      f.input(:role, as: :select, collection: Users::Documenter.roles.values)
      f.input(:country_id, as: :select, collection: Country.all)
    end
    f.actions
  end
end
