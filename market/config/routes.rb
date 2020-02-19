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

  root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
