Rails.application.routes.draw do
  root "static_pages#home"
  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :questions
  resources :users, except: [:index, :destroy]
  resources :lessons

  namespace :admin do
    resources :users
    resources :lessons, only: [:index]
    resources :subjects
    resources :questions
  end
end
