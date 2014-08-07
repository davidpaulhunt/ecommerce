Rails.application.routes.draw do

  get 'login' => 'sessions#new'
  resources :users
end
