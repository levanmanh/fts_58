Rails.application.routes.draw do
  root "static_pages#home"
  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :users, only: [:new, :create]
  resources :questions

  namespace :admin do
    resources :subjects, only: [:new, :create]
    resources :questions, only: [:new, :create]
  end
end
