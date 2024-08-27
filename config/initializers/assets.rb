# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

require "sprockets/sass_compressor"
module Sprockets
  class SassCompressor
    TAILWIND_SEARCH = "--tw-"
    def call(*args)
      input = if defined?(data)
        data # sprockets 2.x
      else
        args[0][:data] # sprockets 3.x
      end

      return input if skip_compiling?(input) # added this line

      SassC::Engine.new(
        input,
        {
          style: :compressed,
        },
      ).render
    end

    def skip_compiling?(body)
      body.include?(TAILWIND_SEARCH)
    end
  end
end
