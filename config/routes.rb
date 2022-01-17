Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :fact_sheets do
    resources :temp_fact_sheets, only: [:show] do
      resources :data_sharing_agreements, only: [:new, :create]
      resources :incident_details,        only: [:new, :create]
      resources :victims,                 only: [:index]
      resources :individual_victims,      only: [:new, :create]
      resources :collective_victims,      only: [:new, :create]
      resources :human_rights_violations, only: [:index]
      resources :criminalizations,        only: [:new, :create]
    end

    resources :documenter_details,      only: [:new, :create]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
