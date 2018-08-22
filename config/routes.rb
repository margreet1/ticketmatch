Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :matches, only: [:index, :show] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:destroy]

  resources :seats, only: [:new, :create]

  get 'dashboard', to: 'pages#dashboard'

  # get 'matches', to: 'match#index'
  # get 'matches/:id', to: 'match#show'
  # get 'matches/new', to: 'match#new'
  # post 'matches', to: 'match#create'

  # get 'matches/:id/match_tickets', to: 'match_tickets#index'
  # get 'matches/:id/match_tickets/:match_ticket_id', to: 'match_tickets#show'
  # get 'matches/:id/match_tickets/new', to: 'match_ticket#new'
  # post 'matches/:id/match_tickets', to: 'match_ticket#create'

  # get 'users/:id', to: 'user#show'
  # get 'users/:id/seats/new', to: 'seat#new'
  # post 'users/:id/seats', to: 'seat#create'

  # get 'users/:id/bookings/new', to: 'bookings#new'
  # post 'users/:id/bookings/create', to: 'bookings#create'

  # get 'matches/:id/match_tickets/:match_ticket_id/bookings/new', to: 'bookings#new'
  # post 'matches/:id/match_tickets/:match_ticket_id/bookings', to: 'bookings#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
