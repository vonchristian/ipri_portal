# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "documenters/sessions#new"
  namespace :ip_rights do
    resources :case_details, only: [:show] do
      resources :data_sharings,           only: [:new, :create]
      resources :incident_details,        only: [:new, :create]
      resources :victims,                 only: [:index]
      resources :individual_victims,      only: [:new, :create]
      resources :collective_victims,      only: [:new, :create]
      resources :human_rights_violations, only: [:index, :new, :create]
      resources :criminalizations,        only: [:new, :create]
      resources :killings,                only: [:new, :create]
      resources :impact_and_actions,      only: [:new, :create]
      resources :development_projects,    only: [:index, :new, :create]
    end

    resources :documenter_details, only: [:new, :create]
  end

  namespace :admin do
    get "/login", to: "sessions#new"
    post "/sessions", to: "sessions#create"
    delete "/sessions", to: "sessions#destroy"
    resources :dashboard, only: [:index]
    resources :documenters, only: [:index, :show, :new, :create]
    resources :admin_users, only: [:index, :show, :new, :create]
    namespace :case_factsheets do
      resources :dashboard, only: [:index], controller: "/admin/case_factsheets/dashboard"
    end
    resources :killings, only: [:index]
    resources :case_details, only: [:index, :show]
  end

  namespace :documenters do
    resources :case_imports, only: [:new, :create]
    resources :documenter, only: [] do
      resource :locale
    end
    get "/login", to: "sessions#new"
    post "/sessions", to: "sessions#create"
    delete "/sessions", to: "sessions#destroy"
    resources :dashboard, only: [:index]
    resources :individual_victims, only: [:index, :show] do
      resources :case_details, only: [:index], controller: "/documenters/individual_victims/case_details"
    end
    resources :collective_victims, only: [:index, :show]

    resources :case_details, only: [:index, :new, :show] do
      resources :victims, only: [:index], controller: "case_details/victims"
      resources :human_rights_violations, only: [:index], controller: "case_details/human_rights_violations"
      resources :development_projects, only: [:index], controller: "case_details/development_projects"
    end
  end

  resources :countries, only: [:index, :show] do
    resources :killings, only: [:index], controller: "countries/killings"
  end

  resources :killings, only: [:index]

  namespace :portal do
    resources :guests, only: [:create] do
      resource :locale, controller: "guests/locale"
    end
    resources :case_details, only: [:show] do
      resources :data_sharings, only: [:new, :create]
      resources :incident_details, only: [:new, :create]
      resources :victims, only: [:index]
    end

    resources :documenter_details, only: [:new, :create]
  end

  resources :case_details, only: [:edit, :update]
end
