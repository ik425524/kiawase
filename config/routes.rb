Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  post '/posts/guest_sign_in', to: 'posts#new_guest'
  resources :posts, only: [:index, :show,] do
    member do
      get 'list_show'
    end
  end
  resources :topps, except: [:index] do
    member do
      get 'search'
    end
  end
  resources :bottoms, except: [:index] do
    member do
      get 'search'
    end
  end
end
