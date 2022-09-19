# frozen_string_literal: true

module Portal
  class BaseController < ApplicationController
    helper_method :current_guest
    layout "portal"

    around_action :switch_locale

    def switch_locale(&action)
      locale = current_guest ? current_guest.locale : I18n.default_locale
      I18n.with_locale(locale, &action)
    end

    def current_guest
      if session[:guest_id]
        @guest = Users::Guest.find(session[:guest_id])
      else
        guest = Users::Guest.create!
        session[:guest_id] = guest.id
      end
    end
  end
end
