# frozen_string_literal: true

module Portal
  module Guests
    class LocaleController < BaseController
      def create
        current_guest.update(locale: params[:locale])
        redirect_to request.referer
      end
    end
  end
end
