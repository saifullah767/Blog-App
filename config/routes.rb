Rails.application.routes.draw do

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
  resources :login, only: [:index, :show] do

  # root "users#index" 
  # get '/login', to: 'login#index'
  # get "/users/:user_id", to: "users#show" 
  # get "/users/:user_id/posts", to: "posts#index" 
  # get "/users/:user_id/posts/:id", to: "posts#show"
end
