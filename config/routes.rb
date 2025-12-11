Rails.application.routes.draw do
  devise_for :users

  # Página inicial da aplicação (equivalente ao <Route path="/" element={<Welcome />} /> ou <Index />)
  root to: "pages#home"

  # Healthcheck
  get "up" => "rails/health#show", as: :rails_health_check

  # Páginas estáticas / de fluxo (equivalentes às pages do React)
  get "/welcome",        to: "pages#welcome"
  get "/auth",           to: "pages#auth"
  get "/select-role",    to: "pages#select_role"
  get "/onboarding",     to: "pages#onboarding"
  get "/home",           to: "pages#home"             # opcional, mesmo que root
  get "/patient-profile", to: "pages#patient_profile"
  get "/patient-home",    to: "pages#patient_home"
  get "/reports",         to: "pages#reports"
  get "/settings",        to: "pages#settings"
  get "/edit-profile",    to: "pages#edit_profile"

  # Catch-all para páginas não encontradas (equivalente ao <Route path="*" element={<NotFound />} />)
  match "*path", to: "pages#not_found", via: :all

  # Domínio principal já existente
  resources :patients, only: ["index", "show"] do
    resources :medications, only: ["create", "show"]
    resources :appointments, only: ["create", "show"]
  end
end
