Rails.application.routes.draw do

  root "users#index" 
  get '/login', to: 'login#index'
  get "/users/:user_id", to: "users#show" 
  get "/users/:user_id/posts", to: "posts#index" 
  get "/users/:user_id/posts/:id", to: "posts#show"
end
