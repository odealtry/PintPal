Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/users/:id/shortlist', to: 'pages#shortlist', as: :shortlist
  # get '/users/:id/bookings', to: 'bookings#user_bookings', as: :user_bookings
  resources :bookings, only: [:index]
  resources :venues, only: :show do
    resources :reviews, only: [:new, :create, :index]
    resources :bookings, except: [:index]
  end
end
