Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :completions, only: [:index, :create, :update, :destroy]

  resources :tutorials

  root to: "home#index"
end
