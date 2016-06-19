Rails.application.routes.draw do
  root "static_pages#home"
  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :questions
  resources :users, except: [:index, :destroy]

  namespace :admin do
    resources :users, only: [:show, :destroy]
    resources :subjects
    resources :questions, only: [:new, :create]
  end
end
