Rails.application.routes.draw do
  resources :cart_items
  devise_for :users,
  	controllers: {:registrations => "registrations"}
  resources :wishlists
  resources :credit_cards
  resources :carts do
    collection do
      get 'clear'
    end
  end
  resources :items do

  end
  resources :users
  resources :feedbacks
  resources :purchase_histories

  get '/buy_now', to: 'items#buy_now', as: 'button'
  get '/checkout', to: 'carts#checkout', as: 'checkout'
  get '/purchase', to: 'carts#purchase', as: 'purchase'
  post 'process_purchase', to: 'carts#process_purchase', as: 'process_purchase'
  post '/verify_otp', to: 'items#verify_otp', as: 'verify_otp'
  get '/requests', to: 'purchase_histories#requests', as: 'requests'
  post '/admin_response', to: 'purchase_histories#admin_response', as: 'admin_response'

  root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
