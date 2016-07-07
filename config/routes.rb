Rails.application.routes.draw do
  root "static_pages#home"
  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :questions
  resources :lessons
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]

  namespace :admin do
    resources :users
    resources :subjects
    resources :questions
    resources :lessons
  end
end
