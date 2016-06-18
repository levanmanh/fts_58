Rails.application.routes.draw do
  root "static_pages#home"
  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :questions
  resources :users, except: [:index, :destroy]
  resources :lessons, only: [:index]

  namespace :admin do
    resources :users
    resources :subjects, only: [:new, :create]
    resources :questions, only: [:new, :create]
  end
end
