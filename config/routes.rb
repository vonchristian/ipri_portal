Rails.application.routes.draw do
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

    resources :documenter_details,      only: [:new, :create]
  end

  namespace :admin do
    get "/login", to: "sessions#new"
    post "/sessions", to: "sessions#create"
    delete "/sessions", to: "sessions#destroy"
    resources :dashboard, only: [:index]
    resources :documenters, only: [:index, :show, :new, :create]
    resources :admin_users, only: [:index, :show, :new, :create]
  end

  namespace :documenters do
    get "/login", to: "sessions#new"
    post "/sessions", to: "sessions#create"
    delete "/sessions", to: "sessions#destroy"
    resources :dashboard, only: [:index]
    resources :case_details, only: [:index, :new]
  end
end
