Rails.application.routes.draw do
  resources :categories
  resources :to_dos
  
  
  root "home#index"

  get "home/index"
  get "home/about"
  get "home/contactus"
  get "home/help"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  resources :microposts do
    member do
      get :like
    end
  end

  resources :users

  #get 'microposts/:id/like' => 'microposts#like', as: :likeAPost
  
end
