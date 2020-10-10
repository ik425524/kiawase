Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts, only: [:index, :show,]
  resources :topps, only: [:new, :create, :destroy, :edit, :update, :show] do
    member do
      get 'search'
    end
  end
  resources :bottoms, only: [:new, :create, :destroy, :edit, :update,:show] do
    member do
      get 'search'
    end
  end
end
