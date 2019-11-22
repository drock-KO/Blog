Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'tweets#index'
  resources :tweets
  resources :users 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
