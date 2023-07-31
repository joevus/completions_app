Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  
  resources :users, only: [:index, :show, :update, :destroy]

  resources :completions, only: [:index, :create, :update, :destroy]

  resources :tutorials

  root to: "home#index"
end

#   resources :winners, :only => [:create, :index] do
  # get :board, :on => :collection
  # end