# frozen_string_literal: true

ActiveAdmin.register(ActsAsTaggableOn::Tag, as: "Tag") do
  permit_params :name
end
