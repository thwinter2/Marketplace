Rails.application.routes.draw do
  devise_for :users
  resources :wishlists
  resources :credit_cards
  resources :carts
  resources :items
  resources :users

  get '/buy_now', to: 'carts#buy_now', as: 'button'

  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
