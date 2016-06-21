Rails.application.routes.draw do
  root "static_pages#home"
  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :questions
  resources :users, except: [:index, :destroy]
  resources :lessons, except: [:destroy, :edit]

  namespace :admin do
    resources :users, only: [:show, :destroy]
    resources :subjects, only: [:new, :create]
    resources :questions
  end
end
