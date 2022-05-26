Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :post_comments, only: [:create]
  resources :order, only: [:index, :show]
  resources :carts, only: [:index, :show]
  resources :users, only: [:show] do
    collection do
      get :profile
      get :favorites
      get :notifications
      get :messages
      get :purchases
      get :sold
    end
    member do
      get :seller
    end
  end
  get 'post/:id/new_comment', to: 'post_comments#new', as: 'new_comment'
  post 'post/:id/buy_product', to: 'order#buy', as: 'buy_product'
  post 'post/:id/add_cart', to: 'carts#add', as: 'add_product'
  root to: 'home#index'
end
