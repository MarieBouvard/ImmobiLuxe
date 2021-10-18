Rails.application.routes.draw do


  resources :posts
  resources :houses
  get  "/dashboard" => 'dashboard#index', as: :dashboard
  
  devise_for :accounts
  root to: "publics#main"
end
