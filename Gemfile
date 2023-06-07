source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.2", ">= 7.0.2.4"
gem 'rails-i18n', '~> 7.0.0'
gem "countries"
gem 'email_validator'
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg"
gem 'pagy', '~> 6.0' # omit patch digit
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 6.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false
gem 'pg_search'
# Use Sass to process CSS
gem "sassc-rails"
gem 'rubocop', require: false
gem 'rubocop-rails', require: false
gem 'rubocop-rspec', require: false
gem 'rubocop-shopify', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"
gem 'simple_form'
group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "pry-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails"
end

group :development do
  gem "rack-mini-profiler"
end

group :test do
  gem 'shoulda-matchers', require: false
  gem "database_cleaner-active_record"
end

gem "tailwindcss-rails"
gem "font-awesome-sass", "~> 6.1.2"
gem "heroicon"
gem 'mina-ng-puma', require: false
gem 'mina-version_managers'
gem "chartkick"
gem "groupdate"
gem "roo", "~> 2.9.0"
gem 'active_interaction', '~> 5.1'
gem "kt-paperclip", "~> 6.4", ">= 6.4.1"

gem "pundit", "~> 2.3"
gem 'activeadmin'
gem 'devise'
gem 'acts-as-taggable-on', '~> 9.0'
gem 'activeadmin_addons'
