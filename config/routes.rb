Rails.application.routes.draw do
  resources :posts
  resources :comments

  get "home/index"
  get "/profile" => "home#profile"


  devise_for :users
  root to: "home#index"

end