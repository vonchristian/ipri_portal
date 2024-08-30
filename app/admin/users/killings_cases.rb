# frozen_string_literal: true

ActiveAdmin.register Killings::Killing, as: "Killing Cases" do
  menu false
  actions :all, except: [:new, :index, :destroy]
end