Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/help'
  get 'static_pages/contact'
  
  get '/signup',   to: "users#new"
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
