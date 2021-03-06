Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :post_comments, only: [:create]
  resources :user_comments, only: [:create]
  resources :carts, only: [ :index]
  resources :order, only: [:show]
  resources :carts, only: [:index]
  resources :users, only: [:show] do
    collection do
      get :profile
      get :favorites
      get :purchases
      get :posts
      get :sold
    end
    member do
      put :update_avatar
      put :update_cover
    end
  end
  get 'post/:id/new_comment', to: 'post_comments#new', as: 'new_comment'
  get 'user/:id/new_comment', to: 'user_comments#new', as: 'new_comment_user'
  post 'post/:id/buy_product', to: 'order#buy', as: 'buy_product'
  post 'post/:id/add_cart', to: 'carts#add', as: 'add_product'
  put 'carts/buy', to: 'carts#buy', as: 'buy_cart'
  delete 'carts/delete/:id', to: 'carts#delete', as: 'delete_product'
  get 'carts/show/:id', to: 'carts#show', as: 'show_product_cart'
  root to: 'home#index'
  put 'posts/:id/favorite', to: 'favorites#change_favorite', as: 'favorite'
  get '/search', to: 'home#results', as: 'search'
  put 'posts/delete/:id', to: 'posts#delete', as: 'delete_post'
end
