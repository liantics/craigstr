Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :posts, only: [:show, :edit, :index, :update, :destroy] do
    resource :spam, only: [:create]
  end

  resources :locations, only: [:new, :create, :index, :show] do
    resources :categories, only: [:new, :create, :index]
    resources :posts, only: [:create]
  end

  get "/sign_in", to: "sessions#new"
  get "/sign_up", to: "users#new"

  root to: "posts#index"
end
