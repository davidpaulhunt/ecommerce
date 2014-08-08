Rails.application.routes.draw do

  get 'login' => 'sessions#new'
  resources :users
  resources :stores
end
