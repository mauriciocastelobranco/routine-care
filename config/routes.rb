Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get "/auth", to: "pages#auth"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :patients, only: ["index", "show"] do
    resources :medications, only: ["create", "show"]
    resources :appointments, only: ["create", "show"]
  end
end
