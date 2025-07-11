# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :test_helpers do
    post "sign_in", to: "sessions#create"
  end

  namespace :admin do
    resources :case_details do
      resources :rights_violations, only: [:index, :show, :new, :create, :edit, :update, :destroy]
      resources :collective_victims
      resources :individual_victims
      resources :criminalizations
      resources :killings
    end
    resources :rights_violations, shallow: true do
      resources :perpetratorizations
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  begin
    ActiveAdmin.routes(self)
  rescue
    ActiveAdmin::DatabaseHitDuringLoad
  end

  root "documenters/sessions#new"

  resources :development_projects, only: [:show, :edit, :update]
  resources :case_details, except: [:destroy] do
    resources :victims, only: [:index], controller: "case_details/victims"
    resources :individual_victims, only: [:new, :create], controller: "case_details/individual_victims"
    resources :collective_victims, only: [:new, :create], controller: "case_details/collective_victims"
    resources :criminalizations, only: [:index, :new, :create, :edit, :update], controller: "case_details/criminalizations"
    resources :human_rights_violations, only: [:index, :new, :create, :edit, :update], controller: "case_details/human_rights_violations"
    resources :killings, only: [:index, :new, :create, :edit, :update], controller: "case_details/killings"
    resources :development_projects, only: [:index, :new, :create], controller: "case_details/development_projects"
    resources :tags, only: [:index, :create], controller: "case_details/tags"
  end

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
      resources :submissions, only: [:create]
    end

    resources :documenter_details, only: [:new, :create]
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
    resources :collective_victims, only: [:index, :show, :edit, :update]
    resources :case_details, only: [:index, :new, :show] do
      resources :individual_victims, only: [:new, :create, :show, :edit, :update, :index], controller: "case_details/individual_victims"
      resources :collective_victims, only: [:new, :create, :edit, :update, :show, :index], controller: "case_details/collective_victims"
      resources :criminalizations, only: [:index, :new, :create, :edit, :update, :show], controller: "case_details/criminalizations"
      resources :human_rights_violations, only: [:index, :new, :create, :edit, :update], controller: "case_details/human_rights_violations"
      resources :killings, only: [:index, :new, :create, :edit, :update], controller: "case_details/killings"
      resources :development_projects, only: [:index, :new, :create, :show, :edit, :update], controller: "case_details/development_projects"
      resources :tags, only: [:create, :destroy], controller: "case_details/tags"
    end
  end

  resources :countries, only: [:index, :show] do
    resources :killings, only: [:index], controller: "countries/killings"
    resources :criminalizations, only: [:index], controller: "countries/criminalizations"
    resources :human_rights_violations, only: [:index], controller: "countries/human_rights_violations"
  end

  resources :killings, only: [:index, :show, :edit, :update]
  resources :criminalizations, only: [:index]
  resources :human_rights_violations, only: [:index]

  resources :case_details, only: [:edit, :update] do
    resources :development_projects, only: [:new, :create], controller: "case_details/development_projects"
  end
end
