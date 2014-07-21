Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :posts, only: [:index]
  resources :locations, only: [:new, :create, :index]

  get "/sign_in", to: "sessions#new"
  get "/sign_up", to: "users#new"

  root to: "posts#index"
end
