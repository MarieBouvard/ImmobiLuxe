Rails.application.routes.draw do
  
  devise_for :accounts
  resources :houses
  resources :posts

  get "/blog" => "posts#latest", as: :blog
  get  "/accounts" => 'admins#accounts', as: :accounts
  get "/properties" => 'publics#index', as: :properties
  get  "/dashboard" => 'dashboards#index', as: :dashboard
  get  "/profile/:id" => 'dashboards#profile', as: :profile

  post "/agent/message" => 'houses#email_agent', as: :email_agent
  
  root to: 'publics#main'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
