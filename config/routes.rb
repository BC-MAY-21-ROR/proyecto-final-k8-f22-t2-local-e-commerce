Rails.application.routes.draw do
  resources :posts
  devise_for :users
  resources :users, only: [:show] do
    collection do
      get :profile
    end
  end
  root to: 'home#index'
end
