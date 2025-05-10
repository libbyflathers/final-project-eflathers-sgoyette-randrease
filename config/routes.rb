Rails.application.routes.draw do
  resources :categories
  resources :to_dos
  
  
  root "home#index"

  get "home/index"
  get "home/contactus"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get '/completed_todos', to: 'to_dos#completed', as: 'completed_todos'
  

  resources :to_dos do
    member do
      patch :complete
    end
  end

  resources :users
  
end
