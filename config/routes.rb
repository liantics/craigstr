Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resource :search, only: [:show]

  resources :posts, only: [:index, :update, :destroy, :show, :edit] do
    resource :spam, only: [:create]
    resources :images, only: [:new, :create]
  end
  

  resources :locations, only: [:new, :create, :index, :show] do
    resources :categories, only: [:show, :new, :create, :index]
    resources :posts, only: [:create]
  end

  get "/sign_in", to: "sessions#new"
  get "/sign_up", to: "users#new"

  root to: "posts#index"
end
