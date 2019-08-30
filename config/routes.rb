Rails.application.routes.draw do
  devise_for :accounts
  root to: 'dashboard#index'

  resources :devices, only: :index

  mount API => '/'
end
