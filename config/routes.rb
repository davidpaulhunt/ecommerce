Rails.application.routes.draw do

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  resources :users
  resources :stores
  resources :products
  resources :product_categories

end
