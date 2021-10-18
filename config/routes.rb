Rails.application.routes.draw do


  get  "/dashboard" => 'dashboard#index', as: :dashboard
  
  devise_for :accounts
  root to: "publics#main"
end
