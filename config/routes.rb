Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
  require "sidekiq/web"
    authenticate :user, ->(user) { user.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end

  root to: 'pages#home'
  get '/shortlist', to: 'pages#shortlist', as: :shortlist
  get '/profile', to: 'pages#profile', as: :profile
  get '/map', to: 'pages#map', as: :map
  resources :bookings, only: [:index] do
    member do
      post :accept
      post :reject
    end
    resources :reviews, only: [:show, :new, :create, :edit, :update]
  end
  resources :venues, only: :show do
    resources :reviews, only: [:index, :new]
    resources :bookings, except: [:index] do
      resources :chatrooms, only: [:show] do
        resources :messages, only: :create
      end
    end
  end
end
