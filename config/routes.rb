Rails.application.routes.draw do
  devise_for :accounts
  root to: 'dashboard#index'

  mount API => '/'
end
