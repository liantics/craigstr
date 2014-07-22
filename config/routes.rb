Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :posts, only: [:index, :create, :update, :destroy]
  resources :locations, only: [:new, :create, :index, :show]

  get "/sign_in", to: "sessions#new"
  get "/sign_up", to: "users#new"

  root to: "posts#index"
end
