Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :post_comments, only: [:create]
<<<<<<< HEAD
  resources :order, only: [:index, :show]
  resources :carts, only: [:index, :show]
=======
  resources :order, only: [:show]
>>>>>>> 914a8cae8a0f20211695b0b91806f977b4dd494f
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
      put :update_avatar
      put :update_cover
    end
  end
<<<<<<< HEAD
  get 'post/:id/new_comment', to: 'post_comments#new', as: 'new_comment'
  post 'post/:id/buy_product', to: 'order#buy', as: 'buy_product'
  post 'post/:id/add_cart', to: 'carts#add', as: 'add_product'
=======
  get 'posts/:id/new_comment', to: 'post_comments#new', as: 'new_comment'
  post 'posts/:id/buy_product', to: 'order#buy', as: 'buy_product' 
>>>>>>> 914a8cae8a0f20211695b0b91806f977b4dd494f
  root to: 'home#index'
end
