Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :venues, only: :show do
    resources :reviews, only: [:new, :create, :index]
    resources :bookings, except: [:index]
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
