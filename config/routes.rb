Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  resources :completions, only: [:index, :create, :update, :destroy]

  resources :tutorials

  root to: "home#index"
end
