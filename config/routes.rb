Rails.application.routes.draw do
  get 'chatrooms/show'
  devise_for :users do
    resources :providers, only: %i[new create edit update destroy]
  end

  # resources :chatrooms, only: %i[new show] do
    # resources :messages, only: :create
  # end

  get '/users/:id', to: 'users#profile', as: 'profile'
  # get '/users/:id/bookings/new', to: 'bookings#new', as: 'booking'
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :services do
    # resources :bookings, only: %i[new create]
    resources :reviews, only: %i[new create]
  end
  resources :users do
    resources :bookings, only: %i[new create]
    resources :chatrooms, only: %i[create new show] do
      resources :messages, only: :create
    end
  end
  resources :providers
  resources :bookings, except: %i[new create]
end
