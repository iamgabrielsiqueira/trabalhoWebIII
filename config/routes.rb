Rails.application.routes.draw do
  resources :reservations
  devise_for :users
  resources :cities
  resources :states
  resources :rooms
  get 'home/index'
  root 'home#index'
  resources :room_types
  resources :my_reservations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
