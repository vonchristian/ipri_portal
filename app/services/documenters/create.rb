# frozen_string_literal: true

module Documenters
  class Create < ActiveInteraction::Base
    string :email
    string :first_name
    string :last_name
  end
end
