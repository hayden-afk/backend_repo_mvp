Rails.application.routes.draw do
  resources :users
  resources :comments
  resources :posts



  get "/users", to:"users#index"
  get "/users/:id", to: "users#show"
  post "/users", to: "users#create"
  patch "/users/:id", to: "users#update"
  delete "users/:id", to: "users#destroy"

  resources :users, expcet: [:index]



  post "/login", to: "application#login"



end
