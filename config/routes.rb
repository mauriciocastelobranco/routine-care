Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
resources :caregivers, only: [:create]

resources :patients, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
  resources :cares, only: [:create, :destroy]
  resources :medications, only: [:create, :show, :edit, :update, :destroy]
  resources :appointments, only: [:create, :show, :edit, :update, :destroy]
  resources :caregivers, only: [:create, :destroy]
  resources :chats
end


namespace :caregiver do
  resources :patients, only: [:index, :show] do
    resources :chats, only: [:create]
  end

  resources :chats, only: [:show, :destroy]
end

  resources :chats, only: :show do
    resources :messages, only: [:create]
  end

end
