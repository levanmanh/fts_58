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
    resources :subjects, only: [:new, :create, :show]
    resources :questions, except: [:new, :edit, :destroy]
    resources :lessons
  end
end
