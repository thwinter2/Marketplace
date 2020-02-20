Rails.application.routes.draw do
  devise_for :users,
  	controllers: {:registrations => "registrations"}
  resources :wishlists
  resources :credit_cards
  resources :carts
  resources :items do

  end
  resources :users
  resources :feedbacks
  resources :purchase_histories

  get '/buy_now', to: 'items#buy_now', as: 'button'
  put '/verify_otp', to: 'items#verify_otp', as: 'verify_otp'

  root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
