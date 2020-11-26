Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/users/:id/shortlist', to: 'pages#shortlist', as: :shortlist
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
