Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts, only: [:index, :show,]
  resources :topps, only: [:new, :create, :destroy, :show]
  resources :bottoms, only: [:new, :create, :destroy, :show]
end
