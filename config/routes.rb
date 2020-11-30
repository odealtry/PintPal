Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, :controllers => { :registrations => :registrations }
  root to: 'pages#home'
  get '/shortlist', to: 'pages#shortlist', as: :shortlist
  get '/profile', to: 'pages#profile', as: :profile
  post '/bookings/:id', to: 'bookings#accept_booking', as: :accept_booking
  resources :bookings, only: [:index]
  resources :venues, only: :show do
    resources :reviews, only: [:new, :create, :index]
    resources :bookings, except: [:index] do
      resources :chatrooms, only: [:show] do
        resources :messages, only: :create
      end
    end
  end
end
