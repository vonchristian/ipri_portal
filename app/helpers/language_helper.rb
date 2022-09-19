# frozen_string_literal: true

module LanguageHelper
  def current_language_params
    # Modify this list to whitelist url params for linking to the current page
    request.params.slice("locale")
  end
end
